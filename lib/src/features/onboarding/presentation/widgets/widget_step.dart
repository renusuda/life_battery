import 'package:flutter/material.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/onboarding_step_layout.dart';
import 'package:life_battery/src/features/settings/presentation/widgets/widget_guide_steps.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class WidgetStep extends StatelessWidget {
  const WidgetStep({required this.onNext, super.key});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return OnboardingStepLayout(
      title: l10n.widgetGuideSheetTitle,
      description: l10n.widgetGuideDescription,
      onPressed: onNext,
      child: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: WidgetGuideSteps(),
      ),
    );
  }
}
