import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/is_initial_user_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_range_manager_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_indicator.dart';
import 'package:life_battery/src/features/onboarding/domain/onboarding_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/widget_guide_video.dart';
import 'package:life_battery/src/features/purchases/data/entitlements_repository_provider.dart';
import 'package:life_battery/src/features/purchases/data/purchases_repository_provider.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/premium_bottom_sheet.dart';
import 'package:life_battery/src/features/settings/presentation/widgets/widget_guide_steps.dart';

import '../../../../../test_helpers/fake_analytics.dart';
import '../../../../../test_helpers/fake_entitlements.dart';
import '../../../../../test_helpers/fake_purchases.dart';
import '../../../../../test_helpers/test_app.dart';

void main() {
  late FakeAnalyticsApiDataSource fakeAnalytics;
  late _FakeIsInitialUser fakeIsInitialUser;
  late _FakeLifespanRangeManager fakeLifespanRangeManager;

  setUp(() {
    // The guide video is a native view, which has no host in widget tests.
    TestWidgetsFlutterBinding.ensureInitialized().defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform_views, (_) async {
          return null;
        });
    fakeAnalytics = FakeAnalyticsApiDataSource();
    fakeIsInitialUser = _FakeIsInitialUser();
    fakeLifespanRangeManager = _FakeLifespanRangeManager();
  });

  Widget buildPage() {
    return ProviderScope(
      overrides: [
        analyticsApiDataSourceProvider.overrideWithValue(fakeAnalytics),
        // Needed by the paywall sheet.
        entitlementsLocalDataSourceProvider.overrideWithValue(
          FakeEntitlementsLocalDataSource(),
        ),
        purchasesApiDataSourceProvider.overrideWithValue(
          FakePurchasesApiDataSource(),
        ),
        lifespanRangeManagerProvider.overrideWith(
          () => fakeLifespanRangeManager,
        ),
        isInitialUserProvider.overrideWith(() => fakeIsInitialUser),
      ],
      child: const TestApp(home: OnboardingPage()),
    );
  }

  testWidgets('Asks for the ideal lifespan and logs onboarding_start', (
    tester,
  ) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();

    expect(find.text('How long do you want to live?'), findsOneWidget);
    expect(find.byKey(const Key('idealAgeText')), findsOneWidget);
    expect(fakeAnalytics.onboardingStartCount, 1);
  });

  testWidgets('Shows the Japanese copy', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('ja')];
    await tester.pumpWidget(buildPage());
    await tester.pump();

    expect(find.text('何歳まで生きたいですか？'), findsOneWidget);
    expect(find.text('次へ'), findsOneWidget);
  });

  testWidgets('Saves the stepped ideal lifespan', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();

    await tester.tap(find.byKey(const Key('idealAgePreset80')));
    await tester.pump();

    expect(fakeLifespanRangeManager.state.value?.idealAge, 80);
    expect(fakeLifespanRangeManager.state.value?.birthDate, DateTime(1990));
  });

  Future<void> goToBirthDate(WidgetTester tester) async {
    await tester.tap(find.text('Continue'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
  }

  testWidgets('Asks for the birth date after the ideal lifespan', (
    tester,
  ) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();

    await goToBirthDate(tester);

    expect(find.text('When were you born?'), findsOneWidget);
    expect(find.byType(CupertinoDatePicker), findsOneWidget);
    expect(fakeAnalytics.onboardingCompleteCount, 0);
  });

  testWidgets('Saves the picked date as the birth date', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();
    await goToBirthDate(tester);

    final picker = tester.widget<CupertinoDatePicker>(
      find.byType(CupertinoDatePicker),
    );
    picker.onDateTimeChanged(DateTime(1985, 6, 15));
    await tester.pump();

    expect(
      fakeLifespanRangeManager.state.value?.birthDate,
      DateTime(1985, 6, 15),
    );
    expect(fakeLifespanRangeManager.state.value?.idealAge, 90);
  });

  testWidgets('Limits the birth date so the current age stays under the '
      'ideal lifespan', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();
    await goToBirthDate(tester);

    final picker = tester.widget<CupertinoDatePicker>(
      find.byType(CupertinoDatePicker),
    );
    final now = DateTime.now();
    expect(
      picker.minimumDate,
      DateTime(now.year - 90, now.month, now.day + 1),
    );
  });

  testWidgets('Enables the back button from the second step only', (
    tester,
  ) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();

    final backFinder = find.byKey(const Key('onboardingBack'));
    expect(tester.widget<IconButton>(backFinder).onPressed, isNull);

    await goToBirthDate(tester);

    expect(tester.widget<IconButton>(backFinder).onPressed, isNotNull);
  });

  testWidgets('Goes back to the ideal lifespan step', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();
    await goToBirthDate(tester);

    await tester.tap(find.byKey(const Key('onboardingBack')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('How long do you want to live?'), findsOneWidget);
  });

  testWidgets('Logs each passed step once, even after going back', (
    tester,
  ) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();
    await goToBirthDate(tester);

    await tester.tap(find.byKey(const Key('onboardingBack')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    await goToBirthDate(tester);

    expect(fakeAnalytics.onboardingSteps, [OnboardingStep.idealAge]);
  });

  Future<void> goToResult(WidgetTester tester) async {
    await goToBirthDate(tester);
    await tester.tap(find.text('Continue'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
  }

  testWidgets('Shows the remaining life as a battery on the result step', (
    tester,
  ) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();
    await goToResult(tester);

    final now = DateTime.now();
    final range = LifespanRange(birthDate: DateTime(1990), idealAge: 90);
    final percentage = range.remainingLifePercentage(now: now);
    BatteryIndicator battery() =>
        tester.widget<BatteryIndicator>(find.byType(BatteryIndicator));
    final titleFinder = find.text('You have $percentage% of your life left');
    Opacity titleOpacity() => tester.widget<Opacity>(
      find.ancestor(of: titleFinder, matching: find.byType(Opacity)).first,
    );

    // Starts full with the words hidden, then decreases and reveals them.
    expect(battery().value, 100);
    expect(titleOpacity().opacity, 0);

    await tester.pumpAndSettle();

    expect(battery().value, percentage);
    expect(battery().text, '$percentage%');
    expect(titleOpacity().opacity, 1);
    expect(fakeAnalytics.onboardingCompleteCount, 0);
  });

  Future<void> goToWidget(WidgetTester tester) async {
    await goToResult(tester);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
  }

  testWidgets('Explains how to add the home screen widget', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();
    await goToWidget(tester);

    expect(find.text('Add the widget to your Home Screen'), findsOneWidget);
    expect(fakeAnalytics.onboardingCompleteCount, 0);
  });

  testWidgets(
    'Plays the guide video on iOS where it can continue as Picture in Picture',
    (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(buildPage());
      await tester.pump();
      await goToWidget(tester);

      expect(find.byType(WidgetGuideVideo), findsOneWidget);
      expect(find.byType(WidgetGuideSteps), findsNothing);
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );

  testWidgets(
    'Shows the steps only on Android',
    (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(buildPage());
      await tester.pump();
      await goToWidget(tester);

      expect(find.byType(WidgetGuideVideo), findsNothing);
      expect(find.byType(WidgetGuideSteps), findsOneWidget);
    },
    variant: TargetPlatformVariant.only(TargetPlatform.android),
  );

  testWidgets(
    'Shows the paywall before finishing on iOS where the widget is paid',
    (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(buildPage());
      await tester.pump();
      await goToWidget(tester);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.byType(PremiumBottomSheet), findsOneWidget);
      expect(fakeAnalytics.onboardingCompleteCount, 0);

      Navigator.of(tester.element(find.byType(PremiumBottomSheet))).pop();
      await tester.pumpAndSettle();

      expect(fakeAnalytics.onboardingCompleteCount, 1);
      expect(fakeIsInitialUser.isInitialUser, isFalse);
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );

  testWidgets(
    'Finishes onboarding and logs onboarding_complete on the last step',
    (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(buildPage());
      await tester.pump();
      await goToWidget(tester);

      await tester.tap(find.text('Continue'));
      await tester.pump();

      expect(fakeAnalytics.onboardingSteps, OnboardingStep.values);
      expect(fakeAnalytics.onboardingCompleteCount, 1);
      expect(fakeIsInitialUser.isInitialUser, isFalse);
    },
    variant: TargetPlatformVariant.only(TargetPlatform.android),
  );
}

class _FakeLifespanRangeManager extends LifespanRangeManager {
  @override
  Future<LifespanRange> build() async {
    return LifespanRange(birthDate: DateTime(1990), idealAge: 90);
  }

  @override
  Future<void> updateLifespanRange({
    required DateTime birthDate,
    required int idealAge,
  }) async {
    state = AsyncData(LifespanRange(birthDate: birthDate, idealAge: idealAge));
  }
}

class _FakeIsInitialUser extends IsInitialUser {
  bool isInitialUser = true;

  @override
  Future<bool> build() async => isInitialUser;

  @override
  Future<void> updateUserIsNotInitialUser() async {
    isInitialUser = false;
    state = const AsyncData(false);
  }
}
