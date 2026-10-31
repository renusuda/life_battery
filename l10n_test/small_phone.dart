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
/// stands in for the iOS system font. It has no Japanese, Chinese, Korean,
/// Thai, Devanagari, Bengali, Gujarati, Kannada, Malayalam, Odia, Gurmukhi,
/// Tamil or Telugu glyphs and the test engine has no font fallback, so those
/// languages need their own font here.
Future<void> loadIosSystemFonts() async {
  if (targetLocale.languageCode == 'zh') {
    return _loadPingFang(targetLocale.scriptCode == 'Hant' ? 'TC' : 'SC');
  }
  if (targetLocale.languageCode == 'th') return _loadThonburi();
  if (['hi', 'mr'].contains(targetLocale.languageCode)) {
    return _loadKohinoorDevanagari();
  }
  if (targetLocale.languageCode == 'ko') return _loadAppleSDGothicNeo();
  if (targetLocale.languageCode == 'bn') return _loadKohinoorBangla();
  if (targetLocale.languageCode == 'gu') return _loadKohinoorGujarati();
  if (targetLocale.languageCode == 'kn') return _loadNotoSansKannada();
  if (targetLocale.languageCode == 'ml') return _loadMalayalamSangamMN();
  if (targetLocale.languageCode == 'or') return _loadNotoSansOriya();
  if (targetLocale.languageCode == 'pa') return _loadMuktaMahee();
  if (targetLocale.languageCode == 'ta') return _loadTamilSangamMN();
  if (targetLocale.languageCode == 'te') return _loadKohinoorTelugu();
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

/// iOS draws Hindi and Marathi with Kohinoor Devanagari, whose Devanagari
/// glyphs and line height decide the layout. It stands in for SF Pro too,
/// Latin text and digits included, since there is no fallback between the two.
Future<void> _loadKohinoorDevanagari() async {
  final file = File('/System/Library/Fonts/Kohinoor.ttc');
  for (final family in ['CupertinoSystemText', 'CupertinoSystemDisplay']) {
    final loader = FontLoader(family);
    for (final weight in ['Regular', 'Medium', 'Semibold', 'Bold']) {
      final name = 'KohinoorDevanagari-$weight';
      loader.addFont(Future.value(fontFromCollection(file, name)));
    }
    await loader.load();
  }
}

/// iOS draws Korean with Apple SD Gothic Neo, whose Hangul glyphs and line
/// height decide the layout. It stands in for SF Pro too, Latin text and
/// digits included, since there is no fallback between the two.
Future<void> _loadAppleSDGothicNeo() async {
  final file = File('/System/Library/Fonts/AppleSDGothicNeo.ttc');
  for (final family in ['CupertinoSystemText', 'CupertinoSystemDisplay']) {
    final loader = FontLoader(family);
    for (final weight in ['Regular', 'Medium', 'SemiBold', 'Bold']) {
      final name = 'AppleSDGothicNeo-$weight';
      loader.addFont(Future.value(fontFromCollection(file, name)));
    }
    await loader.load();
  }
}

/// iOS draws Bengali with Kohinoor Bangla, whose Bengali glyphs and line
/// height decide the layout. It stands in for SF Pro too, Latin text and
/// digits included, since there is no fallback between the two.
Future<void> _loadKohinoorBangla() async {
  final file = File('/System/Library/Fonts/KohinoorBangla.ttc');
  for (final family in ['CupertinoSystemText', 'CupertinoSystemDisplay']) {
    final loader = FontLoader(family);
    for (final weight in ['Regular', 'Medium', 'Semibold', 'Bold']) {
      final name = 'KohinoorBangla-$weight';
      loader.addFont(Future.value(fontFromCollection(file, name)));
    }
    await loader.load();
  }
}

/// iOS draws Gujarati with Kohinoor Gujarati, whose Gujarati glyphs and line
/// height decide the layout. It stands in for SF Pro too, digits included.
/// It has no Latin letters, so "Life Battery" is measured with its 0.5em
/// placeholder glyph, a little wider than SF Pro.
Future<void> _loadKohinoorGujarati() async {
  final file = File('/System/Library/Fonts/KohinoorGujarati.ttc');
  for (final family in ['CupertinoSystemText', 'CupertinoSystemDisplay']) {
    final loader = FontLoader(family);
    for (final weight in ['Regular', 'Medium', 'Semibold', 'Bold']) {
      final name = 'KohinoorGujarati-$weight';
      loader.addFont(Future.value(fontFromCollection(file, name)));
    }
    await loader.load();
  }
}

/// iOS draws Kannada with Noto Sans Kannada, whose Kannada glyphs and line
/// height decide the layout. It stands in for SF Pro too, digits included.
/// It has no Latin letters, so "Life Battery" is measured with its 0.6em
/// placeholder glyph, a little wider than SF Pro. iOS ships only Light,
/// Regular and Bold, so Medium and Semibold use the nearest of the latter two.
Future<void> _loadNotoSansKannada() async {
  final file = File('/System/Library/Fonts/NotoSansKannada.ttc');
  for (final family in ['CupertinoSystemText', 'CupertinoSystemDisplay']) {
    final loader = FontLoader(family);
    for (final weight in ['Regular', 'Bold']) {
      final name = 'NotoSansKannada-$weight';
      loader.addFont(Future.value(fontFromCollection(file, name)));
    }
    await loader.load();
  }
}

/// iOS draws Malayalam with Malayalam Sangam MN, whose Malayalam glyphs and
/// line height decide the layout. It stands in for SF Pro too, Latin text
/// and digits included, since there is no fallback between the two. It has
/// no Medium or Semibold, so those use the nearest of Regular and Bold.
Future<void> _loadMalayalamSangamMN() async {
  final file = File(
    '/System/Library/Fonts/Supplemental/Malayalam Sangam MN.ttc',
  );
  for (final family in ['CupertinoSystemText', 'CupertinoSystemDisplay']) {
    final loader = FontLoader(family);
    for (final name in ['MalayalamSangamMN', 'MalayalamSangamMN-Bold']) {
      loader.addFont(Future.value(fontFromCollection(file, name)));
    }
    await loader.load();
  }
}

/// iOS draws Odia with Noto Sans Oriya, whose Odia glyphs and line height
/// decide the layout. It stands in for SF Pro too, digits included. It has
/// no Latin letters, so "Life Battery" is measured with its 0.6em
/// placeholder glyph, a little wider than SF Pro. It has only Regular and
/// Bold, so Medium and Semibold use the nearest of the two.
Future<void> _loadNotoSansOriya() async {
  final file = File('/System/Library/Fonts/NotoSansOriya.ttc');
  for (final family in ['CupertinoSystemText', 'CupertinoSystemDisplay']) {
    final loader = FontLoader(family);
    for (final name in ['NotoSansOriya', 'NotoSansOriya-Bold']) {
      loader.addFont(Future.value(fontFromCollection(file, name)));
    }
    await loader.load();
  }
}

/// iOS draws Punjabi with Mukta Mahee, whose Gurmukhi glyphs and line height
/// decide the layout. It stands in for SF Pro too, Latin text and digits
/// included, since there is no fallback between the two.
Future<void> _loadMuktaMahee() async {
  final file = File('/System/Library/Fonts/MuktaMahee.ttc');
  for (final family in ['CupertinoSystemText', 'CupertinoSystemDisplay']) {
    final loader = FontLoader(family);
    for (final weight in ['Regular', 'Medium', 'SemiBold', 'Bold']) {
      final name = 'MuktaMahee-$weight';
      loader.addFont(Future.value(fontFromCollection(file, name)));
    }
    await loader.load();
  }
}

/// iOS draws Tamil with Tamil Sangam MN, whose Tamil glyphs and line height
/// decide the layout. It stands in for SF Pro too, Latin text and digits
/// included, since there is no fallback between the two. It has no Medium or
/// Semibold, so those use the nearest of Regular and Bold.
Future<void> _loadTamilSangamMN() async {
  final file = File('/System/Library/Fonts/Supplemental/Tamil Sangam MN.ttc');
  for (final family in ['CupertinoSystemText', 'CupertinoSystemDisplay']) {
    final loader = FontLoader(family);
    for (final name in ['TamilSangamMN', 'TamilSangamMN-Bold']) {
      loader.addFont(Future.value(fontFromCollection(file, name)));
    }
    await loader.load();
  }
}

/// iOS draws Telugu with Kohinoor Telugu, whose Telugu glyphs and tall line
/// height decide the layout. It stands in for SF Pro too, Latin text and
/// digits included, since there is no fallback between the two.
Future<void> _loadKohinoorTelugu() async {
  final file = File('/System/Library/Fonts/KohinoorTelugu.ttc');
  for (final family in ['CupertinoSystemText', 'CupertinoSystemDisplay']) {
    final loader = FontLoader(family);
    for (final weight in ['Regular', 'Medium', 'Semibold', 'Bold']) {
      final name = 'KohinoorTelugu-$weight';
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
