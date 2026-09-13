import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

/// A modal sheet that explains how to add the home screen widget.
class WidgetGuideBottomSheet extends StatelessWidget {
  const WidgetGuideBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (_) => const WidgetGuideBottomSheet(),
    );
  }

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

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.widgetGuideSheetTitle,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.widgetGuideDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            for (final (index, step) in steps.indexed) ...[
              if (index > 0) const SizedBox(height: 12),
              _WidgetGuideStep(number: index + 1, text: step),
            ],
            const SizedBox(height: 8),
          ],
        ),
      ),
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
