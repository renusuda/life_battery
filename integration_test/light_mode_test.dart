import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:life_battery/main.dart';
import 'package:life_battery/screens/settings_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Light mode', () {
    testWidgets('Shows light mode when light mode is selected', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;

      await tester.pumpWidget(
        const ProviderScope(
          child: App(),
        ),
      );
      await tester.pumpAndSettle();

      // Close the date input bottom sheet
      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pumpAndSettle();

      // Go to settings screen
      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Appearance'));
      await tester.pumpAndSettle();

      // Select Light mode
      await tester.tap(find.text('Light'));
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(SettingsScreen));

      expect(Theme.of(context).brightness, Brightness.light);
    });
  });
}
