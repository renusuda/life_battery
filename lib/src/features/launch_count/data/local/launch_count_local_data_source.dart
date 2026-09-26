abstract interface class LaunchCountLocalDataSource {
  Future<int> getLaunchCount();

  Future<void> incrementLaunchCount();

  Future<bool> getHasRequestedReview();

  Future<void> markReviewRequested();
}
