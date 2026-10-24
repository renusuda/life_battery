import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/is_initial_user_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_range_manager_provider.dart';
import 'package:life_battery/src/features/onboarding/presentation/pages/onboarding_page.dart';

import '../../../../../test_helpers/fake_analytics.dart';
import '../../../../../test_helpers/test_app.dart';

void main() {
  late FakeAnalyticsApiDataSource fakeAnalytics;
  late _FakeIsInitialUser fakeIsInitialUser;
  late _FakeLifespanRangeManager fakeLifespanRangeManager;

  setUp(() {
    fakeAnalytics = FakeAnalyticsApiDataSource();
    fakeIsInitialUser = _FakeIsInitialUser();
    fakeLifespanRangeManager = _FakeLifespanRangeManager();
  });

  Widget buildPage() {
    return ProviderScope(
      overrides: [
        analyticsApiDataSourceProvider.overrideWithValue(fakeAnalytics),
        lifespanRangeManagerProvider.overrideWith(
          () => fakeLifespanRangeManager,
        ),
        isInitialUserProvider.overrideWith(() => fakeIsInitialUser),
      ],
      child: const TestApp(home: OnboardingPage()),
    );
  }

  testWidgets('Asks for the birth date and logs onboarding_start', (
    tester,
  ) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();

    expect(find.text('When were you born?'), findsOneWidget);
    expect(find.byType(CupertinoDatePicker), findsOneWidget);
    expect(fakeAnalytics.onboardingStartCount, 1);
  });

  testWidgets('Shows the Japanese copy', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('ja')];
    await tester.pumpWidget(buildPage());
    await tester.pump();

    expect(find.text('誕生日はいつですか？'), findsOneWidget);
    expect(find.text('続ける'), findsOneWidget);
  });

  testWidgets('Saves the picked date as the birth date', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();

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

  Future<void> goToIdealAge(WidgetTester tester) async {
    await tester.tap(find.text('Continue'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
  }

  testWidgets('Asks for the ideal lifespan after the birth date', (
    tester,
  ) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();

    await goToIdealAge(tester);

    expect(find.text('How long do you want to live?'), findsOneWidget);
    expect(find.byKey(const Key('idealAgeText')), findsOneWidget);
    expect(fakeAnalytics.onboardingCompleteCount, 0);
  });

  testWidgets('Enables the back button from the second step only', (
    tester,
  ) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();

    final backFinder = find.byKey(const Key('onboardingBack'));
    expect(tester.widget<IconButton>(backFinder).onPressed, isNull);

    await goToIdealAge(tester);

    expect(tester.widget<IconButton>(backFinder).onPressed, isNotNull);
  });

  testWidgets('Goes back to the birth date step', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();
    await goToIdealAge(tester);

    await tester.tap(find.byKey(const Key('onboardingBack')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('When were you born?'), findsOneWidget);
  });

  testWidgets('Saves the stepped ideal lifespan', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildPage());
    await tester.pump();
    await goToIdealAge(tester);

    await tester.tap(find.byKey(const Key('idealAgePreset80')));
    await tester.pump();

    expect(fakeLifespanRangeManager.state.value?.idealAge, 80);
    expect(fakeLifespanRangeManager.state.value?.birthDate, DateTime(1990));
  });

  testWidgets(
    'Finishes onboarding and logs onboarding_complete on the last step',
    (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(buildPage());
      await tester.pump();
      await goToIdealAge(tester);

      await tester.tap(find.text('Continue'));
      await tester.pump();

      expect(fakeAnalytics.onboardingCompleteCount, 1);
      expect(fakeIsInitialUser.isInitialUser, isFalse);
    },
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
