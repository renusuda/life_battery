import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/extensions/extensions.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/lifespan_progress_page.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_indicator.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/date_input_bottom_sheet.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/date_range_picker.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_card.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

import 'fake_app.dart';
import 'small_phone.dart';

// Pumps stay under 3 seconds in total, before the page schedules the
// notification through the plugin.
void homeScreenTests() {
  final l10n = lookupAppLocalizations(targetLocale);
  final days = longLifespanRange.remainingLifeDays(now: DateTime.now());
  final daysText = '${days.withCommaString}${l10n.dayUnit}';

  // Premium hides the banner ad, which cannot load in widget tests.
  Future<void> pumpHome(
    WidgetTester tester, {
    bool isPercentageMode = true,
  }) async {
    await tester.pumpWidget(
      fakeApp(
        home: const LifespanProgressPage(),
        isPercentageMode: isPercentageMode,
        isPremium: true,
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
  }

  Future<void> openDateInputSheet(WidgetTester tester) async {
    await tester.longPress(find.byType(BatteryIndicator));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
  }

  testScreen('Home in percentage display', (tester) async {
    await pumpHome(tester);

    expect(find.text(l10n.longPressToEditHint), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Home in days display', (tester) async {
    await pumpHome(tester, isPercentageMode: false);

    expect(find.text(daysText), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Home after the long press hint change', (tester) async {
    await pumpHome(tester, isPercentageMode: false);
    await openDateInputSheet(tester);
    await tester.tapAt(const Offset(187, 10));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(DateInputBottomSheet), findsNothing);
    expect(find.text(l10n.todaysMessageHint), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Date input bottom sheet', (tester) async {
    await pumpHome(tester);
    await openDateInputSheet(tester);

    expect(find.byType(DateInputBottomSheet), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  testScreen('Birth date picker', (tester) async {
    await pumpHome(tester);
    await openDateInputSheet(tester);
    await tester.tap(find.byType(BirthDateField));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(CupertinoDatePicker), findsOneWidget);
    expectNoLayoutIssues(tester);
  });

  // The days display is longer than the percentage one.
  testScreen('Share card', (tester) async {
    await pumpHome(tester, isPercentageMode: false);
    await tester.tap(find.byIcon(Icons.ios_share));
    await tester.pump();
    await tester.pump();

    expect(find.byType(ShareCard), findsOneWidget);
    expectNoLayoutIssues(tester);
  });
}
