import 'package:life_battery/src/database/local_database_provider.dart';
import 'package:life_battery/src/features/launch_count/data/launch_count_repository.dart';
import 'package:life_battery/src/features/launch_count/data/local/cache_launch_count_local_data_source.dart';
import 'package:life_battery/src/features/launch_count/data/local/launch_count_local_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'launch_count_repository_provider.g.dart';

@Riverpod(keepAlive: true)
LaunchCountLocalDataSource launchCountLocalDataSource(Ref ref) {
  final database = ref.watch(localDatabaseProvider);
  return CacheLaunchCountLocalDataSource(localDatabase: database);
}

@Riverpod(keepAlive: true)
LaunchCountRepository launchCountRepository(Ref ref) {
  final localDataSource = ref.watch(launchCountLocalDataSourceProvider);
  return LaunchCountRepository(localDataSource: localDataSource);
}
