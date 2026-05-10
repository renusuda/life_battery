import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/data/lifespan_repository.dart';
import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:life_battery/src/features/lifespan/data/local/lifespan_local_data_source.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/app_theme_mode_provider.dart';

void main() {
  ProviderContainer makeContainer(FakeLifespanLocalDataSource dataSource) {
    final container = ProviderContainer(
      overrides: [
        lifespanRepositoryProvider.overrideWithValue(
          LifespanRepository(localDataSource: dataSource),
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
          FakeLifespanLocalDataSource(themeMode: ThemeMode.system),
        );

        expect(
          await container.read(appThemeModeProvider.future),
          ThemeMode.system,
        );
      });

      test('returns ThemeMode.light from repository', () async {
        final container = makeContainer(
          FakeLifespanLocalDataSource(themeMode: ThemeMode.light),
        );

        expect(
          await container.read(appThemeModeProvider.future),
          ThemeMode.light,
        );
      });

      test('returns ThemeMode.dark from repository', () async {
        final container = makeContainer(
          FakeLifespanLocalDataSource(themeMode: ThemeMode.dark),
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
            FakeLifespanLocalDataSource(themeMode: ThemeMode.system),
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
        final dataSource = FakeLifespanLocalDataSource(
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

class FakeLifespanLocalDataSource implements LifespanLocalDataSource {
  FakeLifespanLocalDataSource({required ThemeMode themeMode})
    : _themeMode = themeMode.name;

  final String _themeMode;
  String? lastUpdatedThemeMode;

  @override
  Future<String> getThemeMode() async => _themeMode;

  @override
  Future<void> updateThemeMode({required String themeMode}) async {
    lastUpdatedThemeMode = themeMode;
  }

  @override
  Future<LifespanRange> getLifespan() => throw UnimplementedError();

  @override
  Future<bool> getIsInitialUser() => throw UnimplementedError();

  @override
  Future<bool> getIsDeletedUser() => throw UnimplementedError();

  @override
  Future<bool> getHasLongPressed() => throw UnimplementedError();

  @override
  Future<bool> getIsPercentageMode() => throw UnimplementedError();

  @override
  Future<void> updateLifespan({
    required DateTime birthDate,
    required int idealAge,
  }) => throw UnimplementedError();

  @override
  Future<void> updateUserIsNotInitialUser() => throw UnimplementedError();

  @override
  Future<void> updateIsPercentageMode({required bool isPercentageMode}) =>
      throw UnimplementedError();

  @override
  Future<void> updateHasLongPressed() => throw UnimplementedError();

  @override
  Future<void> deleteAllData() => throw UnimplementedError();
}
