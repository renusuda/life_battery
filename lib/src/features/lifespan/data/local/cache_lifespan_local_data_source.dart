import 'package:life_battery/src/database/local_database.dart';
import 'package:life_battery/src/features/lifespan/data/local/lifespan_local_data_source.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:sqflite/sqflite.dart';

/// A class that manages the lifespan records in the database.
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

  /// Fetches the lifespan record from the database.
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

  /// Fetches the theme mode record from the database.
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

  /// Fetches whether the user is an initial user from the database.
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

  /// Fetches whether user is deleted from the database.
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

  /// Fetches whether the user has already used long press edit.
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

  /// Fetches whether the battery is shown in percentage mode from the database.
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
        final isPercentageMode =
            result.first[_columnIsPercentageMode]! as int;
        return isPercentageMode == 1;
      }
    } on DatabaseException catch (_) {
      return true;
    }
  }

  /// Updates the lifespan record in the database.
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

  /// Updates the theme mode record in the database.
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

  /// Updates the user is not an initial user in the database.
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

  /// Updates whether the battery is shown in percentage mode in the database.
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

  /// Updates the user as having used long press edit.
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
}
