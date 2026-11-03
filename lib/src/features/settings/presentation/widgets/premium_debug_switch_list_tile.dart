import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/purchases/data/entitlements_repository_provider.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/is_premium_provider.dart';

/// Grants or revokes premium locally to check both states of the ads, the
/// widget, and the onboarding paywall. Debug builds only, so the text is
/// not localized.
class PremiumDebugSwitchListTile extends ConsumerWidget {
  const PremiumDebugSwitchListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(isPremiumProvider).value;

    return SwitchListTile(
      secondary: const Icon(Icons.workspace_premium_outlined),
      title: const Text('Premium (debug)'),
      value: isPremium ?? false,
      onChanged: isPremium == null
          ? null
          : (value) async {
              final repository = ref.read(entitlementsRepositoryProvider);
              if (value) {
                await repository.markPremiumPurchased();
              } else {
                await repository.clearPremium();
              }
              // The widget sync re-runs on this invalidation.
              ref.invalidate(isPremiumProvider);
            },
    );
  }
}
