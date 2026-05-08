import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_deleted_user_provider.g.dart';

/// Whether the user is deleted.
@riverpod
class IsDeletedUser extends _$IsDeletedUser {
  @override
  Future<bool> build() => fetchIsDeletedUser();

  /// Fetches whether user is deleted from Local Storage.
  Future<bool> fetchIsDeletedUser() async {
    final response = await ref
        .read(lifespanRepositoryProvider)
        .getIsDeletedUser();
    return response;
  }
}
