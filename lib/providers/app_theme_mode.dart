import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_mode.g.dart';

/// app theme mode.
@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  ThemeMode build() => fetchThemeMode();

  /// Fetches the theme mode from Local Storage.
  // TODO(me): fetches the theme mode from Local Storage.
  ThemeMode fetchThemeMode() {
    return ThemeMode.system;
  }

  /// Updates the theme mode in Local Storage.
  // TODO(me): Updates the theme mode in Local Storage.
  void updateThemeMode(ThemeMode mode) {
    state = mode;
  }
}
