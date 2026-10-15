import 'package:life_battery/src/features/purchases/domain/premium_plan.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// A purchasable plan paired with its store product.
typedef PremiumOffer = ({PremiumPlan plan, StoreProduct product});

/// The store products for the premium plans.
///
/// A product is null when it is not registered on the store.
class PremiumProducts {
  const PremiumProducts({this.monthly, this.lifetime});

  final StoreProduct? monthly;
  final StoreProduct? lifetime;

  bool get isEmpty => monthly == null && lifetime == null;

  /// The purchasable plans, in display order: the recommended one-time
  /// plan comes first.
  List<PremiumPlan> get availablePlans => [
    if (lifetime != null) PremiumPlan.lifetime,
    if (monthly != null) PremiumPlan.monthly,
  ];

  StoreProduct? productFor(PremiumPlan plan) {
    return switch (plan) {
      PremiumPlan.monthly => monthly,
      PremiumPlan.lifetime => lifetime,
    };
  }

  /// The purchasable offer for [preferred], falling back to the first
  /// available plan when it is not purchasable; null when none is.
  PremiumOffer? resolve(PremiumPlan preferred) {
    final plan = availablePlans.contains(preferred)
        ? preferred
        : availablePlans.firstOrNull;
    if (plan == null) return null;

    final product = productFor(plan);
    if (product == null) return null;
    return (plan: plan, product: product);
  }
}
