import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_battery/l10n/app_localizations.dart';

/// A hint that tells users they can long press to edit.
class LongPressHint extends StatefulWidget {
  const LongPressHint({
    required this.hasLongPressedBattery,
    super.key,
  });

  final bool hasLongPressedBattery;

  @override
  State<LongPressHint> createState() => _LongPressHintState();
}

class _LongPressHintState extends State<LongPressHint>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    unawaited(_controller.repeat(reverse: true));
    _animation =
        Tween<double>(
          begin: 0.45,
          end: 0.85,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return FadeTransition(
      opacity: _animation,
      child: Text(
        widget.hasLongPressedBattery
            ? l10n.todaysMessageHint
            : l10n.longPressToEditHint,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
