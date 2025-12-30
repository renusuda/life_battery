import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:life_battery/main.dart';
import 'package:life_battery/widgets/date_input_bottom_sheet.dart';

import 'extensions.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Birth date change', () {
    testWidgets('Changing birth date updates the displayed value', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(
        const ProviderScope(
          child: App(),
        ),
      );

      await tester.pumpUntilFound(find.byType(DateInputBottomSheet));

      final birthDateCircle = find.byKey(const Key('birthDateCircle'));
      await tester.ensureVisible(birthDateCircle);
      await tester.pump();

      // Open the date picker
      await tester.tap(birthDateCircle);
      await tester.pumpUntilFound(find.byType(CupertinoDatePicker));

      // Drag the year picker down to decrease year by 5 (2000 -> 1995)
      await tester.drag(
        find.text('2000'),
        const Offset(0, 32 * 5),
        touchSlopY: 0,
        warnIfMissed: false,
      );
      await tester.pumpUntilGone(find.text('2000'));

      // Close the date picker modal
      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pumpUntilGone(find.byType(CupertinoDatePicker));

      expect(find.text('1/1/2000'), findsNothing);
    });
  });
}
