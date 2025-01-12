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

  /// type of battery status
  final LifeBatteryStatusType type;
}

/// Type of battery status
enum LifeBatteryStatusType {
  /// high status
  high(Colors.green),

  /// medium status
  medium(Colors.yellow),

  /// low status
  low(Colors.red);

  /// Constructor
  const LifeBatteryStatusType(this.color);

  /// color
  final Color color;
}
