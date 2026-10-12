import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:life_battery/src/features/lifespan/data/local/lifespan_local_data_source.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/is_initial_user_provider.dart';

void main() {
  test(
    'Reports a non-initial user right after the flag is cleared',
    () async {
      final container = ProviderContainer(
        overrides: [
          lifespanLocalDataSourceProvider.overrideWithValue(
            _FakeLifespanLocalDataSource(),
          ),
        ],
      );
      addTearDown(container.dispose);
      final subscription = container.listen(isInitialUserProvider, (_, _) {});
      addTearDown(subscription.close);

      expect(await container.read(isInitialUserProvider.future), isTrue);

      await container
          .read(isInitialUserProvider.notifier)
          .updateUserIsNotInitialUser();

      expect(await container.read(isInitialUserProvider.future), isFalse);
    },
  );
}

class _FakeLifespanLocalDataSource implements LifespanLocalDataSource {
  bool _isInitialUser = true;

  @override
  Future<bool> getIsInitialUser() async => _isInitialUser;

  @override
  Future<void> updateUserIsNotInitialUser() async {
    _isInitialUser = false;
  }

  @override
  Future<LifespanRange> getLifespan() async =>
      LifespanRange(birthDate: DateTime(2000), idealAge: 100);

  @override
  Future<bool> getHasLongPressed() async => false;

  @override
  Future<bool> getIsPercentageMode() async => true;

  @override
  Future<void> updateLifespan({
    required DateTime birthDate,
    required int idealAge,
  }) async {}

  @override
  Future<void> updateIsPercentageMode({required bool isPercentageMode}) async {}

  @override
  Future<void> updateHasLongPressed() async {}
}
