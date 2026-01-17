import 'package:life_battery/models/lifespan_range.dart';
import 'package:life_battery/repositories/local_database.dart';
import 'package:sqflite/sqflite.dart';

/// A class that manages the lifespan records in the database.
class LifespanRepository {
  /// Returns the instance of the local database.
  static final instance = LocalDatabase();

  static const _tableName = 'lifespan';
  static const _columnBirthDate = 'birthDate';
  static const _columnIdealAge = 'idealAge';
  static const _columnThemeMode = 'themeMode';
  static const _columnIsInitialUser = 'isInitialUser';
  static const _columnIsDeletedUser = 'isDeletedUser';

  /// Fetches the lifespan record from the database.
  Future<LifespanRange> getLifespan() async {
    try {
      final db = await instance.database;
      final result = await db.query(
        _tableName,
        columns: [_columnBirthDate, _columnIdealAge],
      );

      if (result.isEmpty) {
        return LifespanRange(
          birthDate: DateTime(2000),
          idealAge: 100,
        );
      } else {
        return LifespanRange.fromJson(result.first);
      }
    } on DatabaseException catch (_) {
      return LifespanRange(
        birthDate: DateTime(2000),
        idealAge: 100,
      );
    }
  }

  /// Fetches the theme mode record from the database.
  Future<String> getThemeMode() async {
    try {
      final db = await instance.database;
      final result = await db.query(
        _tableName,
        columns: [_columnThemeMode],
      );

      if (result.isEmpty) {
        return 'system';
      } else {
        final themeMode = result.first[_columnThemeMode]! as String;
        return themeMode;
      }
    } on DatabaseException catch (_) {
      return 'system';
    }
  }

  /// Fetches whether the user is an initial user from the database.
  Future<bool> getIsInitialUser() async {
    try {
      final db = await instance.database;
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
  Future<bool> getIsDeletedUser() async {
    try {
      final db = await instance.database;
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

  /// Updates the lifespan record in the database.
  Future<void> updateLifespan({
    required DateTime birthDate,
    required int idealAge,
  }) async {
    try {
      final db = await instance.database;
      final response = await db.query(_tableName);
      if (response.isEmpty) {
        await db.insert(
          _tableName,
          {
            _columnBirthDate: birthDate.toIso8601String(),
            _columnIdealAge: idealAge,
          },
        );
      } else {
        await db.update(
          _tableName,
          {
            _columnBirthDate: birthDate.toIso8601String(),
            _columnIdealAge: idealAge,
          },
        );
      }
    } on DatabaseException catch (_) {}
  }

  /// Updates the theme mode record in the database.
  Future<void> updateThemeMode({
    required String themeMode,
  }) async {
    try {
      final db = await instance.database;
      final response = await db.query(_tableName);
      if (response.isNotEmpty) {
        await db.update(
          _tableName,
          {
            _columnThemeMode: themeMode,
          },
        );
      }
    } on DatabaseException catch (_) {}
  }

  /// Updates the user is not an initial user in the database.
  Future<void> updateUserIsNotInitialUser() async {
    try {
      final db = await instance.database;
      final response = await db.query(_tableName);
      if (response.isNotEmpty) {
        await db.update(
          _tableName,
          {
            _columnIsInitialUser: 0,
          },
        );
      }
    } on DatabaseException catch (_) {}
  }
}
