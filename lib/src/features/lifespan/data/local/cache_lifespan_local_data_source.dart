import 'package:life_battery/src/database/local_database.dart';
import 'package:life_battery/src/features/lifespan/data/local/lifespan_local_data_source.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:sqflite/sqflite.dart';

class CacheLifespanLocalDataSource implements LifespanLocalDataSource {
  const CacheLifespanLocalDataSource({required LocalDatabase localDatabase})
    : _localDatabase = localDatabase;

  final LocalDatabase _localDatabase;

  static const _tableName = 'lifespan';
  static const _columnBirthDate = 'birthDate';
  static const _columnIdealAge = 'idealAge';
  static const _columnThemeMode = 'themeMode';
  static const _columnIsInitialUser = 'isInitialUser';
  static const _columnIsDeletedUser = 'isDeletedUser';
  static const _columnHasLongPressedBattery = 'hasLongPressedBattery';
  static const _columnIsPercentageMode = 'isPercentageMode';

  @override
  Future<LifespanRange> getLifespan() async {
    try {
      final db = await _localDatabase.database;
      final result = await db.query(
        _tableName,
        columns: [_columnBirthDate, _columnIdealAge],
      );

      if (result.isEmpty) {
        return LifespanRange(birthDate: DateTime(2000), idealAge: 100);
      } else {
        return LifespanRange.fromJson(result.first);
      }
    } on DatabaseException catch (_) {
      return LifespanRange(birthDate: DateTime(2000), idealAge: 100);
    }
  }

  @override
  Future<String> getThemeMode() async {
    try {
      final db = await _localDatabase.database;
      final result = await db.query(
        _tableName,
        columns: [_columnThemeMode],
      );

      if (result.isEmpty) {
        return 'system';
      } else {
        return result.first[_columnThemeMode]! as String;
      }
    } on DatabaseException catch (_) {
      return 'system';
    }
  }

  @override
  Future<bool> getIsInitialUser() async {
    try {
      final db = await _localDatabase.database;
      final result = await db.query(
        _tableName,
        columns: [_columnIsInitialUser],
      );

      if (result.isEmpty) {
        return true;
      } else {
        final isInitialUser = result.first[_columnIsInitialUser]! as int;
        return isInitialUser == 1;
      }
    } on DatabaseException catch (_) {
      return true;
    }
  }

  @override
  Future<bool> getIsDeletedUser() async {
    try {
      final db = await _localDatabase.database;
      final result = await db.query(
        _tableName,
        columns: [_columnIsDeletedUser],
      );

      if (result.isEmpty) {
        return false;
      } else {
        final isDeletedUser = result.first[_columnIsDeletedUser]! as int;
        return isDeletedUser == 1;
      }
    } on DatabaseException catch (_) {
      return false;
    }
  }

  @override
  Future<bool> getHasLongPressed() async {
    try {
      final db = await _localDatabase.database;
      final result = await db.query(
        _tableName,
        columns: [_columnHasLongPressedBattery],
      );

      if (result.isEmpty) {
        return false;
      } else {
        final hasLongPressed =
            result.first[_columnHasLongPressedBattery]! as int;
        return hasLongPressed == 1;
      }
    } on DatabaseException catch (_) {
      return false;
    }
  }

  @override
  Future<bool> getIsPercentageMode() async {
    try {
      final db = await _localDatabase.database;
      final result = await db.query(
        _tableName,
        columns: [_columnIsPercentageMode],
      );

      if (result.isEmpty) {
        return true;
      } else {
        final isPercentageMode = result.first[_columnIsPercentageMode]! as int;
        return isPercentageMode == 1;
      }
    } on DatabaseException catch (_) {
      return true;
    }
  }

  @override
  Future<void> updateLifespan({
    required DateTime birthDate,
    required int idealAge,
  }) async {
    try {
      final db = await _localDatabase.database;
      final response = await db.query(_tableName);
      if (response.isEmpty) {
        await db.insert(_tableName, {
          _columnBirthDate: birthDate.toIso8601String(),
          _columnIdealAge: idealAge,
        });
      } else {
        await db.update(_tableName, {
          _columnBirthDate: birthDate.toIso8601String(),
          _columnIdealAge: idealAge,
        });
      }
    } on DatabaseException catch (_) {}
  }

  @override
  Future<void> updateThemeMode({required String themeMode}) async {
    try {
      final db = await _localDatabase.database;
      final response = await db.query(_tableName);
      if (response.isNotEmpty) {
        await db.update(_tableName, {_columnThemeMode: themeMode});
      }
    } on DatabaseException catch (_) {}
  }

  @override
  Future<void> updateUserIsNotInitialUser() async {
    try {
      final db = await _localDatabase.database;
      final response = await db.query(_tableName);
      if (response.isNotEmpty) {
        await db.update(_tableName, {_columnIsInitialUser: 0});
      }
    } on DatabaseException catch (_) {}
  }

  @override
  Future<void> updateIsPercentageMode({
    required bool isPercentageMode,
  }) async {
    try {
      final db = await _localDatabase.database;
      final response = await db.query(_tableName);
      if (response.isNotEmpty) {
        await db.update(_tableName, {
          _columnIsPercentageMode: isPercentageMode ? 1 : 0,
        });
      }
    } on DatabaseException catch (_) {}
  }

  @override
  Future<void> updateHasLongPressed() async {
    try {
      final db = await _localDatabase.database;
      final response = await db.query(_tableName);
      if (response.isNotEmpty) {
        await db.update(_tableName, {_columnHasLongPressedBattery: 1});
      }
    } on DatabaseException catch (_) {}
  }

  @override
  Future<void> deleteAllData() async {
    try {
      final db = await _localDatabase.database;
      await db.update(_tableName, {
        _columnBirthDate: '2000-01-01T00:00:00.000',
        _columnIdealAge: 100,
        _columnIsInitialUser: 0,
        _columnIsDeletedUser: 1,
        _columnHasLongPressedBattery: 0,
        _columnIsPercentageMode: 1,
      });
    } on DatabaseException catch (_) {}
  }
}
