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
