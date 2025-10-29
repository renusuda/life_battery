import 'package:life_battery/repositories/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_database.g.dart';

/// Deletes all data from the database.
@riverpod
Future<void> deleteAllData(Ref ref) async {
  final localDatabaseRepository = LocalDatabase();
  await localDatabaseRepository.deleteAllData();
}
