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

    test('Does nothing when the store prompt is unavailable', () async {
      fakeInAppReview.available = false;

      await container
          .read(reviewRequestProvider.notifier)
          .requestAfterOnboarding();

      expect(fakeInAppReview.requestReviewCount, 0);
      expect(fakeAnalytics.reviewRequests, isEmpty);
    });
  });

  group('requestAtLaunchMilestone', () {
    test('Asks on the fifth launch and logs review_request', () async {
      fakeLaunchCount.launchCount = 4;

      await container
          .read(reviewRequestProvider.notifier)
          .requestAtLaunchMilestone();

      expect(fakeInAppReview.requestReviewCount, 1);
      final request = fakeAnalytics.reviewRequests.single;
      expect(request.source, ReviewRequestSource.launchCount);
      expect(request.launchCount, 5);
    });

    test('Asks on the tenth launch', () async {
      fakeLaunchCount.launchCount = 9;

      await container
          .read(reviewRequestProvider.notifier)
          .requestAtLaunchMilestone();

      expect(fakeInAppReview.requestReviewCount, 1);
      expect(fakeAnalytics.reviewRequests.single.launchCount, 10);
    });

    for (final previousLaunchCount in [3, 5, 8, 10]) {
      test('Does not ask on launch ${previousLaunchCount + 1}', () async {
        fakeLaunchCount.launchCount = previousLaunchCount;

        await container
            .read(reviewRequestProvider.notifier)
            .requestAtLaunchMilestone();

        expect(fakeInAppReview.requestReviewCount, 0);
        expect(fakeAnalytics.reviewRequests, isEmpty);
      });
    }

    test('Asks only once in a launch', () async {
      fakeLaunchCount.launchCount = 4;

      await container
          .read(reviewRequestProvider.notifier)
          .requestAtLaunchMilestone();
      await container
          .read(reviewRequestProvider.notifier)
          .requestAtLaunchMilestone();

      expect(fakeInAppReview.requestReviewCount, 1);
    });

    test('Does not ask in the launch that finished onboarding', () async {
      fakeLaunchCount.launchCount = 4;

      await container
          .read(reviewRequestProvider.notifier)
          .requestAfterOnboarding();
      await container
          .read(reviewRequestProvider.notifier)
          .requestAtLaunchMilestone();

      expect(fakeInAppReview.requestReviewCount, 1);
      expect(
        fakeAnalytics.reviewRequests.single.source,
        ReviewRequestSource.onboarding,
      );
    });

    test('Does nothing when the store prompt is unavailable', () async {
      fakeLaunchCount.launchCount = 4;
      fakeInAppReview.available = false;

      await container
          .read(reviewRequestProvider.notifier)
          .requestAtLaunchMilestone();

      expect(fakeInAppReview.requestReviewCount, 0);
      expect(fakeAnalytics.reviewRequests, isEmpty);
    });
  });
}
