import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

import 'fake_app.dart';
import 'small_phone.dart';

void onboardingScreenTests() {
  final l10n = lookupAppLocalizations(targetLocale);

  setUp(() {
    // The guide video is a native view, which has no host in widget tests.
    TestWidgetsFlutterBinding.ensureInitialized().defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform_views, (_) async {
          return null;
        });
  });

  Future<void> pumpOnboarding(WidgetTester tester) async {
    await tester.pumpWidget(
      fakeApp(home: const OnboardingPage(), isInitialUser: true),
    );
    await tester.pump();
  }

  Future<void> tapContinue(WidgetTester tester) async {
    await tester.tap(find.text(l10n.onboardingContinueLabel));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
  }

  testScreen('Onboarding ideal age step', (tester) async {
    await pumpOnboarding(tester);

    expect(find.byKey(const Key('idealAgeText')), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Onboarding birth date step', (tester) async {
    await pumpOnboarding(tester);
    await tapContinue(tester);

    expect(find.byType(CupertinoDatePicker), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Onboarding result step', (tester) async {
    await pumpOnboarding(tester);
    await tapContinue(tester);
    await tapContinue(tester);
    await tester.pumpAndSettle();

    expect(find.text(l10n.shareLabel), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Onboarding widget step', (tester) async {
    await pumpOnboarding(tester);
    await tapContinue(tester);
    await tapContinue(tester);
    await tester.pumpAndSettle();
    await tapContinue(tester);

    expect(find.text(l10n.widgetGuideSheetTitle), findsOneWidget);
    expectNoLayoutIssues(tester);
  });
}
