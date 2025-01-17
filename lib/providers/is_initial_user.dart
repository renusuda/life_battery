import 'package:life_battery/repositories/lifespan_repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_initial_user.g.dart';

/// app theme mode.
@riverpod
class IsInitialUser extends _$IsInitialUser {
  /// lifespan repository
  static final _lifespanRepository = LifespanRepository();

  @override
  Future<bool> build() => fetchIsInitialUser();

  /// Fetches the theme mode from Local Storage.
  Future<bool> fetchIsInitialUser() async {
    final response = await _lifespanRepository.getIsInitialUser();
    return response;
  }

  /// Updates the theme mode in Local Storage.
  Future<void> updateUserIsNotInitialUser() async {
    await _lifespanRepository.updateUserIsNotInitialUser();
  }
}
