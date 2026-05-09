import 'package:flutter/material.dart';

class LifeBatteryStatus {
  LifeBatteryStatus(int value)
    : type = (value > 50)
          ? LifeBatteryStatusType.high
          : (value >= 20)
          ? LifeBatteryStatusType.medium
          : LifeBatteryStatusType.low;

  final LifeBatteryStatusType type;

  Color get color {
    switch (type) {
      case LifeBatteryStatusType.high:
        return const Color(0xFF10B981);
      case LifeBatteryStatusType.medium:
        return const Color(0xFFFBBF24);
      case LifeBatteryStatusType.low:
        return const Color(0xFFF43F5E);
    }
  }

  /// Get battery status glow effect
  List<BoxShadow> boxShadow(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return [
      BoxShadow(
        color: color.withValues(alpha: isLightMode ? 0.3 : 0.5),
        blurRadius: isLightMode ? 20 : 30,
      ),
    ];
  }
}

enum LifeBatteryStatusType {
  high(),
  medium(),
  low(),
}
