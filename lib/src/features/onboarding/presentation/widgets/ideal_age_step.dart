import 'package:flutter/material.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/ideal_age_stepper_field.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/onboarding_step_layout.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class IdealAgeStep extends StatelessWidget {
  const IdealAgeStep({
    required this.lifespanRange,
    required this.onNext,
    super.key,
  });

  final LifespanRange lifespanRange;

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return OnboardingStepLayout(
      title: l10n.onboardingIdealAgeTitle,
      description: l10n.onboardingIdealAgeDescription,
      onPressed: onNext,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: IdealAgeStepper(
          birthDate: lifespanRange.birthDate,
          idealAge: lifespanRange.idealAge,
        ),
      ),
    );
  }
}
