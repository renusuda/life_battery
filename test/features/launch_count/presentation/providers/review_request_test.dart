import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/launch_count/data/launch_count_repository_provider.dart';
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

  group('requestIfHeavyUser', () {
    test('Asks once from the tenth launch and records it', () async {
      fakeLaunchCount.launchCount = reviewRequestLaunchCount;

      await container.read(reviewRequestProvider.notifier).requestIfHeavyUser();
      await container.read(reviewRequestProvider.notifier).requestIfHeavyUser();

      expect(fakeInAppReview.requestReviewCount, 1);
      expect(fakeLaunchCount.hasRequestedReview, isTrue);
      expect(fakeAnalytics.reviewRequestCount, 1);
    });

    test('Does not ask before the tenth launch', () async {
      fakeLaunchCount.launchCount = reviewRequestLaunchCount - 1;

      await container.read(reviewRequestProvider.notifier).requestIfHeavyUser();

      expect(fakeInAppReview.requestReviewCount, 0);
    });
  });
}
