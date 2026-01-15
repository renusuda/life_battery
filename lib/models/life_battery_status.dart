import 'package:flutter/material.dart';

/// A class that represents the status of a battery.
class LifeBatteryStatus {
  LifeBatteryStatus(int value)
    : type = (value > 50)
          ? LifeBatteryStatusType.high
          : (value >= 20)
          ? LifeBatteryStatusType.medium
          : LifeBatteryStatusType.low;

  /// Type of battery status
  final LifeBatteryStatusType type;

  /// Get battery status type color
  Color get getColor {
    switch (type) {
      case LifeBatteryStatusType.high:
        return const Color(0xFF10B981);
      case LifeBatteryStatusType.medium:
        return const Color(0xFFFBBF24);
      case LifeBatteryStatusType.low:
        return const Color(0xFFF43F5E);
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
  low(),
}
