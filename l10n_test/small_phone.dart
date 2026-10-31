import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

import 'font_collection.dart';

/// The locale from `--dart-define=LOCALE=<tag>`. An unsupported tag would
/// silently fall back to English, so anything but a supported one throws.
Locale get targetLocale {
  const tag = String.fromEnvironment('LOCALE');
  const supportedLocales = AppLocalizations.supportedLocales;
  final locale = supportedLocales.firstWhereOrNull(
    (locale) => locale.toLanguageTag() == tag,
  );
  if (locale == null) {
    final tags = supportedLocales.map((locale) => locale.toLanguageTag());
    throw ArgumentError.value(tag, 'LOCALE', 'Expected one of $tags');
  }
  return locale;
}

/// The test font draws every glyph as a 1em square, far wider than on a
/// device. SF Pro, installed on the Mac from developer.apple.com/fonts,
/// stands in for the iOS system font. It has no Japanese, Chinese or Thai
/// glyphs and the test engine has no font fallback, so those languages need
/// their own font here.
Future<void> loadIosSystemFonts() async {
  if (targetLocale.languageCode == 'zh') return _loadPingFang('SC');
  if (targetLocale.languageCode == 'th') return _loadThonburi();
  const families = {
    'CupertinoSystemText': 'SF-Pro-Text',
    'CupertinoSystemDisplay': 'SF-Pro-Display',
  };
  for (final MapEntry(key: family, value: fileName) in families.entries) {
    final loader = FontLoader(family);
    for (final weight in ['Regular', 'Medium', 'Semibold', 'Bold']) {
      final bytes = File('/Library/Fonts/$fileName-$weight.otf').readAsBytes();
      loader.addFont(bytes.then(ByteData.sublistView));
    }
    await loader.load();
  }
}

/// PingFang stands in for SF Pro entirely, Latin text and digits included,
/// since there is no fallback between the two. It has no Bold, so bold text
/// uses Semibold.
Future<void> _loadPingFang(String region) async {
  final file = pingFangCollection;
  for (final family in ['CupertinoSystemText', 'CupertinoSystemDisplay']) {
    final loader = FontLoader(family);
    for (final weight in ['Regular', 'Medium', 'Semibold']) {
      final name = 'PingFang$region-$weight';
      loader.addFont(Future.value(fontFromCollection(file, name)));
    }
    await loader.load();
  }
}

/// iOS draws Thai with Thonburi, whose Thai glyphs and tall line height
/// decide the layout. Thonburi stands in for SF Pro too, since there is no
/// fallback between the two. It has no Medium or Semibold, so those use the
/// nearest of Regular and Bold.
Future<void> _loadThonburi() async {
  final file = File('/System/Library/Fonts/Supplemental/Thonburi.ttc');
  for (final family in ['CupertinoSystemText', 'CupertinoSystemDisplay']) {
    final loader = FontLoader(family);
    for (final name in ['Thonburi', 'Thonburi-Bold']) {
      loader.addFont(Future.value(fontFromCollection(file, name)));
    }
    await loader.load();
  }
}

/// Renders on a 375x667 iPhone SE, the smallest iPhone that runs iOS 18, so
/// long translations overflow here first.
void testScreen(String description, WidgetTesterCallback callback) {
  testWidgets(
    description,
    (tester) async {
      tester.view.physicalSize = const Size(750, 1334);
      tester.view.devicePixelRatio = 2;
      tester.view.padding = const FakeViewPadding(top: 40);
      tester.view.viewPadding = const FakeViewPadding(top: 40);
      addTearDown(tester.view.reset);
      tester.platformDispatcher.localesTestValue = [targetLocale];
      addTearDown(tester.platformDispatcher.clearLocalesTestValue);

      await callback(tester);
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );
}

/// Overflowing rows and columns already fail the test, with the widget and
/// its source location in the log. Text that does not fit its box is
/// ellipsized or clipped without any error, so that is checked here.
void expectNoLayoutIssues(WidgetTester tester) {
  final clippedTexts = <String>[];
  for (final element in find.byType(RichText).evaluate()) {
    final paragraph = element.renderObject! as RenderParagraph;
    final fits =
        !paragraph.didExceedMaxLines &&
        paragraph.textSize.width <= paragraph.size.width + 0.5 &&
        paragraph.textSize.height <= paragraph.size.height + 0.5;
    if (!fits) clippedTexts.add(paragraph.text.toPlainText());
  }
  expect(clippedTexts, isEmpty, reason: 'Ellipsized or clipped text');
}
