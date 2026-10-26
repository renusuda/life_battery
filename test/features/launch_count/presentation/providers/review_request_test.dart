import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/launch_count/data/launch_count_repository_provider.dart';
import 'package:life_battery/src/features/launch_count/domain/review_request_source.dart';
import 'package:life_battery/src/features/launch_count/presentation/providers/in_app_review_provider.dart';
import 'package:life_battery/src/features/launch_count/presentation/providers/review_request_provider.dart';

import '../../../../../test_helpers/fake_analytics.dart';
import '../../../../../test_helpers/fake_in_app_review.dart';
import '../../../../../test_helpers/fake_launch_count.dart';

void main() {
  late FakeAnalyticsApiDataSource fakeAnalytics;
  late FakeInAppReview fakeInAppReview;
  late FakeLaunchCountLocalDataSource fakeLaunchCount;
  late ProviderContainer container;

  setUp(() {
    fakeAnalytics = FakeAnalyticsApiDataSource();
    fakeInAppReview = FakeInAppReview();
    fakeLaunchCount = FakeLaunchCountLocalDataSource();
    container = ProviderContainer(
      overrides: [
        analyticsApiDataSourceProvider.overrideWithValue(fakeAnalytics),
        inAppReviewProvider.overrideWithValue(fakeInAppReview),
        launchCountLocalDataSourceProvider.overrideWithValue(fakeLaunchCount),
      ],
    );
    addTearDown(container.dispose);
  });

  group('requestAfterOnboarding', () {
    test('Asks for a review and logs review_request', () async {
      await container
          .read(reviewRequestProvider.notifier)
          .requestAfterOnboarding();

      expect(fakeInAppReview.requestReviewCount, 1);
      final request = fakeAnalytics.reviewRequests.single;
      expect(request.source, ReviewRequestSource.onboarding);
      expect(request.launchCount, isNull);
    });

    test('Leaves the one-time request for heavy users untouched', () async {
      await container
          .read(reviewRequestProvider.notifier)
          .requestAfterOnboarding();

      expect(fakeLaunchCount.hasRequestedReview, isFalse);
    });

    test('Does nothing when the store prompt is unavailable', () async {
      fakeInAppReview.available = false;

      await container
          .read(reviewRequestProvider.notifier)
          .requestAfterOnboarding();

      expect(fakeInAppReview.requestReviewCount, 0);
      expect(fakeAnalytics.reviewRequests, isEmpty);
    });
  });

  group('requestIfHeavyUser', () {
    test('Asks once from the tenth launch and records it', () async {
      fakeLaunchCount.launchCount = reviewRequestLaunchCount;

      await container.read(reviewRequestProvider.notifier).requestIfHeavyUser();
      await container.read(reviewRequestProvider.notifier).requestIfHeavyUser();

      expect(fakeInAppReview.requestReviewCount, 1);
      expect(fakeLaunchCount.hasRequestedReview, isTrue);
      final request = fakeAnalytics.reviewRequests.single;
      expect(request.source, ReviewRequestSource.launchCount);
      expect(request.launchCount, reviewRequestLaunchCount);
    });

    test('Does not ask before the tenth launch', () async {
      fakeLaunchCount.launchCount = reviewRequestLaunchCount - 1;

      await container.read(reviewRequestProvider.notifier).requestIfHeavyUser();

      expect(fakeInAppReview.requestReviewCount, 0);
    });
  });
}
