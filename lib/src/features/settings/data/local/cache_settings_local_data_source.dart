import 'package:life_battery/src/database/local_database.dart';
import 'package:life_battery/src/features/settings/data/local/settings_local_data_source.dart';
import 'package:sqflite/sqflite.dart';

class CacheSettingsLocalDataSource implements SettingsLocalDataSource {
  const CacheSettingsLocalDataSource({required LocalDatabase localDatabase})
    : _localDatabase = localDatabase;

  final LocalDatabase _localDatabase;

  static const _tableName = 'lifespan';
  static const _columnThemeMode = 'themeMode';

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
  Future<void> updateThemeMode({required String themeMode}) async {
    try {
      final db = await _localDatabase.database;
      final response = await db.query(_tableName);
      if (response.isNotEmpty) {
        await db.update(_tableName, {_columnThemeMode: themeMode});
      }
    } on DatabaseException catch (_) {}
  }
}
