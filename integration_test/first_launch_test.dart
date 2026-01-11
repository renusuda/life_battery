import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:life_battery/main.dart';
import 'package:life_battery/widgets/date_input_bottom_sheet.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('First launch', () {
    testWidgets('Shows date input with default values', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(
        const ProviderScope(
          child: App(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DateInputBottomSheet), findsOneWidget);
      expect(find.text('1/1/2000'), findsOneWidget);
      expect(find.text('1/1/2100'), findsOneWidget);
    });
  });
}
