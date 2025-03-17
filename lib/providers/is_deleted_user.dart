import 'package:life_battery/repositories/lifespan_repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_deleted_user.g.dart';

/// Whether the user is deleted.
@riverpod
class IsDeletedUser extends _$IsDeletedUser {
  /// lifespan repository
  static final _lifespanRepository = LifespanRepository();

  @override
  Future<bool> build() => fetchIsDeletedUser();

  /// Fetches whether user is deleted from Local Storage.
  Future<bool> fetchIsDeletedUser() async {
    final response = await _lifespanRepository.getIsDeletedUser();
    return response;
  }
}
