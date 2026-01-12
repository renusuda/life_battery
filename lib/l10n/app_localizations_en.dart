// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get generalError => 'Error occurred.';

  @override
  String get birthDateLabel => 'Birth Date';

  @override
  String get idealLifespanLabel => 'Ideal Lifespan';

  @override
  String get ageUnit => 'years';

  @override
  String get dayUnit => 'd';

  @override
  String get tutorialLabel => 'App tutorial';

  @override
  String get reviewAppLabel => 'Rate this app';

  @override
  String get firstTutorialPageTitle => 'Date Input';

  @override
  String get firstTutorialPageBody =>
      'To use the app, set your birth date and your desired lifespan.';

  @override
  String get secondTutorialPageTitle => 'Visualize Your Life\'s Time';

  @override
  String get secondTutorialPageBody =>
      'Based on the information you entered, the remaining time is displayed as a percentage.\nTap the battery icon to see the remaining number of days.';

  @override
  String get thirdTutorialPageTitle => 'How to Update Date Information';

  @override
  String get thirdTutorialPageBody =>
      'Press and hold the battery icon to reopen the date input screen.';

  @override
  String get privacyPolicyLabel => 'Privacy policy';

  @override
  String get appearanceLabel => 'Appearance';

  @override
  String get systemLabel => 'System';

  @override
  String get lightLabel => 'Light';

  @override
  String get darkLabel => 'Dark';

  @override
  String get deleteAllLabel => 'Delete Data';

  @override
  String get deleteTitle => 'Delete All Data';

  @override
  String get deleteContent =>
      'Are you sure you want to delete the data?\nDeleted data cannot be restored.';

  @override
  String get cancelLabel => 'Cancel';

  @override
  String get deleteLabel => 'Delete';

  @override
  String get userDeletionSuccess =>
      'Your data has been successfully deleted.\nThank you for using our app.\nWe hope to see you again in the future.😊';
}
