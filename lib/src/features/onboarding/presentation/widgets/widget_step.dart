import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/onboarding_step_layout.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/widget_guide_video.dart';
import 'package:life_battery/src/features/purchases/domain/paywall_source.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/widget_trial_provider.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/premium_bottom_sheet.dart';
import 'package:life_battery/src/features/settings/presentation/widgets/widget_guide_steps.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

/// The paywall opens from the continue button instead of its own button so
/// every eligible user sees it. Premium is not checked: first-time users
/// cannot hold it yet, and restores happen inside the sheet.
class WidgetStep extends HookConsumerWidget {
  const WidgetStep({required this.onNext, super.key});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    // The widget is sold on the App Store only; on Android it is free and
    // there is no video yet, so the written steps stay.
    final isIos = defaultTargetPlatform == TargetPlatform.iOS;

    useEffect(() {
      if (isIos) {
        unawaited(ref.read(widgetTrialProvider.notifier).start());
      }
      return null;
    }, const []);

    return OnboardingStepLayout(
      title: l10n.widgetGuideSheetTitle,
      description: l10n.widgetGuideDescription,
      onPressed: () async {
        if (isIos) {
          await PremiumBottomSheet.show(
            context,
            source: PaywallSource.onboarding,
          );
        }
        onNext();
      },
      child: isIos
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Flexible(child: WidgetGuideVideo()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    l10n.widgetTrialNote,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            )
          : const SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: WidgetGuideSteps(),
            ),
    );
  }
}
