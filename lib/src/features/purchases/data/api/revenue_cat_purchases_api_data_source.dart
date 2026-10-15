import 'dart:async';

import 'package:flutter/services.dart';
import 'package:life_battery/src/features/purchases/data/api/purchases_api_data_source.dart';
import 'package:life_battery/src/features/purchases/domain/premium_plan.dart';
import 'package:life_battery/src/features/purchases/domain/purchase_outcome.dart';
import 'package:life_battery/src/features/purchases/domain/store_entitlement.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevenueCatPurchasesApiDataSource implements PurchasesApiDataSource {
  const RevenueCatPurchasesApiDataSource();

  /// The entitlement identifier configured on the RevenueCat dashboard.
  static const _entitlementId = 'premium';

  @override
  Stream<StoreEntitlement?> get entitlementStream {
    late final StreamController<StoreEntitlement?> controller;
    void onCustomerInfo(CustomerInfo customerInfo) {
      controller.add(_premiumEntitlement(customerInfo));
    }

    controller = StreamController(
      onListen: () => Purchases.addCustomerInfoUpdateListener(onCustomerInfo),
      onCancel: () {
        Purchases.removeCustomerInfoUpdateListener(onCustomerInfo);
        return controller.close();
      },
    );
    return controller.stream;
  }

  @override
  Future<bool> isAvailable() async {
    if (!await Purchases.isConfigured) return false;
    return Purchases.canMakePayments();
  }

  @override
  Future<List<StoreProduct>> fetchPremiumProducts() async {
    // The category only matters on Google Play, where subscriptions and
    // one-time products are looked up separately.
    final results = await Future.wait([
      Purchases.getProducts([PremiumPlan.monthly.productId]),
      Purchases.getProducts(
        [PremiumPlan.lifetime.productId],
        productCategory: ProductCategory.nonSubscription,
      ),
    ]);
    return results.expand((products) => products).toList();
  }

  @override
  Future<({PurchaseOutcome outcome, StoreEntitlement? entitlement})> purchase({
    required StoreProduct product,
  }) async {
    try {
      final result = await Purchases.purchase(
        PurchaseParams.storeProduct(product),
      );
      return (
        outcome: PurchaseOutcome.completed,
        entitlement: _premiumEntitlement(result.customerInfo),
      );
    } on PlatformException catch (error) {
      final outcome = _userOutcome(error);
      if (outcome == null) rethrow;
      return (outcome: outcome, entitlement: null);
    }
  }

  @override
  Future<({PurchaseOutcome outcome, StoreEntitlement? entitlement})>
  restorePurchases() async {
    try {
      final customerInfo = await Purchases.restorePurchases();
      return (
        outcome: PurchaseOutcome.completed,
        entitlement: _premiumEntitlement(customerInfo),
      );
    } on PlatformException catch (error) {
      final outcome = _userOutcome(error);
      if (outcome == null) rethrow;
      return (outcome: outcome, entitlement: null);
    }
  }

  StoreEntitlement? _premiumEntitlement(CustomerInfo customerInfo) {
    final entitlement = customerInfo.entitlements.active[_entitlementId];
    if (entitlement == null) return null;
    return StoreEntitlement(
      productId: entitlement.productIdentifier,
      expiresAt: DateTime.tryParse(entitlement.expirationDate ?? ''),
    );
  }

  /// Null when the error is not a user decision, so that the repository
  /// records it.
  PurchaseOutcome? _userOutcome(PlatformException error) {
    final code = int.tryParse(error.code) == null
        ? PurchasesErrorCode.unknownError
        : PurchasesErrorHelper.getErrorCode(error);
    if (code == PurchasesErrorCode.purchaseCancelledError) {
      return PurchaseOutcome.canceled;
    }
    if (code == PurchasesErrorCode.paymentPendingError) {
      return PurchaseOutcome.pending;
    }
    return null;
  }
}
