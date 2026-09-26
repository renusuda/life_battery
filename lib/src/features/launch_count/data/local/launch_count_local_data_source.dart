abstract interface class LaunchCountLocalDataSource {
  Future<int> getLaunchCount();

  Future<void> incrementLaunchCount();
}
