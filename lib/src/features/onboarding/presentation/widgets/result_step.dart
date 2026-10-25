import 'package:flutter/material.dart';
import 'package:life_battery/src/extensions/extensions.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_indicator.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/onboarding_step_layout.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class ResultStep extends StatelessWidget {
  const ResultStep({
    required this.lifespanRange,
    required this.onNext,
    super.key,
  });

  final LifespanRange lifespanRange;

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final percentage = lifespanRange.remainingLifePercentage(now: now);
    final days = lifespanRange.remainingLifeDays(now: now);

    return OnboardingStepLayout(
      title: l10n.onboardingResultTitle(percentage),
      description: l10n.onboardingResultDescription(days.withCommaString),
      onPressed: onNext,
      child: BatteryIndicator(value: percentage, text: '$percentage%'),
    );
  }
}
