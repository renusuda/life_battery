import 'package:in_app_review/in_app_review.dart';
import 'package:life_battery/src/features/launch_count/data/launch_count_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_request_provider.g.dart';

/// The launch on which a heavy user is asked for a store review.
const reviewRequestLaunchCount = 10;

@riverpod
class ReviewRequest extends _$ReviewRequest {
  @override
  void build() {}

  Future<void> requestIfHeavyUser() async {
    final launchCount = await ref
        .read(launchCountRepositoryProvider)
        .getLaunchCount();
    if (launchCount != reviewRequestLaunchCount) return;

    final inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }
  }
}
