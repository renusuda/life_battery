import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/features/settings/data/local/settings_local_data_source.dart';
import 'package:life_battery/src/features/settings/data/settings_repository.dart';

void main() {
  group('SettingsRepository', () {
    group('getThemeMode', () {
      test('returns system theme mode from local data source', () async {
        final repository = SettingsRepository(
          localDataSource: FakeSettingsLocalDataSource(themeMode: 'system'),
        );

        expect(await repository.getThemeMode(), ThemeMode.system);
      });

      test('returns light theme mode from local data source', () async {
        final repository = SettingsRepository(
          localDataSource: FakeSettingsLocalDataSource(themeMode: 'light'),
        );

        expect(await repository.getThemeMode(), ThemeMode.light);
      });

      test('returns dark theme mode from local data source', () async {
        final repository = SettingsRepository(
          localDataSource: FakeSettingsLocalDataSource(themeMode: 'dark'),
        );

        expect(await repository.getThemeMode(), ThemeMode.dark);
      });
    });

    test('updateThemeMode stores theme mode name', () async {
      final dataSource = FakeSettingsLocalDataSource(themeMode: 'system');
      final repository = SettingsRepository(localDataSource: dataSource);

      await repository.updateThemeMode(themeMode: ThemeMode.dark);

      expect(dataSource.lastUpdatedThemeMode, 'dark');
    });
  });
}

class FakeSettingsLocalDataSource implements SettingsLocalDataSource {
  FakeSettingsLocalDataSource({required this.themeMode});

  final String themeMode;
  String? lastUpdatedThemeMode;

  @override
  Future<String> getThemeMode() async => themeMode;

  @override
  Future<void> updateThemeMode({required String themeMode}) async {
    lastUpdatedThemeMode = themeMode;
  }
}
