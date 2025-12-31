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

  group('Death date change', () {
    testWidgets('Changing death date updates displayed value', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(
        const ProviderScope(
          child: App(),
        ),
      );

      await tester.pumpUntilFound(find.byType(DateInputBottomSheet));

      // Get the initial percentage value
      final percentFinder = find.textContaining('%');
      final initialPercent = tester.widget<Text>(percentFinder).data ?? '';

      // Find and tap the death date text to open the date picker
      final deathDateText = find.byType(DeathDateText);
      await tester.ensureVisible(deathDateText);
      await tester.pump();

      // Open the date picker
      await tester.tap(deathDateText);
      await tester.pumpUntilFound(find.byType(CupertinoDatePicker));

      // Drag the year picker up to increase year by 5 (2100 -> 2105)
      await tester.drag(
        find.text('2100'),
        const Offset(0, -32 * 5),
        touchSlopY: 0,
        warnIfMissed: false,
      );
      await tester.pumpUntilFound(find.text('2105'));

      // Close the date picker modal
      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pumpUntilGone(find.byType(CupertinoDatePicker));

      // Verify the displayed date changed
      expect(find.text('1/1/2105'), findsOneWidget);
      expect(find.text('1/1/2100'), findsNothing);

      // Verify the percentage value changed
      final newPercent = tester.widget<Text>(percentFinder).data ?? '';
      expect(newPercent, isNot(equals(initialPercent)));

      // Close the DateInputBottomSheet
      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pumpUntilGone(find.byType(DateInputBottomSheet));

      await tester.longPress(find.byType(BatteryIndicator));
      await tester.pumpUntilFound(find.byType(DateInputBottomSheet));

      expect(find.text('1/1/2105'), findsOneWidget);
    }, retry: 2);
  });
}
