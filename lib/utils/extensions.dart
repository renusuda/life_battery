import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

/// Extensions for the [ThemeMode] class.
extension ThemeModeExtensions on ThemeMode {
  /// Returns the label of the theme mode.
  String label(AppLocalizations l10n) {
    switch (this) {
      case ThemeMode.system:
        return l10n.systemLabel;
      case ThemeMode.light:
        return l10n.lightLabel;
      case ThemeMode.dark:
        return l10n.darkLabel;
    }
  }
}
