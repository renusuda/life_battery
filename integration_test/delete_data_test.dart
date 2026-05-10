import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integration_test/integration_test.dart';
import 'package:life_battery/src/app.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/user_deleted_page.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/date_input_bottom_sheet.dart';

import '../test_helpers/extensions.dart';

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
      await tester.pumpUntilFound(find.byType(DateInputBottomSheet));

      // Close the date input bottom sheet
      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pumpUntilGone(find.byType(DateInputBottomSheet));

      // Go to settings page
      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Delete Data'));
      await tester.pumpAndSettle();

      // Tap 'Delete' button in dialog
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.byType(UserDeletedPage), findsOneWidget);

      // Restart app
      await tester.pumpWidget(
        const ProviderScope(
          child: App(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify UserDeletedPage is still shown after restart
      expect(find.byType(UserDeletedPage), findsOneWidget);
    });
  });
}
