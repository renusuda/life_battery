import 'package:flutter/material.dart';
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
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Expanded(child: Center(child: child)),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: theme.colorScheme.inverseSurface,
              foregroundColor: theme.colorScheme.onInverseSurface,
              minimumSize: const Size.fromHeight(56),
              shape: const StadiumBorder(),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: onPressed,
            child: Text(l10n.onboardingContinueLabel),
          ),
        ),
      ],
    );
  }
}
