import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integration_test/integration_test.dart';
import 'package:life_battery/src/app.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/lifespan_progress_page.dart';
import 'package:life_battery/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/ideal_age_step.dart';

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

      // Birth date step
      await tester.tap(find.text('Continue'));
      final idealAgeContinue = find
          .descendant(
            of: find.byType(IdealAgeStep),
            matching: find.text('Continue'),
          )
          .hitTestable();
      await tester.pumpUntilFound(idealAgeContinue);

      // Ideal lifespan step
      await tester.tap(idealAgeContinue);
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
