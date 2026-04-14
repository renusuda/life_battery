import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/models/lifespan_range.dart';
import 'package:life_battery/providers/lifespan_range_manager.dart';
import 'package:life_battery/screens/lifespan_progress_screen.dart';
import 'package:life_battery/widgets/battery_indicator.dart';
import 'package:life_battery/widgets/common_material_app.dart';
import 'package:life_battery/widgets/date_input_bottom_sheet.dart';

import '../../test_helpers/extensions.dart';

void main() {
  group('Battery indicator', () {
    testWidgets('Initially displays percentage', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestLifeProgressContent());
      await tester.pump();

      expect(find.textContaining('%'), findsOneWidget);
    });

    testWidgets('Switches to days display when tapped', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestLifeProgressContent());
      await tester.pump();

      await tester.tap(find.byType(LifeProgressContent));
      await tester.pump();

      expect(find.textContaining(RegExp(r'\d+d')), findsOneWidget);
      expect(find.textContaining('%'), findsNothing);
    });

    testWidgets('Switches back to percentage display when tapped again', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestLifeProgressContent());
      await tester.pump();

      await tester.tap(find.byType(LifeProgressContent));
      await tester.pump();

      await tester.tap(find.byType(LifeProgressContent));
      await tester.pump();

      expect(find.textContaining('%'), findsOneWidget);
      expect(find.textContaining(RegExp(r'\d+d')), findsNothing);
    });

    testWidgets('Initially displays long press hint', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestLifeProgressContent());
      await tester.pump();

      expect(find.text('Long press to edit your life'), findsOneWidget);
    });

    testWidgets('Changes hint after long press', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestLifeProgressContent());
      await tester.pump();

      await tester.longPress(find.byType(LifeProgressContent));
      await tester.pump();

      expect(
        find.text("This moment is the youngest you'll ever be."),
        findsOneWidget,
      );
    });
  });

  group('Ideal lifespan change in percentage mode', () {
    testWidgets('Changing ideal lifespan updates displayed percentage', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestEditableLifeProgressContent());
      await tester.pump();

      final percentFinder = find.textContaining('%');
      final initialPercent = tester.widget<Text>(percentFinder).data ?? '';

      await tester.longPress(find.byType(BatteryIndicator));
      await tester.pump();
      await tester.pumpUntilFound(
        find.byType(DateInputBottomSheet),
        timeout: const Duration(seconds: 1),
      );

      final idealAgeFinder = find.byKey(const Key('idealAgeText'));
      final initialAge = tester.widget<Text>(idealAgeFinder).data ?? '';

      final sliderFinder = find.byType(Slider);
      await tester.pumpUntilFound(
        sliderFinder.hitTestable(),
        timeout: const Duration(seconds: 1),
      );
      await tester.drag(sliderFinder, const Offset(100, 0));
      await tester.pump();

      final newAge = tester.widget<Text>(idealAgeFinder).data ?? '';
      expect(newAge, isNot(equals(initialAge)));

      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pump();
      await tester.pumpUntilGone(
        find.byType(DateInputBottomSheet),
        timeout: const Duration(seconds: 1),
      );

      final newPercent = tester.widget<Text>(percentFinder).data ?? '';
      expect(newPercent, isNot(equals(initialPercent)));
    });
  });

  group('Ideal lifespan change in days display mode', () {
    testWidgets('Changing ideal lifespan updates displayed days value', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestEditableLifeProgressContent());
      await tester.pump();

      await tester.tap(find.byType(BatteryIndicator));
      await tester.pump();

      final daysFinder = find.textContaining(RegExp(r'\d+d'));
      final initialDays = tester.widget<Text>(daysFinder).data ?? '';

      await tester.longPress(find.byType(BatteryIndicator));
      await tester.pump();
      await tester.pumpUntilFound(
        find.byType(DateInputBottomSheet),
        timeout: const Duration(seconds: 1),
      );

      final idealAgeFinder = find.byKey(const Key('idealAgeText'));
      final initialAge = tester.widget<Text>(idealAgeFinder).data ?? '';

      final sliderFinder = find.byType(Slider);
      await tester.pumpUntilFound(
        sliderFinder.hitTestable(),
        timeout: const Duration(seconds: 1),
      );
      await tester.drag(sliderFinder, const Offset(100, 0));
      await tester.pump();

      final newAge = tester.widget<Text>(idealAgeFinder).data ?? '';
      expect(newAge, isNot(equals(initialAge)));

      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pump();
      await tester.pumpUntilGone(
        find.byType(DateInputBottomSheet),
        timeout: const Duration(seconds: 1),
      );

      final newDays = tester.widget<Text>(daysFinder).data ?? '';
      expect(newDays, isNot(equals(initialDays)));
    });
  });

  group('Birth date change', () {
    testWidgets('Changing birth date updates displayed value and percentage', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestEditableLifeProgressContent());
      await tester.pump();

      final percentFinder = find.textContaining('%');
      final initialPercent = tester.widget<Text>(percentFinder).data ?? '';

      await tester.longPress(find.byType(BatteryIndicator));
      await tester.pump();
      await tester.pumpUntilFound(
        find.byType(DateInputBottomSheet),
        timeout: const Duration(seconds: 1),
      );

      expect(find.byType(DateInputBottomSheet), findsOneWidget);
      expect(find.text('1/1/2000'), findsOneWidget);

      final container = ProviderScope.containerOf(
        tester.element(find.byType(DateInputBottomSheet)),
      );
      await container
          .read(lifespanRangeManagerProvider.notifier)
          .updateLifespanRange(
            birthDate: DateTime(1995),
            idealAge: 100,
          );
      await tester.pump();

      expect(find.text('1/1/1995'), findsOneWidget);
      expect(find.text('1/1/2000'), findsNothing);

      final newPercent = tester.widget<Text>(percentFinder).data ?? '';
      expect(newPercent, isNot(equals(initialPercent)));

      await tester.tap(find.byType(ModalBarrier).last);
      await tester.pump();
      await tester.pumpUntilGone(
        find.byType(DateInputBottomSheet),
        timeout: const Duration(seconds: 1),
      );

      expect(find.byType(DateInputBottomSheet), findsNothing);

      await tester.longPress(find.byType(BatteryIndicator));
      await tester.pump();
      await tester.pumpUntilFound(
        find.byType(DateInputBottomSheet),
        timeout: const Duration(seconds: 1),
      );

      expect(find.byType(DateInputBottomSheet), findsOneWidget);

      expect(find.text('1/1/1995'), findsOneWidget);
    });
  });
}

