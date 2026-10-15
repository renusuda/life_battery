import 'package:flutter/material.dart';

/// The outlined rounded frame shown while the plans load or when the
/// store is unavailable.
class PriceCardFrame extends StatelessWidget {
  const PriceCardFrame({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: child,
    );
  }
}
