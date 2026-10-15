import 'package:life_battery/src/features/purchases/domain/purchase_outcome.dart';
import 'package:life_battery/src/features/purchases/domain/store_entitlement.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

abstract interface class PurchasesApiDataSource {
  /// Emits on every change, including renewals and deferred purchases
  /// approved while the app was closed.
  Stream<StoreEntitlement?> get entitlementStream;

  Future<bool> isAvailable();

  Future<List<StoreProduct>> fetchPremiumProducts();

  Future<({PurchaseOutcome outcome, StoreEntitlement? entitlement})> purchase({
    required StoreProduct product,
  });

  Future<({PurchaseOutcome outcome, StoreEntitlement? entitlement})>
  restorePurchases();
}
