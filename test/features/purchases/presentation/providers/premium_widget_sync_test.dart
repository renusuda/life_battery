import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/purchases/data/entitlements_repository_provider.dart';
import 'package:life_battery/src/features/purchases/data/purchases_repository_provider.dart';
import 'package:life_battery/src/features/purchases/domain/premium_entitlement.dart';
import 'package:life_battery/src/features/purchases/domain/premium_plan.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/premium_widget_sync_provider.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/purchase_updates_provider.dart';

import '../../../../../test_helpers/fake_analytics.dart';
import '../../../../../test_helpers/fake_entitlements.dart';
import '../../../../../test_helpers/fake_purchases.dart';

void main() {
  late FakePurchasesApiDataSource fakeApi;
  late FakeEntitlementsLocalDataSource fakeEntitlements;
  late FakeEntitlementsHomeWidgetDataSource fakeWidget;
  late FakeAnalyticsApiDataSource fakeAnalytics;
  late ProviderContainer container;

  setUp(() {
    fakeApi = FakePurchasesApiDataSource();
    fakeEntitlements = FakeEntitlementsLocalDataSource();
    fakeWidget = FakeEntitlementsHomeWidgetDataSource();
    fakeAnalytics = FakeAnalyticsApiDataSource();
    container = ProviderContainer(
      overrides: [
        purchasesApiDataSourceProvider.overrideWithValue(fakeApi),
        entitlementsLocalDataSourceProvider.overrideWithValue(
          fakeEntitlements,
        ),
        entitlementsHomeWidgetDataSourceProvider.overrideWithValue(fakeWidget),
        analyticsApiDataSourceProvider.overrideWithValue(fakeAnalytics),
      ],
    );
    addTearDown(container.dispose);
  });

  test('Syncs the locked state at startup when not entitled', () async {
    await container.read(premiumWidgetSyncProvider.future);

    expect(fakeWidget.syncedValues, [false]);
  });

  test('Syncs the unlocked state at startup when entitled', () async {
    fakeEntitlements.isPremium = true;

    await container.read(premiumWidgetSyncProvider.future);

    expect(fakeWidget.syncedValues, [true]);
    expect(fakeWidget.syncedExpiries, [null]);
  });

  test('Syncs the expiry of an active subscription', () async {
    final expiresAt = DateTime.now().add(const Duration(days: 10));
    fakeEntitlements.entitlement = PremiumEntitlement(
      hasLifetime: false,
      subscriptionExpiresAt: expiresAt,
    );

    await container.read(premiumWidgetSyncProvider.future);

    expect(fakeWidget.syncedValues, [true]);
    expect(fakeWidget.syncedExpiries, [expiresAt]);
  });

  test(
    'Syncs no expiry when a lifetime purchase outlives the subscription',
    () async {
      fakeEntitlements.entitlement = PremiumEntitlement(
        hasLifetime: true,
        subscriptionExpiresAt: DateTime.now().add(const Duration(days: 10)),
      );

      await container.read(premiumWidgetSyncProvider.future);

      expect(fakeWidget.syncedValues, [true]);
      expect(fakeWidget.syncedExpiries, [null]);
    },
  );

  test(
    'Syncs the locked state without an expiry once the subscription lapsed',
    () async {
      fakeEntitlements.entitlement = PremiumEntitlement(
        hasLifetime: false,
        subscriptionExpiresAt: DateTime.now().subtract(const Duration(days: 1)),
      );

      await container.read(premiumWidgetSyncProvider.future);

      expect(fakeWidget.syncedValues, [false]);
      expect(fakeWidget.syncedExpiries, [null]);
    },
  );

  test('Unlocks the widget after a purchase event', () async {
    container
      ..read(purchaseUpdatesProvider)
      ..listen(premiumWidgetSyncProvider, (_, _) {});
    await container.read(premiumWidgetSyncProvider.future);
    expect(fakeWidget.syncedValues, [false]);

    fakeApi.controller.add([
      buildPurchaseDetails(status: PurchaseStatus.purchased),
    ]);
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);

    expect(fakeWidget.syncedValues, [false, true]);
  });

  test('Syncs the expiry after a subscription purchase event', () async {
    container
      ..read(purchaseUpdatesProvider)
      ..listen(premiumWidgetSyncProvider, (_, _) {});
    await container.read(premiumWidgetSyncProvider.future);

    fakeApi.controller.add([
      buildPurchaseDetails(
        status: PurchaseStatus.purchased,
        productID: PremiumPlan.monthly.productId,
      ),
    ]);
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);

    expect(fakeWidget.syncedValues, [false, true]);
    expect(fakeWidget.syncedExpiries.last, isNotNull);
  });
}
