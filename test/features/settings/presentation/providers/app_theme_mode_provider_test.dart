import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/settings/data/local/settings_local_data_source.dart';
import 'package:life_battery/src/features/settings/data/settings_repository.dart';
import 'package:life_battery/src/features/settings/data/settings_repository_provider.dart';
import 'package:life_battery/src/features/settings/presentation/providers/app_theme_mode_provider.dart';

void main() {
  ProviderContainer makeContainer(FakeSettingsLocalDataSource dataSource) {
    final container = ProviderContainer(
      overrides: [
        settingsRepositoryProvider.overrideWithValue(
          SettingsRepository(localDataSource: dataSource),
        ),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('AppThemeMode', () {
    group('build', () {
      test('returns ThemeMode.system from repository', () async {
        final container = makeContainer(
          FakeSettingsLocalDataSource(themeMode: ThemeMode.system),
        );

        expect(
          await container.read(appThemeModeProvider.future),
          ThemeMode.system,
        );
      });

      test('returns ThemeMode.light from repository', () async {
        final container = makeContainer(
          FakeSettingsLocalDataSource(themeMode: ThemeMode.light),
        );

        expect(
          await container.read(appThemeModeProvider.future),
          ThemeMode.light,
        );
      });

      test('returns ThemeMode.dark from repository', () async {
        final container = makeContainer(
          FakeSettingsLocalDataSource(themeMode: ThemeMode.dark),
        );

        expect(
          await container.read(appThemeModeProvider.future),
          ThemeMode.dark,
        );
      });
    });

    group('updateThemeMode', () {
      test(
        'immediately sets state without awaiting repository write',
        () async {
          final container = makeContainer(
            FakeSettingsLocalDataSource(themeMode: ThemeMode.system),
          );
          await container.read(appThemeModeProvider.future);

          unawaited(
            container
                .read(appThemeModeProvider.notifier)
                .updateThemeMode(ThemeMode.light),
          );

          expect(container.read(appThemeModeProvider).value, ThemeMode.light);
        },
      );

      test('calls repository with the given theme mode', () async {
        final dataSource = FakeSettingsLocalDataSource(
          themeMode: ThemeMode.system,
        );
        final container = makeContainer(dataSource);
        await container.read(appThemeModeProvider.future);

        await container
            .read(appThemeModeProvider.notifier)
            .updateThemeMode(
              ThemeMode.dark,
            );

        expect(dataSource.lastUpdatedThemeMode, ThemeMode.dark.name);
      });
    });
  });
}

class FakeSettingsLocalDataSource implements SettingsLocalDataSource {
  FakeSettingsLocalDataSource({required ThemeMode themeMode})
    : _themeMode = themeMode.name;

  final String _themeMode;
  String? lastUpdatedThemeMode;

  @override
  Future<String> getThemeMode() async => _themeMode;

  @override
  Future<void> updateThemeMode({required String themeMode}) async {
    lastUpdatedThemeMode = themeMode;
  }
}
