import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/l10n/app_localizations.dart';
import 'package:life_battery/screens/tutorial_screen.dart';

void main() {
  Future<void> swipeLeft(WidgetTester tester) async {
    await tester.drag(find.byType(PageView), const Offset(-500, 0));
    await tester.pumpAndSettle();
  }

  group('Tutorial screen', () {
    testWidgets('Shows first page correctly', (tester) async {
      await tester.pumpWidget(
        const EnglishTutorialScreen(),
      );

      expect(find.text('Date Input'), findsOneWidget);
    });
    testWidgets('Shows second page correctly', (tester) async {
      await tester.pumpWidget(
        const EnglishTutorialScreen(),
      );

      await swipeLeft(tester);

      expect(find.text("Visualize Your Life's Time"), findsOneWidget);
    });
    testWidgets('Shows third page correctly', (tester) async {
      await tester.pumpWidget(
        const EnglishTutorialScreen(),
      );

      // Swipe left twice
      await swipeLeft(tester);
      await swipeLeft(tester);

      expect(find.text('How to Update Date Information'), findsOneWidget);
    });
  });
}

class EnglishTutorialScreen extends StatelessWidget {
  const EnglishTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Localizations(
        delegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('en'),
        child: TutorialScreen(onDone: () {}),
      ),
    );
  }
}
