import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/features/purchases/presentation/widgets/premium_legal_links.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../test_helpers/test_app.dart';

void main() {
  late List<Uri> launchedUrls;

  Widget buildLinks() {
    return TestApp(
      home: Scaffold(
        body: PremiumLegalLinks(
          canLaunchUrl: (url) async => true,
          onLaunchUrl: (url, {LaunchMode mode = LaunchMode.platformDefault}) {
            launchedUrls.add(url);
            return Future.value(true);
          },
        ),
      ),
    );
  }

  setUp(() {
    launchedUrls = [];
  });

  testWidgets('Opens the standard Apple EULA from the terms link', (
    tester,
  ) async {
    await tester.pumpWidget(buildLinks());

    await tester.tap(find.text('Terms of Use'));
    await tester.pumpAndSettle();

    expect(launchedUrls, [
      Uri.parse(
        'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
      ),
    ]);
  });

  testWidgets('Shows the Japanese terms label on the Japanese locale', (
    tester,
  ) async {
    tester.platformDispatcher.localesTestValue = [const Locale('ja')];
    await tester.pumpWidget(buildLinks());

    expect(find.text('利用規約'), findsOneWidget);
  });

  testWidgets('Opens the English privacy policy from the privacy link', (
    tester,
  ) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildLinks());

    await tester.tap(find.text('Privacy policy'));
    await tester.pumpAndSettle();

    expect(launchedUrls, [
      Uri.parse('https://renusuda.github.io/life_battery_privacy_policy/en'),
    ]);
  });

  testWidgets('Opens the Japanese privacy policy on the Japanese locale', (
    tester,
  ) async {
    tester.platformDispatcher.localesTestValue = [const Locale('ja')];
    await tester.pumpWidget(buildLinks());

    await tester.tap(find.text('プライバシーポリシー'));
    await tester.pumpAndSettle();

    expect(launchedUrls, [
      Uri.parse('https://renusuda.github.io/life_battery_privacy_policy/ja'),
    ]);
  });
}