class TestLifeProgressContent extends StatefulWidget {
  const TestLifeProgressContent({super.key});

  @override
  State<TestLifeProgressContent> createState() =>
      _TestLifeProgressContentState();
}

class _TestLifeProgressContentState extends State<TestLifeProgressContent> {
  var _hasLongPressedBattery = false;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: CommonMaterialApp(
        home: Scaffold(
          body: LifeProgressContent(
            lifespanRange: LifespanRange(
              birthDate: DateTime(1990),
              idealAge: 90,
            ),
            isInitialUser: false,
            hasLongPressedBattery: _hasLongPressedBattery,
            updateUserIsNotInitialUser: () async {},
            updateHasLongPressedBattery: () async {
              setState(() {
                _hasLongPressedBattery = true;
              });
            },
          ),
        ),
      ),
    );
  }
}

class FakeLifespanRangeManager extends LifespanRangeManager {
  static late LifespanRange Function() readValue;
  static late void Function(LifespanRange value) writeValue;

  @override
  Future<LifespanRange> build() async => readValue();

  @override
  Future<void> updateLifespanRange({
    required DateTime birthDate,
    required int idealAge,
  }) async {
    final newValue = LifespanRange(
      birthDate: birthDate,
      idealAge: idealAge,
    );
    writeValue(newValue);
    state = AsyncData(newValue);
  }
}

class TestEditableLifeProgressContent extends StatefulWidget {
  const TestEditableLifeProgressContent({super.key});

  @override
  State<TestEditableLifeProgressContent> createState() =>
      _TestEditableLifeProgressContentState();
}

class _TestEditableLifeProgressContentState
    extends State<TestEditableLifeProgressContent> {
  var _lifespanRange = LifespanRange(
    birthDate: DateTime(2000),
    idealAge: 100,
  );

  @override
  Widget build(BuildContext context) {
    FakeLifespanRangeManager.readValue = () => _lifespanRange;
    FakeLifespanRangeManager.writeValue = (value) {
      if (!mounted) return;
      setState(() {
        _lifespanRange = value;
      });
    };

    return ProviderScope(
      overrides: [
        lifespanRangeManagerProvider.overrideWith(FakeLifespanRangeManager.new),
      ],
      child: CommonMaterialApp(
        home: Scaffold(
          body: LifeProgressContent(
            lifespanRange: _lifespanRange,
            isInitialUser: false,
            hasLongPressedBattery: true,
            updateUserIsNotInitialUser: () async {},
            updateHasLongPressedBattery: () async {},
          ),
        ),
      ),
    );
  }
}
