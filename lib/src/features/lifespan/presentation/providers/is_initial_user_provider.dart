import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_initial_user_provider.g.dart';

/// app theme mode.
@riverpod
class IsInitialUser extends _$IsInitialUser {
  @override
  Future<bool> build() =>
      ref.read(lifespanRepositoryProvider).getIsInitialUser();

  /// Updates the theme mode in Local Storage.
  Future<void> updateUserIsNotInitialUser() async {
    await ref.read(lifespanRepositoryProvider).updateUserIsNotInitialUser();
  }
}
