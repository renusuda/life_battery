import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_battery/src/features/settings/data/settings_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_mode_provider.g.dart';

@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  Future<ThemeMode> build() =>
      ref.watch(settingsRepositoryProvider).getThemeMode();

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    state = AsyncData(themeMode);
    unawaited(
      ref
          .read(settingsRepositoryProvider)
          .updateThemeMode(
            themeMode: themeMode,
          ),
    );
  }
}
