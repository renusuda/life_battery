import 'package:flutter/material.dart';

class IdealAgeStepperButton extends StatelessWidget {
  const IdealAgeStepperButton({
    required this.icon,
    required this.enabled,
    required this.onPressed,
    super.key,
  });

  final IconData icon;

  final bool enabled;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: enabled ? onPressed : null,
      iconSize: 28,
      style: IconButton.styleFrom(
        foregroundColor: theme.colorScheme.primary,
      ),
      icon: Icon(icon),
    );
  }
}
