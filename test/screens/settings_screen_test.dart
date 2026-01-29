import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/screens/settings_screen.dart';
import 'package:life_battery/widgets/common_material_app.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  group('Privacy policy', () {
    testWidgets('Displays privacy policy label', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestSettingsScreen());

      expect(find.text('Privacy policy'), findsOneWidget);
    });

    testWidgets('Opens in-app browser URL when tapped', (
      tester,
    ) async {
      Uri? launchedUrl;
      LaunchMode? launchMode;

      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(
        ProviderScope(
          child: CommonMaterialApp(
            home: Scaffold(
              body: PrivacyPolicyListTile(
                canLaunchUrl: (_) async => true,
                onLaunchUrl: (url, {mode = LaunchMode.platformDefault}) async {
                  launchedUrl = url;
                  launchMode = mode;
                  return true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(PrivacyPolicyListTile));
      await tester.pumpAndSettle();

      expect(
        launchedUrl.toString(),
        'https://renusuda.github.io/life_battery_privacy_policy/en',
      );
      expect(launchMode, LaunchMode.inAppBrowserView);
    });
  });

  group('Delete data', () {
    testWidgets('Displays delete all label', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestSettingsScreen());

      expect(find.text('Delete Data'), findsOneWidget);
    });

    testWidgets('Shows confirmation dialog when tapped', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestSettingsScreen());

      await tester.tap(find.text('Delete Data'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('Dismisses dialog when cancel is tapped', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(const TestSettingsScreen());

      await tester.tap(find.text('Delete Data'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });
  });

  group('Localization tests', () {
    testWidgets('Device locale is English when set to English', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(
        const TestSettingsScreen(),
      );
      expect(find.text('Rate this app'), findsOneWidget);
    });
    testWidgets('Device locale is Chinese when set to English', (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('zh')];
      await tester.pumpWidget(
        const TestSettingsScreen(),
      );
      expect(find.text('Rate this app'), findsOneWidget);
    });
    testWidgets('Device locale is Japanese when set to Japanese', (
      tester,
    ) async {
      tester.platformDispatcher.localesTestValue = [const Locale('ja')];
      await tester.pumpWidget(
        const TestSettingsScreen(),
      );
      expect(find.text('アプリをレビューする'), findsOneWidget);
    });
  });
}

class TestSettingsScreen extends StatelessWidget {
  const TestSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: CommonMaterialApp(
        home: SettingsScreen(),
      ),
    );
  }
}
