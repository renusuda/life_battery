import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_initial_user_provider.g.dart';

@riverpod
class IsInitialUser extends _$IsInitialUser {
  @override
  Future<bool> build() =>
      ref.read(lifespanRepositoryProvider).getIsInitialUser();

  Future<void> updateUserIsNotInitialUser() async {
    await ref.read(lifespanRepositoryProvider).updateUserIsNotInitialUser();
  }
}
