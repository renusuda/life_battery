import 'dart:async';

import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/purchases/data/entitlements_repository_provider.dart';
import 'package:life_battery/src/features/purchases/data/purchases_repository_provider.dart';
import 'package:life_battery/src/features/purchases/domain/premium_plan.dart';
import 'package:life_battery/src/features/purchases/domain/premium_products.dart';
import 'package:life_battery/src/features/purchases/domain/premium_purchase_status.dart';
import 'package:life_battery/src/features/purchases/domain/purchase_outcome.dart';
import 'package:life_battery/src/features/purchases/domain/store_entitlement.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/is_premium_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchase_updates_provider.g.dart';

/// keepAlive because entitlements can change outside the settings screen:
/// deferred purchases (Ask to Buy) may be approved days later and renewals
/// are delivered right after app start.
@Riverpod(keepAlive: true)
class PurchaseUpdates extends _$PurchaseUpdates {
  /// Set while a purchase or restore is in flight: the request reports its
  /// own outcome, so the entitlement update it triggers must neither change
  /// the status nor count as a renewal.
  bool _isRequestInFlight = false;

  /// Used when the store reports no expiry for the subscription: the longest
  /// monthly billing cycle plus a buffer for a renewal delivered late.
  static const _fallbackSubscriptionValidity = Duration(days: 34);

  @override
  PremiumPurchaseStatus build() {
    final repository = ref.watch(purchasesRepositoryProvider);
    final subscription = repository.entitlementStream.listen(
      _onEntitlementUpdate,
    );
    ref.onDispose(subscription.cancel);
    return PremiumPurchaseStatus.none;
  }

  Future<void> buyPremium(PremiumOffer offer) async {
    unawaited(
      ref.read(analyticsRepositoryProvider).logPurchaseStart(plan: offer.plan),
    );
    _isRequestInFlight = true;
    try {
      final result = await ref
          .read(purchasesRepositoryProvider)
          .buyPremium(product: offer.product);
      switch (result.outcome) {
        case PurchaseOutcome.completed:
          await _storeEntitlement(result.entitlement);
          state = PremiumPurchaseStatus.purchased;
          unawaited(
            ref
                .read(analyticsRepositoryProvider)
                .logPurchaseComplete(plan: offer.plan),
          );
        case PurchaseOutcome.canceled:
          state = PremiumPurchaseStatus.canceled;
          unawaited(
            ref
                .read(analyticsRepositoryProvider)
                .logPurchaseCancel(plan: offer.plan),
          );
        case PurchaseOutcome.pending:
          state = PremiumPurchaseStatus.pending;
        case PurchaseOutcome.error:
          state = PremiumPurchaseStatus.error;
          unawaited(
            ref
                .read(analyticsRepositoryProvider)
                .logPurchaseError(plan: offer.plan),
          );
      }
    } finally {
      _isRequestInFlight = false;
    }
  }

  Future<void> restorePurchases() async {
    _isRequestInFlight = true;
    try {
      final result = await ref
          .read(purchasesRepositoryProvider)
          .restorePurchases();
      if (result.outcome != PurchaseOutcome.completed) {
        state = PremiumPurchaseStatus.error;
        return;
      }

      final entitlement = result.entitlement;
      if (entitlement == null) return;
      if (PremiumPlan.fromProductId(entitlement.productId) == null) return;

      await _storeEntitlement(entitlement);
      state = PremiumPurchaseStatus.restored;
    } finally {
      _isRequestInFlight = false;
    }
  }

  Future<void> _onEntitlementUpdate(StoreEntitlement? entitlement) async {
    // A lapsed subscription is handled by the stored expiry; the store
    // never revokes a stored entitlement.
    if (entitlement == null) return;

    final plan = PremiumPlan.fromProductId(entitlement.productId);
    final wasPremium = await ref
        .read(entitlementsRepositoryProvider)
        .isPremium();
    final hasChanged = await _storeEntitlement(entitlement);
    if (!hasChanged || _isRequestInFlight) return;

    if (wasPremium && plan == PremiumPlan.monthly) {
      unawaited(ref.read(analyticsRepositoryProvider).logSubscriptionRenew());
    } else {
      state = PremiumPurchaseStatus.purchased;
    }
  }

  Future<bool> _storeEntitlement(StoreEntitlement? entitlement) async {
    if (entitlement == null) return false;

    final repository = ref.read(entitlementsRepositoryProvider);
    final hasChanged = switch (PremiumPlan.fromProductId(
      entitlement.productId,
    )) {
      PremiumPlan.lifetime => await repository.markPremiumPurchased(),
      PremiumPlan.monthly => await repository.markPremiumSubscribed(
        expiresAt:
            entitlement.expiresAt ??
            DateTime.now().add(_fallbackSubscriptionValidity),
      ),
      null => false,
    };
    if (hasChanged) {
      ref.invalidate(isPremiumProvider);
    }
    return hasChanged;
  }
}
