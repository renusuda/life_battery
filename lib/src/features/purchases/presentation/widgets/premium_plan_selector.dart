import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_battery/src/features/purchases/domain/premium_plan.dart';
import 'package:life_battery/src/features/purchases/domain/premium_products.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/premium_plan_card.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:life_battery/src/utils/app_haptics.dart';

/// The available plans stacked with the one-time plan on top and the
/// monthly price below it as the anchor.
class PremiumPlanSelector extends StatelessWidget {
  const PremiumPlanSelector({
    required this.products,
    required this.selectedPlan,
    required this.onPlanChanged,
    super.key,
  });

  final PremiumProducts products;

  final PremiumPlan selectedPlan;

  final ValueChanged<PremiumPlan> onPlanChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (index, plan) in products.availablePlans.indexed) ...[
          if (index > 0) const SizedBox(height: 12),
          switch (plan) {
            PremiumPlan.monthly => PremiumPlanCard(
              title: l10n.monthlyPlanLabel,
              price: l10n.monthlyPriceLabel(products.monthly!.priceString),
              notes: [l10n.monthlySubscriptionDescription],
              isSelected: plan == selectedPlan,
              isRecommended: false,
              onTap: () => _select(plan),
            ),
            PremiumPlan.lifetime => PremiumPlanCard(
              title: l10n.oneTimePurchaseLabel,
              price: products.lifetime!.priceString,
              notes: [l10n.oneTimePurchaseDescription],
              isSelected: plan == selectedPlan,
              isRecommended: true,
              onTap: () => _select(plan),
            ),
          },
        ],
      ],
    );
  }

  void _select(PremiumPlan plan) {
    if (plan == selectedPlan) return;
    unawaited(AppHaptics.selectionClick());
    onPlanChanged(plan);
  }
}
