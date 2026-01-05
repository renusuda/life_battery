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

  group('Birth date change', () {
    testWidgets('Changing birth date updates displayed value and percentage', (
      tester,
    ) async {
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

      final birthDateText = find.byType(BirthDateText);
      await tester.ensureVisible(birthDateText);
      await tester.pump();

      // Open the date picker
      await tester.tap(birthDateText);
      await tester.pumpUntilFound(find.byType(CupertinoDatePicker));

      // Drag the year picker down to decrease year by 5 (2000 -> 1995)
      await tester.drag(
        find.text('2000'),
        const Offset(0, 32 * 5),
        touchSlopY: 0,
        warnIfMissed: false,
      );
      await tester.pumpUntilFound(find.text('1995'));

      // Close the date picker modal
      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pumpUntilGone(find.byType(CupertinoDatePicker));

      // Verify the displayed date changed
      expect(find.text('1/1/1995'), findsOneWidget);
      expect(find.text('1/1/2000'), findsNothing);

      // Verify the percentage value changed
      final newPercent = tester.widget<Text>(percentFinder).data ?? '';
      expect(newPercent, isNot(equals(initialPercent)));

      // Close the DateInputBottomSheet
      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pumpUntilGone(find.byType(DateInputBottomSheet));

      await tester.longPress(find.byType(BatteryIndicator));
      await tester.pumpUntilFound(find.byType(DateInputBottomSheet));

      expect(find.text('1/1/1995'), findsOneWidget);
    }, retry: 10);
  });
}
