import 'package:life_battery/src/database/local_database.dart';
import 'package:life_battery/src/features/lifespan/data/lifespan_repository.dart';
import 'package:life_battery/src/features/lifespan/data/local/cache_lifespan_local_data_source.dart';
import 'package:life_battery/src/features/lifespan/data/local/lifespan_local_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lifespan_repository_provider.g.dart';

@Riverpod(keepAlive: true)
LocalDatabase localDatabase(Ref ref) {
  final database = LocalDatabase();
  return database;
}

@Riverpod(keepAlive: true)
LifespanLocalDataSource lifespanLocalDataSource(Ref ref) {
  final database = ref.watch(localDatabaseProvider);
  final localDataSource = CacheLifespanLocalDataSource(localDatabase: database);
  ref.onDispose(localDataSource.dispose);
  return localDataSource;
}

@Riverpod(keepAlive: true)
LifespanRepository lifespanRepository(Ref ref) {
  final localDataSource = ref.watch(lifespanLocalDataSourceProvider);
  return LifespanRepository(localDataSource: localDataSource);
}
