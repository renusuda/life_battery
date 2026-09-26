import 'package:life_battery/src/features/launch_count/data/local/launch_count_local_data_source.dart';

class FakeLaunchCountLocalDataSource implements LaunchCountLocalDataSource {
  FakeLaunchCountLocalDataSource({
    this.launchCount = 0,
    this.hasRequestedReview = false,
  });

  int launchCount;

  bool hasRequestedReview;

  int getCallCount = 0;

  @override
  Future<int> getLaunchCount() async {
    getCallCount++;
    return launchCount;
  }

  @override
  Future<void> incrementLaunchCount() async {
    launchCount++;
  }

  @override
  Future<bool> getHasRequestedReview() async => hasRequestedReview;

  @override
  Future<void> markReviewRequested() async {
    hasRequestedReview = true;
  }
}
