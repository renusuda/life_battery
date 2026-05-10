import 'package:life_battery/src/features/data_deletion/data/local/data_deletion_local_data_source.dart';

class DataDeletionRepository {
  const DataDeletionRepository({
    required DataDeletionLocalDataSource dataSource,
  }) : _dataSource = dataSource;

  final DataDeletionLocalDataSource _dataSource;

  Future<bool> getIsDeletedUser() {
    return _dataSource.getIsDeletedUser();
  }

  Future<void> deleteAllData() {
    return _dataSource.deleteAllData();
  }

  bool get isUserDeleted => _dataSource.isUserDeleted;

  Stream<bool> isUserDeletedStateChanges() {
    return _dataSource.isUserDeletedStateChanges();
  }
}
