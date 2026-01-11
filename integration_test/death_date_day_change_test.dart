import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:life_battery/main.dart';
import 'package:life_battery/widgets/battery_indicator.dart';
import 'package:life_battery/widgets/date_input_bottom_sheet.dart';
import 'package:life_battery/widgets/date_range_picker.dart';

import 'extensions.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Death date change in days display mode', () {
    testWidgets('Changing death date updates displayed days value', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(
        const ProviderScope(
          child: App(),
        ),
      );
      await tester.pumpAndSettle();

      // Close the initial DateInputBottomSheet
      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pumpUntilGone(find.byType(DateInputBottomSheet));

      // Tap the battery to switch to days display mode
      await tester.tap(find.byType(BatteryIndicator));
      await tester.pump();

      // Get the initial days value
      final daysFinder = find.textContaining('d');
      final initialDays = tester.widget<Text>(daysFinder).data ?? '';

      await tester.longPress(find.byType(BatteryIndicator));
      await tester.pumpAndSettle();

      // Find and tap the death date text to open the date picker
      final deathDateText = find.byType(DeathDateText);
      await tester.ensureVisible(deathDateText);
      await tester.pump();

      // Open the date picker
      await tester.tap(deathDateText);
      await tester.pumpAndSettle();

      // Drag the year picker up to increase year by 5 (2100 -> 2105)
      await tester.drag(
        find.text('2100'),
        const Offset(0, -32 * 5),
        touchSlopY: 0,
        warnIfMissed: false,
      );
      await tester.pumpAndSettle();

      // Close the date picker modal
      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pumpUntilGone(find.byType(CupertinoDatePicker));

      // Close the DateInputBottomSheet
      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pumpUntilGone(find.byType(DateInputBottomSheet));

      final newDays = tester.widget<Text>(daysFinder).data ?? '';
      expect(newDays, isNot(equals(initialDays)));
    }, retry: 10);
  });
}
