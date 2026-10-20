import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class IdealAgeStepperButton extends HookWidget {
  const IdealAgeStepperButton({
    required this.icon,
    required this.enabled,
    required this.onPressed,
    super.key,
  });

  final IconData icon;

  final bool enabled;

  final VoidCallback onPressed;

  static const _repeatInterval = Duration(milliseconds: 80);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timer = useRef<Timer?>(null);

    void stopRepeating() {
      timer.value?.cancel();
      timer.value = null;
    }

    useEffect(() => stopRepeating, const []);

    return GestureDetector(
      onLongPressStart: enabled
          ? (_) {
              onPressed();
              timer.value = Timer.periodic(_repeatInterval, (_) => onPressed());
            }
          : null,
      onLongPressEnd: (_) => stopRepeating(),
      onLongPressCancel: stopRepeating,
      child: IconButton(
        onPressed: enabled ? onPressed : null,
        iconSize: 28,
        style: IconButton.styleFrom(
          foregroundColor: theme.colorScheme.primary,
        ),
        icon: Icon(icon),
      ),
    );
  }
}
