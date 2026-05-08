import 'package:flutter/material.dart';
import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_mode.g.dart';

/// app theme mode.
@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  Future<ThemeMode> build() => fetchThemeMode();

  /// Fetches the theme mode from Local Storage.
  Future<ThemeMode> fetchThemeMode() async {
    final response = await ref.read(lifespanRepositoryProvider).getThemeMode();
    if (response == 'light') {
      return ThemeMode.light;
    } else if (response == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  /// Updates the theme mode in Local Storage.
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await ref.read(lifespanRepositoryProvider).updateThemeMode(
      themeMode: themeMode.name,
    );
    final newThemeMode = await fetchThemeMode();
    state = AsyncData(newThemeMode);
  }
}
