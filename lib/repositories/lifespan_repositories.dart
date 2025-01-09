import 'package:life_battery/models/lifespan_range.dart';
import 'package:life_battery/repositories/local_database.dart';
import 'package:sqflite/sqflite.dart';

/// A class that manages the lifespan records in the database.
class LifespanRepository {
  /// Returns the instance of the local database.
  static final instance = LocalDatabase();

  static const _tableName = 'lifespan';
  static const _columnBirthDate = 'birthDate';
  static const _columnDeathDate = 'deathDate';

  /// Fetches the lifespan record from the database.
  Future<LifespanRange> getLifespan() async {
    try {
      final db = await instance.database;
      final result = await db.query(
        _tableName,
        columns: [_columnBirthDate, _columnDeathDate],
      );

      if (result.isEmpty) {
        return LifespanRange(
          birthDate: null,
          deathDate: null,
        );
      } else {
        return LifespanRange.fromJson(result.first);
      }
    } on DatabaseException catch (_) {
      return LifespanRange(
        birthDate: null,
        deathDate: null,
      );
    }
  }

  /// Updates the lifespan record of the database.
  Future<void> updateLifespan({
    required DateTime birthDate,
    required DateTime deathDate,
  }) async {
    try {
      final db = await instance.database;
      final response = await db.query(_tableName);
      if (response.isEmpty) {
        await db.insert(
          _tableName,
          {
            _columnBirthDate: birthDate.toIso8601String(),
            _columnDeathDate: deathDate.toIso8601String(),
          },
        );
      } else {
        await db.update(
          _tableName,
          {
            _columnBirthDate: birthDate.toIso8601String(),
            _columnDeathDate: deathDate.toIso8601String(),
          },
        );
      }
    } on DatabaseException catch (_) {}
  }
}
