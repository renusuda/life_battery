import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/widget_guide_video.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

void main() {
  Future<String?> pumpAndReadAsset(WidgetTester tester, Locale locale) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(body: WidgetGuideVideo()),
      ),
    );
    final view = tester.widget<UiKitView>(find.byType(UiKitView));
    final params = view.creationParams as Map<String, String>;
    return params['asset'];
  }

  testWidgets(
    'Plays the Japanese video in Japanese',
    (tester) async {
      final asset = await pumpAndReadAsset(tester, const Locale('ja'));

      expect(asset, 'assets/videos/widget_guide_ja.mp4');
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );

  testWidgets(
    'Plays the Traditional Chinese video in Traditional Chinese',
    (tester) async {
      final asset = await pumpAndReadAsset(
        tester,
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      );

      expect(asset, 'assets/videos/widget_guide_zh_Hant.mp4');
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );

  testWidgets(
    'Plays the English video in Simplified Chinese',
    (tester) async {
      final asset = await pumpAndReadAsset(tester, const Locale('zh'));

      expect(asset, 'assets/videos/widget_guide_en.mp4');
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );

  testWidgets(
    'Plays the English video in other languages',
    (tester) async {
      final asset = await pumpAndReadAsset(tester, const Locale('fr'));

      expect(asset, 'assets/videos/widget_guide_en.mp4');
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );
}
