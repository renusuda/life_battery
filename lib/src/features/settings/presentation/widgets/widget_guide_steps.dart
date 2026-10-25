import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

/// The numbered steps for adding the home screen widget on the current OS.
class WidgetGuideSteps extends StatelessWidget {
  const WidgetGuideSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final steps = defaultTargetPlatform == TargetPlatform.android
        ? [
            l10n.widgetGuideAndroidStep1,
            l10n.widgetGuideAndroidStep2,
            l10n.widgetGuideAndroidStep3,
          ]
        : [
            l10n.widgetGuideIosStep1,
            l10n.widgetGuideIosStep2,
            l10n.widgetGuideIosStep3,
          ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (index, step) in steps.indexed) ...[
          if (index > 0) const SizedBox(height: 12),
          _WidgetGuideStep(number: index + 1, text: step),
        ],
      ],
    );
  }
}

class _WidgetGuideStep extends StatelessWidget {
  const _WidgetGuideStep({required this.number, required this.text});

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: colorScheme.primaryContainer,
          child: Text(
            '$number',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ],
    );
  }
}
