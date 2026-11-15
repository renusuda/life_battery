import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

void main() {
  test('Russian age unit follows the plural form of the age', () {
    final l10n = lookupAppLocalizations(const Locale('ru'));

    expect(l10n.ageUnit(81), 'год');
    expect(l10n.ageUnit(82), 'года');
    expect(l10n.ageUnit(85), 'лет');
    expect(l10n.ageUnit(111), 'лет');
    expect(l10n.ageUnit(121), 'год');
  });

  test('English and Japanese age units do not depend on the age', () {
    final en = lookupAppLocalizations(const Locale('en'));
    final ja = lookupAppLocalizations(const Locale('ja'));

    expect(en.ageUnit(81), 'years');
    expect(ja.ageUnit(81), '歳');
  });
}
