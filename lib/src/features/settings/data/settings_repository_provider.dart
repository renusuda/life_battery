import 'package:life_battery/src/database/local_database_provider.dart';
import 'package:life_battery/src/features/settings/data/local/cache_settings_local_data_source.dart';
import 'package:life_battery/src/features/settings/data/local/settings_local_data_source.dart';
import 'package:life_battery/src/features/settings/data/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_repository_provider.g.dart';

@Riverpod(keepAlive: true)
SettingsLocalDataSource settingsLocalDataSource(Ref ref) {
  final database = ref.watch(localDatabaseProvider);
  final localDataSource = CacheSettingsLocalDataSource(localDatabase: database);
  return localDataSource;
}

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) {
  final localDataSource = ref.watch(settingsLocalDataSourceProvider);
  return SettingsRepository(localDataSource: localDataSource);
}
