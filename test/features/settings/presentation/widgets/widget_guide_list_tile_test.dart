import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/features/settings/presentation/widgets/widget_guide_list_tile.dart';

import '../../../../../test_helpers/test_app.dart';

void main() {
  Widget buildTile() {
    return const TestApp(
      home: Scaffold(body: WidgetGuideListTile()),
    );
  }

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
