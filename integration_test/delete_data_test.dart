import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:life_battery/main.dart';
import 'package:life_battery/screens/user_deleted_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Delete data', () {
    testWidgets('Deletes data and persists after restart', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
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

      await tester.tap(find.text('Delete Data'));
      await tester.pumpAndSettle();

      // Tap 'Delete' button in dialog
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.byType(UserDeletedScreen), findsOneWidget);

      // Restart app
      await tester.pumpWidget(
        const ProviderScope(
          child: App(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify UserDeletedScreen is still shown after restart
      expect(find.byType(UserDeletedScreen), findsOneWidget);
    });
  });
}
