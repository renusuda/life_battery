import 'package:flutter/material.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class IdealAgePresetButton extends StatelessWidget {
  const IdealAgePresetButton({
    required this.age,
    required this.enabled,
    required this.onPressed,
    super.key,
  });

  final int age;

  final bool enabled;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return OutlinedButton(
      onPressed: enabled ? onPressed : null,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        foregroundColor: theme.colorScheme.onSurface,
        side: BorderSide(color: theme.colorScheme.outlineVariant),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      child: Text(l10n.idealAgePresetLabel(age)),
    );
  }
}
