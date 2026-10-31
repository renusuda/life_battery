import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/utils/locale_resolution.dart';

void main() {
  const traditionalChinese = Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hant',
  );
  const supportedLocales = [
    Locale('en'),
    Locale('ja'),
    Locale('zh'),
    traditionalChinese,
  ];

  Locale resolve(Locale? locale) => resolveLocale(locale, supportedLocales);

  group('resolveLocale', () {
    test('Matches the language when there is no script', () {
      expect(resolve(const Locale('ja', 'JP')), const Locale('ja'));
    });

    test('Falls back to English for an unsupported language', () {
      expect(resolve(const Locale('de', 'DE')), const Locale('en'));
    });

    test('Falls back to English when there is no locale', () {
      expect(resolve(null), const Locale('en'));
    });

    test('Matches Traditional Chinese on language and script', () {
      for (final countryCode in ['TW', 'HK']) {
        final locale = Locale.fromSubtags(
          languageCode: 'zh',
          scriptCode: 'Hant',
          countryCode: countryCode,
        );
        expect(resolve(locale), traditionalChinese);
      }
    });

    test('Maps Taiwan, Hong Kong and Macau without a script to Hant', () {
      for (final countryCode in ['TW', 'HK', 'MO']) {
        expect(resolve(Locale('zh', countryCode)), traditionalChinese);
      }
    });

    test('Falls back to the language for Simplified Chinese', () {
      const simplifiedChinese = Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hans',
        countryCode: 'CN',
      );
      expect(resolve(simplifiedChinese), const Locale('zh'));
      expect(resolve(const Locale('zh', 'CN')), const Locale('zh'));
      expect(resolve(const Locale('zh')), const Locale('zh'));
    });
  });
}
