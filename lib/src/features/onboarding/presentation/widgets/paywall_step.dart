import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/common_widgets/primary_button.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/purchases/domain/paywall_source.dart';
import 'package:life_battery/src/features/purchases/domain/premium_plan.dart';
import 'package:life_battery/src/features/purchases/domain/premium_products.dart';
import 'package:life_battery/src/features/purchases/domain/premium_purchase_status.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/premium_products_provider.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/purchase_updates_provider.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/five_star_rating.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/premium_feature_list.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/premium_legal_links.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/premium_plan_selector.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/price_card_frame.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/restore_purchases_button.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:life_battery/src/utils/app_haptics.dart';
import 'package:url_launcher/url_launcher.dart';

/// Only the skip and purchase buttons are pinned so the plans get the
/// height.
class PaywallStep extends HookConsumerWidget {
  const PaywallStep({required this.onNext, super.key});

  /// Also called after a purchase or a restore.
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final purchaseError = useState<String?>(null);
    final isPurchasing = useState(false);

    useEffect(
      () {
        unawaited(
          ref
              .read(analyticsRepositoryProvider)
              .logPaywallView(source: PaywallSource.onboarding),
        );
        return null;
      },
      const [],
    );

    ref.listen(purchaseUpdatesProvider, (_, status) {
      switch (status) {
        case PremiumPurchaseStatus.purchased:
          onNext();
        case PremiumPurchaseStatus.restored:
          unawaited(AppHaptics.mediumImpact());
          onNext();
        case PremiumPurchaseStatus.error:
          unawaited(AppHaptics.heavyImpact());
          purchaseError.value = l10n.purchaseErrorContent;
        case PremiumPurchaseStatus.pending ||
            PremiumPurchaseStatus.canceled ||
            PremiumPurchaseStatus.none:
          break;
      }
    });

    final selectedPlan = useState(PremiumPlan.lifetime);
    final productsAsyncValue = ref.watch(premiumProductsProvider);
    final offer = productsAsyncValue.value?.resolve(selectedPlan.value);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                  child: Text(
                    l10n.premiumSheetTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const FiveStarRating(),
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: PremiumFeatureList(),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: switch (productsAsyncValue) {
                    AsyncValue(value: final PremiumProducts details)
                        when offer != null =>
                      PremiumPlanSelector(
                        products: details,
                        selectedPlan: offer.plan,
                        onPlanChanged: (plan) => selectedPlan.value = plan,
                      ),
                    AsyncValue(isLoading: true) => PriceCardFrame(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    // The store is unavailable or no product could
                    // be fetched.
                    AsyncValue() => PriceCardFrame(
                      child: Text(
                        l10n.storeUnavailableContent,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  },
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: RestorePurchasesButton(),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 16),
                  child: PremiumLegalLinks(
                    canLaunchUrl: canLaunchUrl,
                    onLaunchUrl: launchUrl,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 4),
          child: TextButton(
            key: const Key('paywallSkip'),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            onPressed: onNext,
            child: Text(l10n.paywallSkipLabel),
          ),
        ),
        if (purchaseError.value != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              purchaseError.value!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
        // Lines up with the continue button of the other onboarding steps.
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          child: PrimaryButton(
            onPressed: offer == null || isPurchasing.value
                ? null
                : () async {
                    purchaseError.value = null;
                    isPurchasing.value = true;
                    try {
                      await ref
                          .read(purchaseUpdatesProvider.notifier)
                          .buyPremium(offer);
                    } finally {
                      if (context.mounted) {
                        isPurchasing.value = false;
                      }
                    }
                  },
            child: isPurchasing.value
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  )
                : Text(l10n.purchaseButtonLabel),
          ),
        ),
      ],
    );
  }
}
