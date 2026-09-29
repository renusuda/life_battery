import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_progress_state_provider.dart';
import 'package:life_battery/src/features/share/data/share_repository_provider.dart';
import 'package:life_battery/src/features/share/domain/share_store_url.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_icon_button.dart';

import '../../../../../test_helpers/fake_share.dart';
import '../../../../../test_helpers/test_app.dart';

void main() {
  late FakeShareApiDataSource fakeShare;

  LifespanProgressState buildState({bool isInitialUser = false}) {
    return (
      isInitialUser: isInitialUser,
      lifespanRange: LifespanRange(
        birthDate: DateTime.now().subtract(const Duration(days: 365 * 30)),
        idealAge: 80,
      ),
      hasLongPressedBattery: true,
      isPercentageMode: true,
    );
  }

  Widget buildButton(LifespanProgressState state) {
    return ProviderScope(
      overrides: [
        shareApiDataSourceProvider.overrideWithValue(fakeShare),
        lifespanProgressStateProvider.overrideWith((ref) async => state),
      ],
      child: const TestApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: AppBarHost(),
          ),
        ),
      ),
    );
  }

  setUp(() {
    fakeShare = FakeShareApiDataSource();
  });

  testWidgets('Hides the button for an initial user', (tester) async {
    await tester.pumpWidget(buildButton(buildState(isInitialUser: true)));
    await tester.pumpAndSettle();

    expect(find.byType(IconButton), findsNothing);
  });

  testWidgets(
    'Shares the English message with the App Store URL',
    (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('en')];
      await tester.pumpWidget(buildButton(buildState()));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(fakeShare.sharedTexts, hasLength(1));
      expect(
        fakeShare.sharedTexts.single,
        matches(
          RegExp(
            r"^\d+% of my life left\. What's yours\?\n#LifeBattery\n"
            '${RegExp.escape(ShareStoreUrl.appStore)}\$',
          ),
        ),
      );
      expect(fakeShare.sharePositionOrigins.single, isNotNull);
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );

  testWidgets(
    'Shares the Japanese message with the Play Store URL',
    (tester) async {
      tester.platformDispatcher.localesTestValue = [const Locale('ja')];
      await tester.pumpWidget(buildButton(buildState()));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(
        fakeShare.sharedTexts.single,
        matches(
          RegExp(
            r'^人生あと\d+%だった。みんなは？\n#ライフバッテリー\n'
            '${RegExp.escape(ShareStoreUrl.playStore)}\$',
          ),
        ),
      );
    },
    variant: TargetPlatformVariant.only(TargetPlatform.android),
  );
}

class AppBarHost extends StatelessWidget {
  const AppBarHost({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(actions: const [ShareIconButton()]);
  }
}
