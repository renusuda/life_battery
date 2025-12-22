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
      await tester.pumpAndSettle();

      expect(find.textContaining('%'), findsOneWidget);
    });

    testWidgets('Switches to days display when tapped', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestLifeProgressContent());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(LifeProgressContent));
      await tester.pumpAndSettle();

      expect(find.textContaining('d'), findsOneWidget);
      expect(find.textContaining('%'), findsNothing);
    });
  });
}

class TestLifeProgressContent extends StatelessWidget {
  const TestLifeProgressContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: CommonMaterialApp(
        home: Scaffold(
          body: LifeProgressContent(
            lifespanRange: LifespanRange(
              birthDate: DateTime(1990),
              deathDate: DateTime(2080),
            ),
            isInitialUser: false,
            updateUserIsNotInitialUser: () async {},
          ),
        ),
      ),
    );
  }
}
