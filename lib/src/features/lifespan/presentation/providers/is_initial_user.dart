import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_initial_user.g.dart';

/// app theme mode.
@riverpod
class IsInitialUser extends _$IsInitialUser {
  @override
  Future<bool> build() => fetchIsInitialUser();

  /// Fetches the theme mode from Local Storage.
  Future<bool> fetchIsInitialUser() async {
    final response =
        await ref.read(lifespanRepositoryProvider).getIsInitialUser();
    return response;
  }

  /// Updates the theme mode in Local Storage.
  Future<void> updateUserIsNotInitialUser() async {
    await ref.read(lifespanRepositoryProvider).updateUserIsNotInitialUser();
  }
}
