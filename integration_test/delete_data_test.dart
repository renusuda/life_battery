import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integration_test/integration_test.dart';
import 'package:life_battery/src/app.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/data_deletion/presentation/pages/user_deleted_page.dart';
import 'package:life_battery/src/features/notifications/data/notification_repository_provider.dart';
import 'package:life_battery/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/birth_date_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/label_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/notification_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/result_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/widget_step.dart';

import '../test_helpers/extensions.dart';
import '../test_helpers/fake_analytics.dart';
import '../test_helpers/fake_notifications.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Delete data', () {
    testWidgets('Deletes data and persists after restart', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            analyticsApiDataSourceProvider.overrideWithValue(
              FakeAnalyticsApiDataSource(),
            ),
            // The real system permission dialog would block the test.
            notificationRepositoryProvider.overrideWith(
              (ref) async => FakeNotificationRepository(),
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
      final labelContinue = find
          .descendant(
            of: find.byType(LabelStep),
            matching: find.text('Continue'),
          )
          .hitTestable();
      await tester.pumpUntilFound(labelContinue);

      // Label step
      await tester.tap(labelContinue);
      final widgetContinue = find
          .descendant(
            of: find.byType(WidgetStep),
            matching: find.text('Continue'),
          )
          .hitTestable();
      await tester.pumpUntilFound(widgetContinue);

      // Widget step
      await tester.tap(widgetContinue);
      final notificationContinue = find
          .descendant(
            of: find.byType(NotificationStep),
            matching: find.text('Continue'),
          )
          .hitTestable();
      await tester.pumpUntilFound(notificationContinue);

      // Notification step; the paywall step follows on iOS only
      await tester.tap(notificationContinue);
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        final paywallSkip = find.byKey(const Key('paywallSkip')).hitTestable();
        await tester.pumpUntilFound(paywallSkip);
        await tester.tap(paywallSkip);
      }
      await tester.pumpUntilGone(find.byType(OnboardingPage));

      // Go to settings page
      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Delete Data'));
      await tester.pumpAndSettle();

      // Tap 'Delete' button in dialog
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.byType(UserDeletedPage), findsOneWidget);

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
      await tester.pumpAndSettle();

      // Verify UserDeletedPage is still shown after restart
      expect(find.byType(UserDeletedPage), findsOneWidget);
    });
  });
}
