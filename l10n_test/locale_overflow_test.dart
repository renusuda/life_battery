// Run on demand when a language is added, not with `flutter test`:
// fvm flutter test l10n_test/ --dart-define=LOCALE=vi
import 'package:flutter_test/flutter_test.dart';

import 'home_screens.dart';
import 'onboarding_screens.dart';
import 'settings_screens.dart';
import 'small_phone.dart';

void main() {
  setUpAll(loadIosSystemFonts);

  onboardingScreenTests();
  homeScreenTests();
  settingsScreenTests();
}
