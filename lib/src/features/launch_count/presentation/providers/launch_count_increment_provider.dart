import 'package:life_battery/src/features/launch_count/data/launch_count_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'launch_count_increment_provider.g.dart';

/// Counts this cold start once. A provider rather than a bare repository call
/// so the review request can wait for the count to include this launch.
@Riverpod(keepAlive: true)
Future<void> launchCountIncrement(Ref ref) {
  return ref.read(launchCountRepositoryProvider).incrementLaunchCount();
}
