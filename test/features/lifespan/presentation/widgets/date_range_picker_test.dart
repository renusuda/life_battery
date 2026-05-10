import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/date_range_picker.dart';

import '../../../../../test_helpers/test_app.dart';

void main() {
  group('Date range picker interactions', () {
    testWidgets('Tapping birth date field shows date picker', (tester) async {
      await tester.pumpWidget(const TestDateRangePickerContent());
      await tester.pump();

      await tester.tap(find.byType(BirthDateField));
      await tester.pump();

      expect(find.byType(CupertinoDatePicker), findsOneWidget);
    });
  });
}

class TestDateRangePickerContent extends StatelessWidget {
  const TestDateRangePickerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: TestApp(
        home: Scaffold(
          body: DateRangePickerContent(
            birthDate: DateTime(1990),
            idealAge: 90,
          ),
        ),
      ),
    );
  }
}
