import 'package:life_battery/src/features/launch_count/domain/review_request_source.dart';
import 'package:life_battery/src/features/onboarding/domain/onboarding_step.dart';
import 'package:life_battery/src/features/purchases/domain/paywall_source.dart';
import 'package:life_battery/src/features/purchases/domain/premium_plan.dart';
import 'package:life_battery/src/features/share/domain/share_outcome.dart';
import 'package:life_battery/src/features/share/domain/share_source.dart';

abstract interface class AnalyticsApiDataSource {
  Future<void> logOnboardingStart();

  Future<void> logOnboardingStep({required OnboardingStep step});

  Future<void> logOnboardingComplete();

  Future<void> logPaywallView({required PaywallSource source});

  Future<void> logPurchaseStart({required PremiumPlan plan});

  Future<void> logPurchaseComplete({required PremiumPlan plan});

  Future<void> logPurchaseCancel({required PremiumPlan plan});

  Future<void> logPurchaseError({required PremiumPlan plan});

  Future<void> logSubscriptionRenew();

  Future<void> logReviewTap();

  /// [launchCount] is the threshold that triggered a launch-count request;
  /// null for the other sources.
  Future<void> logReviewRequest({
    required ReviewRequestSource source,
    int? launchCount,
  });

  Future<void> logWidgetGuideView();

  Future<void> logNotificationPermissionResult({required bool granted});

  Future<void> logShare({
    required ShareSource source,
    required ShareOutcome result,
  });
}
