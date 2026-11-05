import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/common_widgets/primary_button.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/battery_label_manager_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_indicator.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_label.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_label_field.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/onboarding_step_header.dart';
import 'package:life_battery/src/features/share/domain/share_source.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_card_dialog.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:life_battery/src/utils/app_haptics.dart';

/// Sharing lives here rather than on the result step so the card carries
/// the words the user just chose.
class LabelStep extends ConsumerWidget {
  const LabelStep({
    required this.lifespanRange,
    required this.onNext,
    super.key,
  });

  final LifespanRange lifespanRange;

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final label = ref.watch(batteryLabelManagerProvider).value;
    final percentage = lifespanRange.remainingLifePercentage(
      now: DateTime.now(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OnboardingStepHeader(
          title: l10n.onboardingLabelTitle,
          description: l10n.onboardingLabelDescription,
        ),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          // The step title already says what the field is for.
          child: BatteryLabelField(showTitle: false),
        ),
        Expanded(
          child: Center(
            // Short screens like the iPhone SE cannot fit the full-size
            // battery below the field.
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BatteryLabel(label: label),
                    const SizedBox(height: 20),
                    BatteryIndicator(
                      value: percentage,
                      text: '$percentage%',
                      animate: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: colorScheme.onSurface,
              side: BorderSide(color: colorScheme.outline),
              minimumSize: const Size.fromHeight(56),
              shape: const StadiumBorder(),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              unawaited(AppHaptics.lightImpact());
              await ShareCardDialog.show(
                context,
                percentage: percentage,
                text: '$percentage%',
                label: label,
                source: ShareSource.onboarding,
              );
            },
            icon: Icon(
              defaultTargetPlatform == TargetPlatform.iOS
                  ? Icons.ios_share
                  : Icons.share_outlined,
            ),
            label: Text(l10n.shareLabel),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
          child: PrimaryButton(
            onPressed: onNext,
            child: Text(l10n.onboardingContinueLabel),
          ),
        ),
      ],
    );
  }
}
