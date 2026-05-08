import 'package:flutter/material.dart';
import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_mode_provider.g.dart';

@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  Future<ThemeMode> build() => _fetch();

  Future<ThemeMode> _fetch() async {
    final response = await ref.read(lifespanRepositoryProvider).getThemeMode();
    if (response == 'light') {
      return ThemeMode.light;
    } else if (response == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await ref
        .read(lifespanRepositoryProvider)
        .updateThemeMode(
          themeMode: themeMode.name,
        );
    ref.invalidateSelf();
  }
}
