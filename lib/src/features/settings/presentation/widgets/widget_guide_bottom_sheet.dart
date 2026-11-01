import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/widget_guide_video.dart';
import 'package:life_battery/src/features/settings/presentation/widgets/widget_guide_steps.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

/// A modal sheet that explains how to add the home screen widget, with the
/// same content as the onboarding widget step: the video on iOS and the
/// written steps on Android, where there is no video yet.
class WidgetGuideBottomSheet extends StatelessWidget {
  const WidgetGuideBottomSheet({super.key});

  /// Capped below the full height so the sheet still reads as a sheet that
  /// can be dragged down; the video shrinks to fit the remaining space.
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.8,
      ),
      builder: (_) => const WidgetGuideBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isIos = defaultTargetPlatform == TargetPlatform.iOS;

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
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
              ],
            ),
          ),
          if (isIos)
            const Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 16, bottom: 8),
                child: WidgetGuideVideo(),
              ),
            )
          else
            const Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: WidgetGuideSteps(),
              ),
            ),
        ],
      ),
    );
  }
}
