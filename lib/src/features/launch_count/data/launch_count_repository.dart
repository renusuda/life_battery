import 'package:life_battery/src/features/launch_count/data/local/launch_count_local_data_source.dart';

class LaunchCountRepository {
  const LaunchCountRepository({
    required LaunchCountLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final LaunchCountLocalDataSource _localDataSource;

  Future<int> getLaunchCount() {
    return _localDataSource.getLaunchCount();
  }

  Future<void> incrementLaunchCount() {
    return _localDataSource.incrementLaunchCount();
  }
}
