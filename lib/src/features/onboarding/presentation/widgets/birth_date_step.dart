import 'package:flutter/material.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/birth_date_picker.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/onboarding_step_layout.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class BirthDateStep extends StatelessWidget {
  const BirthDateStep({
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
      title: l10n.onboardingBirthDateTitle,
      description: l10n.onboardingBirthDateDescription,
      onPressed: onNext,
      child: BirthDatePicker(
        birthDate: lifespanRange.birthDate,
        idealAge: lifespanRange.idealAge,
      ),
    );
  }
}
