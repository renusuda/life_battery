import 'package:life_battery/src/database/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_database_provider.g.dart';

@Riverpod(keepAlive: true)
LocalDatabase localDatabase(Ref ref) {
  final database = LocalDatabase();
  return database;
}
