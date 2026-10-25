import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integration_test/integration_test.dart';
import 'package:life_battery/src/app.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/lifespan_progress_page.dart';
import 'package:life_battery/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/birth_date_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/result_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/widget_step.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/premium_bottom_sheet.dart';

import '../test_helpers/extensions.dart';
import '../test_helpers/fake_analytics.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Restart', () {
    testWidgets('Shows battery page instead of onboarding after restart', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            analyticsApiDataSourceProvider.overrideWithValue(
              FakeAnalyticsApiDataSource(),
            ),
          ],
          child: const App(),
        ),
      );
      await tester.pumpUntilFound(find.byType(OnboardingPage));

      // Ideal lifespan step
      await tester.tap(find.text('Continue'));
      final birthDateContinue = find
          .descendant(
            of: find.byType(BirthDateStep),
            matching: find.text('Continue'),
          )
          .hitTestable();
      await tester.pumpUntilFound(birthDateContinue);

      // Birth date step
      await tester.tap(birthDateContinue);
      final resultContinue = find
          .descendant(
            of: find.byType(ResultStep),
            matching: find.text('Continue'),
          )
          .hitTestable();
      await tester.pumpUntilFound(resultContinue);

      // Result step
      await tester.tap(resultContinue);
      final widgetContinue = find
          .descendant(
            of: find.byType(WidgetStep),
            matching: find.text('Continue'),
          )
          .hitTestable();
      await tester.pumpUntilFound(widgetContinue);

      // Widget step; the premium sheet is only offered on iOS
      await tester.tap(widgetContinue);
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        await tester.pumpUntilFound(find.byType(PremiumBottomSheet));
        Navigator.of(tester.element(find.byType(PremiumBottomSheet))).pop();
      }
      await tester.pumpUntilGone(find.byType(OnboardingPage));

      expect(find.byType(LifeProgressContent), findsOneWidget);

      // Restart app
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            analyticsApiDataSourceProvider.overrideWithValue(
              FakeAnalyticsApiDataSource(),
            ),
          ],
          child: const App(),
        ),
      );
      await tester.pumpUntilFound(find.byType(LifeProgressContent));

      expect(find.byType(LifeProgressContent), findsOneWidget);
      expect(find.byType(OnboardingPage), findsNothing);
    });
  });
}
