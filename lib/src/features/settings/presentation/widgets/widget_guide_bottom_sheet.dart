import 'package:flutter/material.dart';
import 'package:life_battery/src/features/settings/presentation/widgets/widget_guide_steps.dart';
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
            const WidgetGuideSteps(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
