import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Extensions for the [BuildContext] class.
extension ContextExtensions on BuildContext {
  /// Returns whether the current locale is Japanese.
  bool get isJapanese {
    final locale = Localizations.localeOf(this);
    return locale.languageCode == 'ja';
  }
}

/// Extensions for the [DateTime] class.
extension DateTimeExtensions on DateTime {
  /// Returns a new [DateTime] instance with the time set to 00:00:00.
  DateTime get toDateOnly {
    return DateTime(year, month, day);
  }
}

/// Extensions for the [int] class.
extension IntExtensions on int {
  /// Returns a string representation of the integer with a comma.
  String get withCommaString {
    final formatter = NumberFormat('#,###');
    return formatter.format(this);
  }
}
