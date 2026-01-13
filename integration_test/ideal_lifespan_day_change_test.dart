import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:life_battery/main.dart';
import 'package:life_battery/widgets/battery_indicator.dart';
import 'package:life_battery/widgets/date_input_bottom_sheet.dart';

import 'extensions.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Ideal lifespan change in days display mode', () {
    testWidgets('Changing ideal lifespan updates displayed days value', (
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

      // Get the initial ideal age value
      final idealAgeFinder = find.byKey(const Key('idealAgeText'));
      final initialAge = tester.widget<Text>(idealAgeFinder).data ?? '';

      // Drag the slider to change the ideal lifespan
      final sliderFinder = find.byType(Slider);
      await tester.drag(sliderFinder, const Offset(100, 0));
      await tester.pumpAndSettle();

      // Verify the ideal age changed
      final newAge = tester.widget<Text>(idealAgeFinder).data ?? '';
      expect(newAge, isNot(equals(initialAge)));

      // Close the DateInputBottomSheet
      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pumpUntilGone(find.byType(DateInputBottomSheet));

      // Verify the days value changed
      final newDays = tester.widget<Text>(daysFinder).data ?? '';
      expect(newDays, isNot(equals(initialDays)));
    });
  });
}
