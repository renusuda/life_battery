import 'package:flutter/material.dart';
import 'package:life_battery/src/features/settings/data/local/dto/theme_mode_dto.dart';
import 'package:life_battery/src/features/settings/data/local/settings_local_data_source.dart';

class SettingsRepository {
  const SettingsRepository({required SettingsLocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  final SettingsLocalDataSource _localDataSource;

  Future<ThemeMode> getThemeMode() async {
    final response = await _localDataSource.getThemeMode();
    return ThemeModeDto(response).toDomain();
  }

  Future<void> updateThemeMode({required ThemeMode themeMode}) {
    return _localDataSource.updateThemeMode(themeMode: themeMode.name);
  }
}
