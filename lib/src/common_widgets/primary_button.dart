import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.child,
    super.key,
  });

  final VoidCallback? onPressed;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.inverseSurface,
        foregroundColor: colorScheme.onInverseSurface,
        minimumSize: const Size.fromHeight(56),
        shape: const StadiumBorder(),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
