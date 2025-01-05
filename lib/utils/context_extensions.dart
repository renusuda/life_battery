import 'package:flutter/material.dart';

/// Extensions for the [BuildContext] class.
extension ContextExtensions on BuildContext {
  /// Returns whether the current locale is Japanese.
  bool get isJapanese {
    final locale = Localizations.localeOf(this);
    return locale.languageCode == 'ja';
  }
}
