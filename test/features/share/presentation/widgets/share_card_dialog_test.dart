import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/share/data/share_repository_provider.dart';
import 'package:life_battery/src/features/share/domain/share_outcome.dart';
import 'package:life_battery/src/features/share/domain/share_source.dart';
import 'package:life_battery/src/features/share/domain/share_store_url.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_card.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_card_dialog.dart';

import '../../../../../test_helpers/fake_analytics.dart';
import '../../../../../test_helpers/fake_share.dart';
import '../../../../../test_helpers/share_test_pump.dart';
import '../../../../../test_helpers/test_app.dart';

void main() {
  late FakeAnalyticsApiDataSource fakeAnalytics;
  late FakeShareApiDataSource fakeShare;

  Widget buildApp({String? label}) {
    return ProviderScope(
      overrides: [
        analyticsApiDataSourceProvider.overrideWithValue(fakeAnalytics),
        shareApiDataSourceProvider.overrideWithValue(fakeShare),
      ],
      child: TestApp(home: _DialogOpener(label: label)),
    );
  }

  setUp(() {
    fakeAnalytics = FakeAnalyticsApiDataSource();
    fakeShare = FakeShareApiDataSource();
  });

  testWidgets(
    'Shares a PNG with the message and App Store URL as soon as it opens',
    (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(buildApp());
      await tester.tapAndAwaitShare(find.byType(TextButton));

      expect(fakeShare.sharedImages, hasLength(1));
      expect(fakeShare.sharedImages.single, isNotEmpty);
      const expectedText =
          "54% of my life left. What's yours?\n"
          '#LifeBattery\n'
          '${ShareStoreUrl.appStore}';
      expect(fakeShare.sharedTexts, [expectedText]);
      expect(fakeShare.sharePositionOrigins.single, isNotNull);
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );

  testWidgets(
    'Uses the Japanese message and Play Store URL',
    (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('ja')];
      await tester.pumpWidget(buildApp());
      await tester.tapAndAwaitShare(find.byType(TextButton));

      expect(
        fakeShare.sharedTexts,
        ['人生あと54%だった。みんなは？\n#ライフバッテリー\n${ShareStoreUrl.playStore}'],
      );
    },
    variant: TargetPlatformVariant.only(TargetPlatform.android),
  );

  testWidgets('Shows the Japanese app name on the card', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('ja')];
    fakeShare.outcome = ShareOutcome.dismissed;
    await tester.pumpWidget(buildApp());
    await tester.tap(find.byType(TextButton));
    await tester.pump();
    await tester.pump();

    expect(find.text('ライフバッテリー'), findsOneWidget);
  });

  testWidgets('Shows the custom battery label on the card', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    fakeShare.outcome = ShareOutcome.dismissed;
    await tester.pumpWidget(buildApp(label: 'Time left'));
    await tester.tap(find.byType(TextButton));
    await tester.pump();
    await tester.pump();

    expect(find.text('Time left'), findsOneWidget);
    expect(find.text('Life remaining'), findsNothing);
  });

  testWidgets('Falls back to the default label when hidden', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    fakeShare.outcome = ShareOutcome.dismissed;
    await tester.pumpWidget(buildApp(label: ''));
    await tester.tap(find.byType(TextButton));
    await tester.pump();
    await tester.pump();

    expect(find.text('Life remaining'), findsOneWidget);
  });

  testWidgets('Closes the card once the share sheet is gone', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildApp());
    await tester.tapAndAwaitShare(find.byType(TextButton));

    expect(find.byType(ShareCard), findsNothing);
  });

  testWidgets('Logs the share with its source and result', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildApp());
    await tester.tapAndAwaitShare(find.byType(TextButton));

    expect(fakeAnalytics.shares, [
      (source: ShareSource.home, result: ShareOutcome.success),
    ]);
  });

  testWidgets('Logs a dismissed share sheet as dismissed', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    fakeShare.outcome = ShareOutcome.dismissed;
    await tester.pumpWidget(buildApp());
    await tester.tapAndAwaitShare(find.byType(TextButton));

    expect(
      fakeAnalytics.shares.map((share) => share.result),
      [ShareOutcome.dismissed],
    );
  });
}

class _DialogOpener extends StatelessWidget {
  const _DialogOpener({this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: () => ShareCardDialog.show(
          context,
          percentage: 54,
          text: '54%',
          label: label,
          source: ShareSource.home,
        ),
        child: const Text('open'),
      ),
    );
  }
}
