import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/purchases/data/entitlements_repository_provider.dart';
import 'package:life_battery/src/features/purchases/data/purchases_repository_provider.dart';
import 'package:life_battery/src/features/purchases/domain/premium_plan.dart';
import 'package:life_battery/src/features/purchases/domain/premium_products.dart';
import 'package:life_battery/src/features/purchases/domain/premium_purchase_status.dart';
import 'package:life_battery/src/features/purchases/domain/purchase_outcome.dart';
import 'package:life_battery/src/features/purchases/domain/store_entitlement.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/is_premium_provider.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/purchase_updates_provider.dart';

import '../../../../../test_helpers/fake_analytics.dart';
import '../../../../../test_helpers/fake_entitlements.dart';
import '../../../../../test_helpers/fake_purchases.dart';

void main() {
  late FakePurchasesApiDataSource fakeApi;
  late FakeEntitlementsLocalDataSource fakeEntitlements;
  late FakeAnalyticsApiDataSource fakeAnalytics;
  late ProviderContainer container;

  PremiumOffer lifetimeOffer() =>
      (plan: PremiumPlan.lifetime, product: fakeApi.lifetimeProduct!);

  PremiumOffer monthlyOffer() =>
      (plan: PremiumPlan.monthly, product: fakeApi.monthlyProduct!);

  /// A store entitlement for the lifetime plan, or for [productId] when
  /// given. A monthly entitlement expires 30 days from now by default.
  StoreEntitlement buildEntitlement({String? productId, DateTime? expiresAt}) {
    final id = productId ?? PremiumPlan.lifetime.productId;
    return StoreEntitlement(
      productId: id,
      expiresAt:
          expiresAt ??
          (id == PremiumPlan.monthly.productId
              ? DateTime.now().add(const Duration(days: 30))
              : null),
    );
  }

  setUp(() {
    fakeApi = FakePurchasesApiDataSource();
    fakeEntitlements = FakeEntitlementsLocalDataSource();
    fakeAnalytics = FakeAnalyticsApiDataSource();
    container = ProviderContainer(
      overrides: [
        purchasesApiDataSourceProvider.overrideWithValue(fakeApi),
        entitlementsLocalDataSourceProvider.overrideWithValue(
          fakeEntitlements,
        ),
        analyticsApiDataSourceProvider.overrideWithValue(fakeAnalytics),
      ],
    );
    addTearDown(container.dispose);
    container.read(purchaseUpdatesProvider);
  });

  PremiumPurchaseStatus status() => container.read(purchaseUpdatesProvider);

  PurchaseUpdates notifier() =>
      container.read(purchaseUpdatesProvider.notifier);

  Future<void> emit({
    String? productId,
    DateTime? expiresAt,
    bool entitled = true,
  }) async {
    fakeApi.controller.add(
      entitled
          ? buildEntitlement(productId: productId, expiresAt: expiresAt)
          : null,
    );
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);
  }

  group('Entitlement updates', () {
    test('Reports purchased and grants premium on a new entitlement', () async {
      await emit();

      expect(status(), PremiumPurchaseStatus.purchased);
      expect(fakeEntitlements.isPremium, isTrue);
    });

    test('Grants premium on a support plan entitlement', () async {
      await emit(productId: PremiumPlan.lifetimeSupport.productId);

      expect(status(), PremiumPurchaseStatus.purchased);
      expect(fakeEntitlements.isPremium, isTrue);
      expect(fakeEntitlements.entitlement.hasLifetime, isTrue);
    });

    test('Ignores entitlements of unrelated products', () async {
      await emit(productId: 'other_product');

      expect(status(), PremiumPurchaseStatus.none);
      expect(fakeEntitlements.isPremium, isFalse);
    });

    test('Does nothing when the store reports no entitlement', () async {
      await emit(entitled: false);

      expect(status(), PremiumPurchaseStatus.none);
      expect(fakeEntitlements.isPremium, isFalse);
    });

    test(
      'Does not revoke premium when the store reports no entitlement',
      () async {
        fakeEntitlements.isPremium = true;

        await emit(entitled: false);

        expect(fakeEntitlements.isPremium, isTrue);
      },
    );

    test(
      'Does not report a purchase for an already stored entitlement',
      () async {
        fakeEntitlements.isPremium = true;

        await emit();

        expect(status(), PremiumPurchaseStatus.none);
      },
    );

    test('Grants a time-limited entitlement on a monthly update', () async {
      final expiresAt = DateTime.now().add(const Duration(days: 30));

      await emit(
        productId: PremiumPlan.monthly.productId,
        expiresAt: expiresAt,
      );

      final entitlement = fakeEntitlements.entitlement;
      expect(entitlement.hasLifetime, isFalse);
      expect(entitlement.subscriptionExpiresAt, expiresAt);
      expect(status(), PremiumPurchaseStatus.purchased);
    });

    test('An older monthly update does not rewind the expiry', () async {
      await emit(productId: PremiumPlan.monthly.productId);
      final expiryAfterPurchase =
          fakeEntitlements.entitlement.subscriptionExpiresAt;

      await emit(
        productId: PremiumPlan.monthly.productId,
        expiresAt: DateTime.now().subtract(const Duration(days: 60)),
      );

      expect(
        fakeEntitlements.entitlement.subscriptionExpiresAt,
        expiryAfterPurchase,
      );
      expect(await container.read(isPremiumProvider.future), isTrue);
    });

    test(
      'Logs subscription_renew when an active subscription is extended',
      () async {
        await emit(productId: PremiumPlan.monthly.productId);
        await emit(
          productId: PremiumPlan.monthly.productId,
          expiresAt: DateTime.now().add(const Duration(days: 60)),
        );

        expect(fakeAnalytics.subscriptionRenewCount, 1);
        expect(fakeAnalytics.purchaseCompletes, isEmpty);
      },
    );

    test(
      'Does not log subscription_renew on the first subscription update',
      () async {
        await emit(productId: PremiumPlan.monthly.productId);

        expect(fakeAnalytics.subscriptionRenewCount, 0);
      },
    );

    test('Does not log subscription_renew for a lifetime update', () async {
      await emit();

      expect(fakeAnalytics.subscriptionRenewCount, 0);
    });

    test('Refreshes isPremium after an entitlement update', () async {
      expect(await container.read(isPremiumProvider.future), isFalse);

      await emit();

      expect(await container.read(isPremiumProvider.future), isTrue);
    });
  });

  group('Purchase', () {
    test('Reports purchased and grants premium', () async {
      await notifier().buyPremium(lifetimeOffer());

      expect(status(), PremiumPurchaseStatus.purchased);
      expect(fakeEntitlements.isPremium, isTrue);
      expect(fakeApi.boughtProducts, [fakeApi.lifetimeProduct]);
      expect(await container.read(isPremiumProvider.future), isTrue);
    });

    test('Logs purchase_start and purchase_complete with the plan', () async {
      await notifier().buyPremium(monthlyOffer());

      expect(fakeAnalytics.purchaseStarts, [PremiumPlan.monthly]);
      expect(fakeAnalytics.purchaseCompletes, [PremiumPlan.monthly]);
    });

    test('Grants a time-limited entitlement on a monthly purchase', () async {
      await notifier().buyPremium(monthlyOffer());

      final entitlement = fakeEntitlements.entitlement;
      expect(entitlement.hasLifetime, isFalse);
      expect(entitlement.isActive(DateTime.now()), isTrue);
    });

    test(
      'Does not log subscription_renew for a purchase while subscribed',
      () async {
        await fakeEntitlements.markSubscribedUntil(
          DateTime.now().add(const Duration(days: 10)),
        );

        await notifier().buyPremium(monthlyOffer());

        expect(fakeAnalytics.subscriptionRenewCount, 0);
        expect(fakeAnalytics.purchaseCompletes, [PremiumPlan.monthly]);
      },
    );

    test('Reports pending while the purchase awaits approval', () async {
      fakeApi.purchaseOutcome = PurchaseOutcome.pending;

      await notifier().buyPremium(lifetimeOffer());

      expect(status(), PremiumPurchaseStatus.pending);
      expect(fakeEntitlements.isPremium, isFalse);
      expect(fakeAnalytics.purchaseCompletes, isEmpty);
    });

    test('Reports canceled and logs purchase_cancel', () async {
      fakeApi.purchaseOutcome = PurchaseOutcome.canceled;

      await notifier().buyPremium(lifetimeOffer());

      expect(status(), PremiumPurchaseStatus.canceled);
      expect(fakeAnalytics.purchaseCancels, [PremiumPlan.lifetime]);
      expect(fakeAnalytics.purchaseCompletes, isEmpty);
    });

    test('Reports error and logs purchase_error', () async {
      fakeApi.purchaseOutcome = PurchaseOutcome.error;

      await notifier().buyPremium(monthlyOffer());

      expect(status(), PremiumPurchaseStatus.error);
      expect(fakeAnalytics.purchaseErrors, [PremiumPlan.monthly]);
      expect(fakeEntitlements.isPremium, isFalse);
    });
  });

  group('Restore', () {
    test('Reports restored and grants premium', () async {
      fakeApi.restoredEntitlement = buildEntitlement();

      await notifier().restorePurchases();

      expect(status(), PremiumPurchaseStatus.restored);
      expect(fakeEntitlements.isPremium, isTrue);
      expect(fakeApi.restoreCallCount, 1);
      expect(fakeAnalytics.purchaseCompletes, isEmpty);
    });

    test('Reports restored for an already stored entitlement', () async {
      fakeEntitlements.isPremium = true;
      fakeApi.restoredEntitlement = buildEntitlement();

      await notifier().restorePurchases();

      expect(status(), PremiumPurchaseStatus.restored);
    });

    test('Reports nothing when there is nothing to restore', () async {
      await notifier().restorePurchases();

      expect(status(), PremiumPurchaseStatus.none);
      expect(fakeEntitlements.isPremium, isFalse);
    });

    test('Ignores restored entitlements of unrelated products', () async {
      fakeApi.restoredEntitlement = buildEntitlement(
        productId: 'other_product',
      );

      await notifier().restorePurchases();

      expect(status(), PremiumPurchaseStatus.none);
    });

    test('Reports error when the restore fails', () async {
      fakeApi.restoreOutcome = PurchaseOutcome.error;

      await notifier().restorePurchases();

      expect(status(), PremiumPurchaseStatus.error);
    });

    test('An expired monthly restore does not grant premium', () async {
      fakeApi.restoredEntitlement = buildEntitlement(
        productId: PremiumPlan.monthly.productId,
        expiresAt: DateTime.now().subtract(const Duration(days: 60)),
      );

      await notifier().restorePurchases();

      expect(fakeEntitlements.entitlement.subscriptionExpiresAt, isNotNull);
      expect(await container.read(isPremiumProvider.future), isFalse);
    });
  });
}
