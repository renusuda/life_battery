import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:life_battery/main.dart';
import 'package:life_battery/screens/lifespan_progress_screen.dart';
import 'package:life_battery/widgets/date_input_bottom_sheet.dart';

import 'extensions.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Restart', () {
    testWidgets(
      'Shows battery screen instead of date input after restart',
      (tester) async {
        tester.platformDispatcher.localesTestValue = [const Locale('en')];
        await tester.pumpWidget(
          const ProviderScope(
            child: App(),
          ),
        );
        await tester.pumpAndSettle();

        // Close the date input bottom sheet
        await tester.tap(find.byType(ModalBarrier).last);
        await tester.pumpUntilGone(find.byType(DateInputBottomSheet));

        expect(find.byType(LifeProgressContent), findsOneWidget);

        // Restart app
        await tester.pumpWidget(
          const ProviderScope(
            child: App(),
          ),
        );
        await tester.pumpAndSettle();

        // Verify battery screen shows first (not DateInputBottomSheet)
        expect(find.byType(LifeProgressContent), findsOneWidget);
        expect(find.byType(DateInputBottomSheet), findsNothing);
      },
    );
  });
}
