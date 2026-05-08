import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_all_data_provider.g.dart';

/// Deletes all data from the database.
@riverpod
Future<void> deleteAllData(Ref ref) async {
  await ref.read(lifespanRepositoryProvider).deleteAllData();
}
