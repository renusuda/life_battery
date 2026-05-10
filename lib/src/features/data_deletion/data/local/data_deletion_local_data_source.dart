abstract interface class DataDeletionLocalDataSource {
  Future<bool> getIsDeletedUser();

  Future<void> deleteAllData();

  bool get isUserDeleted;

  Stream<bool> isUserDeletedStateChanges();
}
