import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class LongPressHint extends HookWidget {
  const LongPressHint({
    required this.hasLongPressedBattery,
    super.key,
  });

  final bool hasLongPressedBattery;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final controller = useAnimationController(
      duration: const Duration(seconds: 3),
    );

    useEffect(() {
      unawaited(controller.repeat(reverse: true));
      return null;
    }, const []);

    final animation = Tween<double>(begin: 0.45, end: 0.85).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    return FadeTransition(
      opacity: animation,
      child: Text(
        hasLongPressedBattery
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
