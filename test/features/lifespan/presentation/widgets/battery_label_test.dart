import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/battery_label_manager_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_label_field.dart';

import '../../../../../test_helpers/test_app.dart';

void main() {
  group('Battery label field', () {
    testWidgets('Prefills the default when no label is set', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestBatteryLabelField());
      await tester.pumpAndSettle();

      expect(find.text('Battery label'), findsOneWidget);
      expect(
        tester.widget<TextField>(find.byType(TextField)).controller!.text,
        'Life remaining',
      );
    });

    testWidgets('Saves the typed label', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      final fake = FakeBatteryLabelManager(null);
      await tester.pumpWidget(TestBatteryLabelField(fake: fake));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'My life');
      await tester.pumpAndSettle();

      expect(fake.state.value, 'My life');
    });

    testWidgets('Stores an empty label when cleared', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      final fake = FakeBatteryLabelManager('My life');
      await tester.pumpWidget(TestBatteryLabelField(fake: fake));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), '');
      await tester.pumpAndSettle();

      expect(fake.state.value, '');
      expect(find.text('Life remaining'), findsOneWidget);
    });
  });
}

class TestBatteryLabelField extends StatelessWidget {
  const TestBatteryLabelField({this.fake, super.key});

  final FakeBatteryLabelManager? fake;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        batteryLabelManagerProvider.overrideWith(
          () => fake ?? FakeBatteryLabelManager(null),
        ),
      ],
      child: const TestApp(
        home: Scaffold(
          body: BatteryLabelField(),
        ),
      ),
    );
  }
}

class FakeBatteryLabelManager extends BatteryLabelManager {
  FakeBatteryLabelManager(this.initialLabel);

  final String? initialLabel;

  @override
  Future<String?> build() async => initialLabel;

  @override
  Future<void> updateBatteryLabel(String label) async {
    state = AsyncData(label);
  }
}
