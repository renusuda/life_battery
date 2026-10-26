import 'dart:async';

import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/launch_count/data/launch_count_repository_provider.dart';
import 'package:life_battery/src/features/launch_count/presentation/providers/in_app_review_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_request_provider.g.dart';

/// The launch count from which a user is asked for a store review.
const reviewRequestLaunchCount = 10;

// keepAlive so the ref stays valid across the awaits in the request methods;
// nothing listens to this provider, so autoDispose would drop it mid-call.
@Riverpod(keepAlive: true)
class ReviewRequest extends _$ReviewRequest {
  @override
  void build() {}

  Future<void> requestIfHeavyUser() async {
    final launchCount = await ref
        .read(launchCountRepositoryProvider)
        .getLaunchCount();
    if (launchCount < reviewRequestLaunchCount) return;
    final hasRequestedReview = await ref
        .read(launchCountRepositoryProvider)
        .getHasRequestedReview();
    if (hasRequestedReview) return;

    final inAppReview = ref.read(inAppReviewProvider);
    if (await inAppReview.isAvailable()) {
      unawaited(ref.read(analyticsRepositoryProvider).logReviewRequest());
      await ref.read(launchCountRepositoryProvider).markReviewRequested();
      await inAppReview.requestReview();
    }
  }

  /// Asks right after the first result while it is still fresh. It is not
  /// recorded as the one-time request, so a heavy user is still asked later;
  /// the OS throttles the prompt either way.
  Future<void> requestAfterOnboarding() async {
    final inAppReview = ref.read(inAppReviewProvider);
    if (await inAppReview.isAvailable()) {
      unawaited(ref.read(analyticsRepositoryProvider).logReviewRequest());
      await inAppReview.requestReview();
    }
  }
}
