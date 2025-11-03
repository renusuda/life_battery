import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/screens/settings_screen.dart';
import 'package:life_battery/widgets/common_material_app.dart';

void main() {
  group('Localization tests', () {
    testWidgets('Device locale is English when set to English', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(
        const TestSettingsScreen(),
      );
      expect(find.text('App tutorial'), findsOneWidget);
    });
    testWidgets('Device locale is Japanese when set to Japanese', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('ja')];
      await tester.pumpWidget(
        const TestSettingsScreen(),
      );
      expect(find.text('アプリの使い方'), findsOneWidget);
    });
  });
}

class TestSettingsScreen extends StatelessWidget {
  const TestSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: CommonMaterialApp(
        home: SettingsScreen(),
      ),
    );
  }
}
