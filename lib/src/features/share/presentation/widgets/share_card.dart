import 'package:flutter/material.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_indicator.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class ShareCard extends StatelessWidget {
  const ShareCard({
    required this.value,
    required this.text,
    super.key,
  });

  // Fixed so the captured image looks the same on every device.
  static const width = 320.0;

  final int value;

  final String text;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.shareCardCaption,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: colorScheme.tertiary,
            ),
          ),
          const SizedBox(height: 24),
          // Same ratio as the home screen battery on an iPhone.
          BatteryIndicator(
            value: value,
            text: text,
            bodyWidth: 245,
            bodyHeight: 126,
            animate: false,
          ),
          const SizedBox(height: 24),
          Text(
            l10n.shareCardAppName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
