import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/models/lifespan_range.dart';
import 'package:life_battery/screens/lifespan_progress_screen.dart';
import 'package:life_battery/widgets/common_material_app.dart';

void main() {
  group('Battery indicator', () {
    testWidgets('Initially displays percentage', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestLifeProgressContent());
      await tester.pump();

      expect(find.textContaining('%'), findsOneWidget);
    });

    testWidgets('Switches to days display when tapped', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestLifeProgressContent());
      await tester.pump();

      await tester.tap(find.byType(LifeProgressContent));
      await tester.pump();

      expect(find.textContaining(RegExp(r'\d+d')), findsOneWidget);
      expect(find.textContaining('%'), findsNothing);
    });

    testWidgets('Switches back to percentage display when tapped again', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestLifeProgressContent());
      await tester.pump();

      await tester.tap(find.byType(LifeProgressContent));
      await tester.pump();

      await tester.tap(find.byType(LifeProgressContent));
      await tester.pump();

      expect(find.textContaining('%'), findsOneWidget);
      expect(find.textContaining(RegExp(r'\d+d')), findsNothing);
    });

    testWidgets('Initially displays long press hint', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestLifeProgressContent());
      await tester.pump();

      expect(find.text('Long press to edit your life'), findsOneWidget);
    });

    testWidgets('Changes hint after long press', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestLifeProgressContent());
      await tester.pump();

      await tester.longPress(find.byType(LifeProgressContent));
      await tester.pump();

      expect(
        find.text("This moment is the youngest you'll ever be."),
        findsOneWidget,
      );
    });
  });
}

class TestLifeProgressContent extends StatefulWidget {
  const TestLifeProgressContent({super.key});

  @override
  State<TestLifeProgressContent> createState() =>
      _TestLifeProgressContentState();
}

class _TestLifeProgressContentState extends State<TestLifeProgressContent> {
  var _hasLongPressedBattery = false;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: CommonMaterialApp(
        home: Scaffold(
          body: LifeProgressContent(
            lifespanRange: LifespanRange(
              birthDate: DateTime(1990),
              idealAge: 90,
            ),
            isInitialUser: false,
            hasLongPressedBattery: _hasLongPressedBattery,
            updateUserIsNotInitialUser: () async {},
            updateHasLongPressedBattery: () async {
              setState(() {
                _hasLongPressedBattery = true;
              });
            },
          ),
        ),
      ),
    );
  }
}
