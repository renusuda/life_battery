import 'dart:async';

import 'package:life_battery/src/features/purchases/data/api/purchases_api_data_source.dart';
import 'package:life_battery/src/features/purchases/domain/purchase_outcome.dart';
import 'package:life_battery/src/features/purchases/domain/store_entitlement.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class FakePurchasesApiDataSource implements PurchasesApiDataSource {
  FakePurchasesApiDataSource({
    this.available = true,
    this.lifetimeProduct = const StoreProduct(
      'premium_lifetime',
      'Removes ads and unlocks the widget',
      'Premium',
      1,
      r'$1.00',
      'USD',
    ),
    this.monthlyProduct = const StoreProduct(
      'premium_monthly',
      'Removes ads and unlocks the widget',
      'Premium Monthly',
      0.99,
      r'$0.99',
      'USD',
    ),
    this.purchaseOutcome = PurchaseOutcome.completed,
    this.restoreOutcome = PurchaseOutcome.completed,
    this.restoredEntitlement,
  });

  final controller = StreamController<StoreEntitlement?>.broadcast();

  bool available;
  StoreProduct? lifetimeProduct;
  StoreProduct? monthlyProduct;
  PurchaseOutcome purchaseOutcome;
  PurchaseOutcome restoreOutcome;
  StoreEntitlement? restoredEntitlement;

  final boughtProducts = <StoreProduct>[];
  int restoreCallCount = 0;

  @override
  Stream<StoreEntitlement?> get entitlementStream => controller.stream;

  @override
  Future<bool> isAvailable() async => available;

  @override
  Future<List<StoreProduct>> fetchPremiumProducts() async => [
    ?lifetimeProduct,
    ?monthlyProduct,
  ];

  @override
  Future<({PurchaseOutcome outcome, StoreEntitlement? entitlement})> purchase({
    required StoreProduct product,
  }) async {
    boughtProducts.add(product);
    if (purchaseOutcome != PurchaseOutcome.completed) {
      return (outcome: purchaseOutcome, entitlement: null);
    }
    return (
      outcome: PurchaseOutcome.completed,
      entitlement: StoreEntitlement(
        productId: product.identifier,
        expiresAt: product.identifier == 'premium_monthly'
            ? DateTime.now().add(const Duration(days: 30))
            : null,
      ),
    );
  }

  @override
  Future<({PurchaseOutcome outcome, StoreEntitlement? entitlement})>
  restorePurchases() async {
    restoreCallCount++;
    if (restoreOutcome != PurchaseOutcome.completed) {
      return (outcome: restoreOutcome, entitlement: null);
    }
    return (
      outcome: PurchaseOutcome.completed,
      entitlement: restoredEntitlement,
    );
  }
}
