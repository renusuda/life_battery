import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

/// Prefers a supported locale with the same language and script, then the
/// language-only one, then English. iOS reports Traditional Chinese as
/// zh-Hant-TW or zh-Hant-HK, but a bare zh-TW, zh-HK or zh-MO may still come
/// through without a script, so those regions imply Hant.
Locale resolveLocale(Locale? locale, Iterable<Locale> supportedLocales) {
  const defaultLocale = Locale('en');
  if (locale == null) return defaultLocale;
  final scriptCode = locale.scriptCode ?? _impliedScriptCode(locale);
  final sameLanguage = supportedLocales.where(
    (supportedLocale) => supportedLocale.languageCode == locale.languageCode,
  );
  return sameLanguage.firstWhereOrNull(
        (supportedLocale) =>
            scriptCode != null && supportedLocale.scriptCode == scriptCode,
      ) ??
      sameLanguage.firstWhereOrNull(
        (supportedLocale) => supportedLocale.scriptCode == null,
      ) ??
      defaultLocale;
}

String? _impliedScriptCode(Locale locale) {
  const traditionalChineseRegions = {'TW', 'HK', 'MO'};
  if (locale.languageCode == 'zh' &&
      traditionalChineseRegions.contains(locale.countryCode)) {
    return 'Hant';
  }
  return null;
}
