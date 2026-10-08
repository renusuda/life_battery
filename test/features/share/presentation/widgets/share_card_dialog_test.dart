import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/share/data/share_repository_provider.dart';
import 'package:life_battery/src/features/share/domain/share_outcome.dart';
import 'package:life_battery/src/features/share/domain/share_store_url.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_card.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_card_dialog.dart';

import '../../../../../test_helpers/fake_share.dart';
import '../../../../../test_helpers/share_test_pump.dart';
import '../../../../../test_helpers/test_app.dart';

void main() {
  late FakeShareApiDataSource fakeShare;

  Widget buildApp() {
    return ProviderScope(
      overrides: [
        shareApiDataSourceProvider.overrideWithValue(fakeShare),
      ],
      child: const TestApp(home: _DialogOpener()),
    );
  }

  setUp(() {
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

  testWidgets('Closes the card once the share sheet is gone', (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('en')];
    await tester.pumpWidget(buildApp());
    await tester.tapAndAwaitShare(find.byType(TextButton));

    expect(find.byType(ShareCard), findsNothing);
  });
}

class _DialogOpener extends StatelessWidget {
  const _DialogOpener();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: () => ShareCardDialog.show(
          context,
          percentage: 54,
          text: '54%',
        ),
        child: const Text('open'),
      ),
    );
  }
}
