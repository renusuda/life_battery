import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/widgets/common_material_app.dart';

void main() {
  group('System appearance mode', () {
    testWidgets('Shows light mode when system is in light mode', (
      tester,
    ) async {
      tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;

      await tester.pumpWidget(
        const CommonMaterialApp(
          home: Scaffold(body: Placeholder()),
        ),
      );
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(Placeholder));
      expect(Theme.of(context).brightness, Brightness.light);
    });

    testWidgets('Shows dark mode when system is in dark mode', (
      tester,
    ) async {
      tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;

      await tester.pumpWidget(
        const CommonMaterialApp(
          home: Scaffold(body: Placeholder()),
        ),
      );
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(Placeholder));
      expect(Theme.of(context).brightness, Brightness.dark);
    });
  });
}
