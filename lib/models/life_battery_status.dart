import 'package:flutter/material.dart';

/// A class that represents the status of a battery.
class LifeBatteryStatus {
  /// Constructor
  LifeBatteryStatus(int value)
      : type = (value > 50)
            ? LifeBatteryStatusType.high
            : (value >= 20)
                ? LifeBatteryStatusType.medium
                : LifeBatteryStatusType.low;

  /// Type of battery status
  final LifeBatteryStatusType type;

  /// Get battery status type color
  Color getColor(BuildContext context) {
    switch (type) {
      case LifeBatteryStatusType.high:
        return Theme.of(context).brightness == Brightness.light
            ? Colors.green
            : Colors.green[600]!;
      case LifeBatteryStatusType.medium:
        return Theme.of(context).brightness == Brightness.light
            ? Colors.yellow
            : Colors.amber;
      case LifeBatteryStatusType.low:
        return Theme.of(context).brightness == Brightness.light
            ? Colors.red
            : Colors.deepOrange;
    }
  }
}

/// Type of battery status
enum LifeBatteryStatusType {
  /// high status
  high(),

  /// medium status
  medium(),

  /// low status
  low();
}
