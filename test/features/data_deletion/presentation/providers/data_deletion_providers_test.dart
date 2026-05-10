import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/data_deletion/data/data_deletion_repository.dart';
import 'package:life_battery/src/features/data_deletion/data/data_deletion_repository_provider.dart';
import 'package:life_battery/src/features/data_deletion/data/local/data_deletion_local_data_source.dart';
import 'package:life_battery/src/features/data_deletion/presentation/providers/delete_all_data_provider.dart';
import 'package:life_battery/src/features/data_deletion/presentation/providers/is_deleted_user_provider.dart';

void main() {
  ProviderContainer makeContainer(FakeDataDeletionLocalDataSource dataSource) {
    final container = ProviderContainer(
      overrides: [
        dataDeletionRepositoryProvider.overrideWithValue(
          DataDeletionRepository(dataSource: dataSource),
        ),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('IsDeletedUser', () {
    test('returns deleted user state from repository', () async {
      final container = makeContainer(
        FakeDataDeletionLocalDataSource(isDeletedUser: true),
      );

      expect(await container.read(isDeletedUserProvider.future), isTrue);
    });
  });

  group('DeleteAllData', () {
    test('delegates delete all data to repository', () async {
      final dataSource = FakeDataDeletionLocalDataSource(
        isDeletedUser: false,
      );
      final container = makeContainer(dataSource);

      await container.read(deleteAllDataProvider.notifier).execute();

      expect(dataSource.deleteAllDataCallCount, 1);
    });
  });
}

class FakeDataDeletionLocalDataSource implements DataDeletionLocalDataSource {
  FakeDataDeletionLocalDataSource({required bool isDeletedUser})
    : _isDeletedUser = isDeletedUser;

  bool _isDeletedUser;
  int deleteAllDataCallCount = 0;

  @override
  Future<bool> getIsDeletedUser() async => _isDeletedUser;

  @override
  Future<void> deleteAllData() async {
    deleteAllDataCallCount++;
    _isDeletedUser = true;
  }

  @override
  bool get isUserDeleted => _isDeletedUser;

  @override
  Stream<bool> isUserDeletedStateChanges() => const Stream.empty();
}
