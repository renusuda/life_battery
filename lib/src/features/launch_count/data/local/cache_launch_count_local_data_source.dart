import 'package:life_battery/src/database/local_database.dart';
import 'package:life_battery/src/features/launch_count/data/local/launch_count_local_data_source.dart';
import 'package:sqflite/sqflite.dart';

class CacheLaunchCountLocalDataSource implements LaunchCountLocalDataSource {
  const CacheLaunchCountLocalDataSource({
    required LocalDatabase localDatabase,
  }) : _localDatabase = localDatabase;

  final LocalDatabase _localDatabase;

  static const _tableName = 'lifespan';
  static const _columnLaunchCount = 'launchCount';

  @override
  Future<int> getLaunchCount() async {
    try {
      final db = await _localDatabase.database;
      final result = await db.query(
        _tableName,
        columns: [_columnLaunchCount],
      );

      if (result.isEmpty) {
        return 0;
      } else {
        return result.first[_columnLaunchCount]! as int;
      }
    } on DatabaseException catch (_) {
      return 0;
    }
  }

  @override
  Future<void> incrementLaunchCount() async {
    try {
      final db = await _localDatabase.database;
      await db.rawUpdate(
        'UPDATE $_tableName '
        'SET $_columnLaunchCount = $_columnLaunchCount + 1',
      );
    } on DatabaseException catch (_) {}
  }
}
