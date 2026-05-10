import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/lifespan_progress_page.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/date_input_bottom_sheet.dart';

import '../../../../../test_helpers/extensions.dart';
import '../../../../../test_helpers/test_app.dart';

void main() {
  group('First launch', () {
    testWidgets('Shows date input bottom sheet for initial user', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];

      await tester.pumpWidget(
        const TestFirstLaunchPage(),
      );
      await tester.pumpUntilFound(find.byType(DateInputBottomSheet));

      expect(find.byType(DateInputBottomSheet), findsOneWidget);
    });
  });
}

class TestFirstLaunchPage extends StatelessWidget {
  const TestFirstLaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: TestApp(
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
