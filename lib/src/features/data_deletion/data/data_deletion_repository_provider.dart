import 'package:life_battery/src/database/local_database_provider.dart';
import 'package:life_battery/src/features/data_deletion/data/data_deletion_repository.dart';
import 'package:life_battery/src/features/data_deletion/data/local/cache_data_deletion_local_data_source.dart';
import 'package:life_battery/src/features/data_deletion/data/local/data_deletion_local_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_deletion_repository_provider.g.dart';

@Riverpod(keepAlive: true)
DataDeletionLocalDataSource dataDeletionLocalDataSource(Ref ref) {
  final database = ref.watch(localDatabaseProvider);
  final localDataSource = CacheDataDeletionLocalDataSource(
    localDatabase: database,
  );
  ref.onDispose(localDataSource.dispose);
  return localDataSource;
}

@Riverpod(keepAlive: true)
DataDeletionRepository dataDeletionRepository(Ref ref) {
  final dataSource = ref.watch(dataDeletionLocalDataSourceProvider);
  return DataDeletionRepository(dataSource: dataSource);
}
