import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/settings/presentation/widgets/widget_guide_list_tile.dart';

import '../../../../../test_helpers/fake_analytics.dart';
import '../../../../../test_helpers/test_app.dart';

void main() {
  late FakeAnalyticsApiDataSource fakeAnalytics;

  Widget buildTile() {
    return ProviderScope(
      overrides: [
        analyticsApiDataSourceProvider.overrideWithValue(fakeAnalytics),
      ],
      child: const TestApp(
        home: Scaffold(body: WidgetGuideListTile()),
      ),
    );
  }

  setUp(() {
    fakeAnalytics = FakeAnalyticsApiDataSource();
  });

  testWidgets(
    'Shows the guide steps in the sheet',
    (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(buildTile());
      await tester.pump();

      await tester.tap(find.byType(WidgetGuideListTile));
      await tester.pumpAndSettle();

      expect(find.text('Add the widget to your Home Screen'), findsOneWidget);
      expect(
        find.text('Tap Edit in the top-left corner, then tap Add Widget.'),
        findsOneWidget,
      );
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );

  testWidgets(
    'Shows the Android guide steps in the sheet',
    (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(buildTile());
      await tester.pump();

      await tester.tap(find.byType(WidgetGuideListTile));
      await tester.pumpAndSettle();

      expect(find.text('Add the widget to your Home Screen'), findsOneWidget);
      expect(find.text('Tap Widgets.'), findsOneWidget);
    },
    variant: TargetPlatformVariant.only(TargetPlatform.android),
  );

  testWidgets('Logs widget_guide_view when tapped', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildTile());
    await tester.pump();

    await tester.tap(find.byType(WidgetGuideListTile));
    await tester.pump();

    expect(fakeAnalytics.widgetGuideViewCount, 1);
  });

  testWidgets('Closes the sheet by tapping outside', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildTile());
    await tester.pump();

    await tester.tap(find.byType(WidgetGuideListTile));
    await tester.pumpAndSettle();

    await tester.tapAt(const Offset(20, 20));
    await tester.pumpAndSettle();

    expect(find.text('Add the widget to your Home Screen'), findsNothing);
  });
}
