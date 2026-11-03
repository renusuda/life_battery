import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:life_battery/src/common_widgets/primary_button.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_indicator.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_label.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_card_dialog.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:life_battery/src/utils/app_haptics.dart';

/// Sharing lives here rather than on the result step so the card carries
/// the words the user just chose.
class LabelStep extends StatelessWidget {
  const LabelStep({
    required this.lifespanRange,
    required this.onNext,
    super.key,
  });

  final LifespanRange lifespanRange;

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final percentage = lifespanRange.remainingLifePercentage(
      now: DateTime.now(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BatteryLabel(label: null),
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
                label: null,
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
