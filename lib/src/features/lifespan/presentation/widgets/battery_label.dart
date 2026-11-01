import 'package:flutter/material.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class BatteryLabel extends StatelessWidget {
  const BatteryLabel({
    required this.label,
    super.key,
  });

  final String? label;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // An empty Text still takes one line, so the battery stays in place when
    // the label is hidden.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        label ?? l10n.remainingLifeLabel,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
