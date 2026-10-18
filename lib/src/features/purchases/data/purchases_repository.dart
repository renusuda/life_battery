import 'package:collection/collection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:life_battery/src/features/purchases/data/api/purchases_api_data_source.dart';
import 'package:life_battery/src/features/purchases/domain/premium_plan.dart';
import 'package:life_battery/src/features/purchases/domain/premium_products.dart';
import 'package:life_battery/src/features/purchases/domain/purchase_outcome.dart';
import 'package:life_battery/src/features/purchases/domain/store_entitlement.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchasesRepository {
  const PurchasesRepository({required PurchasesApiDataSource apiDataSource})
    : _apiDataSource = apiDataSource;

  final PurchasesApiDataSource _apiDataSource;

  Stream<StoreEntitlement?> get entitlementStream =>
      _apiDataSource.entitlementStream;

  /// Whether the store is available on this device.
  Future<bool> isAvailable() {
    return _apiDataSource.isAvailable();
  }

  Future<PremiumProducts> fetchPremiumProducts() async {
    final products = await _apiDataSource.fetchPremiumProducts();
    return PremiumProducts(
      monthly: products.firstWhereOrNull(
        (product) => product.identifier == PremiumPlan.monthly.productId,
      ),
      lifetime: products.firstWhereOrNull(
        (product) => product.identifier == PremiumPlan.lifetime.productId,
      ),
      lifetimeSupport: products.firstWhereOrNull(
        (product) =>
            product.identifier == PremiumPlan.lifetimeSupport.productId,
      ),
    );
  }

  Future<({PurchaseOutcome outcome, StoreEntitlement? entitlement})>
  buyPremium({required StoreProduct product}) async {
    try {
      return await _apiDataSource.purchase(product: product);
    } on Object catch (error, stack) {
      if (Firebase.apps.isNotEmpty) {
        await FirebaseCrashlytics.instance.recordError(error, stack);
      }
      return (outcome: PurchaseOutcome.error, entitlement: null);
    }
  }

  Future<({PurchaseOutcome outcome, StoreEntitlement? entitlement})>
  restorePurchases() async {
    try {
      return await _apiDataSource.restorePurchases();
    } on Object catch (error, stack) {
      if (Firebase.apps.isNotEmpty) {
        await FirebaseCrashlytics.instance.recordError(error, stack);
      }
      return (outcome: PurchaseOutcome.error, entitlement: null);
    }
  }
}
