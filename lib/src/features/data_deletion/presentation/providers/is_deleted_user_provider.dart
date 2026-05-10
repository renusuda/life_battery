import 'package:life_battery/src/features/data_deletion/data/data_deletion_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_deleted_user_provider.g.dart';

@riverpod
class IsDeletedUser extends _$IsDeletedUser {
  @override
  Future<bool> build() =>
      ref.watch(dataDeletionRepositoryProvider).getIsDeletedUser();
}
