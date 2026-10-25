import 'package:flutter/material.dart';
import 'package:life_battery/src/common_widgets/primary_button.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/onboarding_step_header.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class OnboardingStepLayout extends StatelessWidget {
  const OnboardingStepLayout({
    required this.title,
    required this.description,
    required this.child,
    required this.onPressed,
    super.key,
  });

  final String title;

  final String description;

  final Widget child;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OnboardingStepHeader(title: title, description: description),
        Expanded(child: Center(child: child)),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
          child: PrimaryButton(
            onPressed: onPressed,
            child: Text(l10n.onboardingContinueLabel),
          ),
        ),
      ],
    );
  }
}
