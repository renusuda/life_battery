import 'dart:async';

import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/launch_count/data/launch_count_repository_provider.dart';
import 'package:life_battery/src/features/launch_count/domain/review_request_source.dart';
import 'package:life_battery/src/features/launch_count/presentation/providers/in_app_review_provider.dart';
import 'package:life_battery/src/features/launch_count/presentation/providers/launch_count_increment_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_request_provider.g.dart';

/// The cold starts on which a user is asked for a store review.
const reviewRequestLaunchCounts = [5, 10];

/// Lets the home page settle before the prompt covers it.
const reviewRequestDelay = Duration(milliseconds: 1500);

// keepAlive so the ref stays valid across the awaits in the request methods;
// nothing listens to this provider, so autoDispose would drop it mid-call.
@Riverpod(keepAlive: true)
class ReviewRequest extends _$ReviewRequest {
  // Nothing is persisted about past requests, so this is what keeps a launch
  // to one request when the home page is built again, including right after
  // onboarding.
  var _hasHandledThisLaunch = false;

  @override
  void build() {}

  Future<void> requestAtLaunchMilestone() async {
    if (_hasHandledThisLaunch) return;
    _hasHandledThisLaunch = true;

    await ref.read(launchCountIncrementProvider.future);
    final launchCount = await ref
        .read(launchCountRepositoryProvider)
        .getLaunchCount();
    if (!reviewRequestLaunchCounts.contains(launchCount)) return;

    final inAppReview = ref.read(inAppReviewProvider);
    if (await inAppReview.isAvailable()) {
      unawaited(
        ref
            .read(analyticsRepositoryProvider)
            .logReviewRequest(
              source: ReviewRequestSource.launchCount,
              launchCount: launchCount,
            ),
      );
      await inAppReview.requestReview();
    }
  }

  /// Asks right after the first result while it is still fresh.
  Future<void> requestAfterOnboarding() async {
    _hasHandledThisLaunch = true;
    final inAppReview = ref.read(inAppReviewProvider);
    if (await inAppReview.isAvailable()) {
      unawaited(
        ref
            .read(analyticsRepositoryProvider)
            .logReviewRequest(source: ReviewRequestSource.onboarding),
      );
      await inAppReview.requestReview();
    }
  }
}
