import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/models/lifespan_range.dart';
import 'package:life_battery/src/presentation/pages/lifespan_progress_screen.dart';
import 'package:life_battery/src/presentation/widgets/common_material_app.dart';
import 'package:life_battery/src/presentation/widgets/date_input_bottom_sheet.dart';

import '../../../test_helpers/extensions.dart';

void main() {
  group('First launch', () {
    testWidgets('Shows date input bottom sheet for initial user', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];

      await tester.pumpWidget(
        const TestFirstLaunchScreen(),
      );
      await tester.pumpUntilFound(find.byType(DateInputBottomSheet));

      expect(find.byType(DateInputBottomSheet), findsOneWidget);
    });
  });
}

class TestFirstLaunchScreen extends StatelessWidget {
  const TestFirstLaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: CommonMaterialApp(
        home: Scaffold(
          body: LifeProgressContent(
            lifespanRange: LifespanRange(
              birthDate: DateTime(2000),
              idealAge: 100,
            ),
            isInitialUser: true,
            hasLongPressedBattery: false,
            isPercentageMode: true,
            updateUserIsNotInitialUser: () async {},
            updateHasLongPressedBattery: () async {},
          ),
        ),
      ),
    );
  }
}
