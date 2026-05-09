import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  bool get isJapanese {
    final locale = Localizations.localeOf(this);
    return locale.languageCode == 'ja';
  }
}

extension DateTimeExtensions on DateTime {
  /// Returns a new [DateTime] instance with the time set to 00:00:00.
  DateTime get toDateOnly {
    return DateTime(year, month, day);
  }
}

extension IntExtensions on int {
  String get withCommaString {
    final formatter = NumberFormat('#,###');
    return formatter.format(this);
  }
}

extension ThemeModeExtensions on ThemeMode {
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
