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
  String get reviewAppLabel => 'Rate this app';

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
