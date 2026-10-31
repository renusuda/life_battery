// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get generalError => 'Er is een fout opgetreden.';

  @override
  String get birthDateLabel => 'Geboortedatum';

  @override
  String get idealLifespanLabel => 'Ideale levensduur';

  @override
  String idealAgePresetLabel(int age) {
    return '$age jaar';
  }

  @override
  String get ageUnit => 'jaar';

  @override
  String get dayUnit => ' dagen';

  @override
  String get reviewAppLabel => 'Beoordeel deze app';

  @override
  String get widgetGuideLabel => 'Voeg de widget toe';

  @override
  String get widgetGuideSheetTitle => 'Zet de widget op je beginscherm';

  @override
  String get widgetGuideDescription =>
      'Zie in één oogopslag hoeveel leven je nog hebt, direct op je beginscherm.';

  @override
  String get widgetTrialNote => '🎁 Probeer de widget vandaag gratis.';

  @override
  String get widgetGuideIosStep1 =>
      'Houd je vinger op een lege plek op het beginscherm.';

  @override
  String get widgetGuideIosStep2 =>
      'Tik linksboven op \'Wijzig\' en tik vervolgens op \'Voeg widget toe\'.';

  @override
  String get widgetGuideIosStep3 =>
      'Zoek naar Life Battery en voeg de widget toe.';

  @override
  String get widgetGuideAndroidStep1 =>
      'Houd een lege plek op het startscherm ingedrukt.';

  @override
  String get widgetGuideAndroidStep2 => 'Tik op \'Widgets\'.';

  @override
  String get widgetGuideAndroidStep3 =>
      'Zoek naar Life Battery en voeg de widget toe.';

  @override
  String get privacyPolicyLabel => 'Privacybeleid';

  @override
  String get appearanceLabel => 'Weergave';

  @override
  String get systemLabel => 'Systeem';

  @override
  String get lightLabel => 'Licht';

  @override
  String get darkLabel => 'Donker';

  @override
  String get deleteAllLabel => 'Verwijder gegevens';

  @override
  String get deleteTitle => 'Verwijder alle gegevens';

  @override
  String get deleteContent =>
      'Weet je zeker dat je de gegevens wilt verwijderen?\nVerwijderde gegevens kunnen niet worden hersteld.';

  @override
  String get cancelLabel => 'Annuleer';

  @override
  String get deleteLabel => 'Verwijder';

  @override
  String get userDeletionSuccess =>
      'Je gegevens zijn verwijderd.\nBedankt dat je onze app hebt gebruikt.\nHopelijk zien we je ooit weer.😊';

  @override
  String get notificationSettingsLabel => 'Meldingsinstellingen';

  @override
  String notificationTitle(int percentage) {
    return 'Je hebt nog $percentage% van je leven over.';
  }

  @override
  String get notificationBody =>
      'Maak van de volgende 1% je mooiste hoofdstuk tot nu toe!';

  @override
  String get notificationBodyZeroPercent =>
      'Je verhaal leeft voort in de verhalen van anderen. Bedankt.';

  @override
  String get longPressToEditHint => 'Houd ingedrukt om je leven te wijzigen';

  @override
  String get premiumLabel => 'Premium';

  @override
  String get premiumDescriptionContent => 'Ontgrendel alle functies';

  @override
  String get premiumPurchasedLabel => 'Gekocht';

  @override
  String get premiumSheetTitle => 'Haal het meeste uit je tijd';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'Dit krijg je met Premium';

  @override
  String get premiumFeatureAdRemovalLabel => 'Verbergt alle advertenties';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'alle advertenties';

  @override
  String get premiumFeatureWidgetLabel =>
      'Alles in één oogopslag met de widget';

  @override
  String get premiumFeatureWidgetEmphasis => 'widget';

  @override
  String get oneTimePurchaseLabel => 'Eenmalige aankoop';

  @override
  String get monthlyPlanLabel => 'Maandelijks';

  @override
  String get recommendedPlanBadgeLabel => 'Beste keuze';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/mnd';
  }

  @override
  String get monthlySubscriptionDescription => 'Altijd opzegbaar';

  @override
  String get oneTimePurchaseDescription =>
      'Eén keer betalen, voor altijd gebruiken';

  @override
  String get lifetimeSupportPlanLabel => 'Eenmalig + steun';

  @override
  String get lifetimeSupportDescription =>
      'Hetzelfde als eenmalig, en je steunt de ontwikkeling';

  @override
  String get purchaseButtonLabel => 'Koop';

  @override
  String get storeUnavailableContent =>
      'De winkel is momenteel niet beschikbaar.';

  @override
  String get purchaseSuccessContent =>
      'Bedankt! De Premium-functies zijn nu ontgrendeld.';

  @override
  String get purchasePendingContent => 'Je aankoop wacht op goedkeuring.';

  @override
  String get purchaseErrorContent =>
      'De aankoop kan niet worden voltooid. Probeer het opnieuw.';

  @override
  String get restorePurchasesLabel => 'Herstel aankopen';

  @override
  String get termsOfUseLabel => 'Gebruiksvoorwaarden';

  @override
  String get todaysMessageHint => 'Jonger dan nu word je nooit meer.';

  @override
  String get shareLabel => 'Deel';

  @override
  String shareMessage(int percentage) {
    return 'Ik heb nog $percentage% van mijn leven over. En jij?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'Resterend leven';

  @override
  String get shareErrorContent => 'Delen is op dit moment niet mogelijk.';

  @override
  String get onboardingBirthDateTitle => 'Wanneer ben je geboren?';

  @override
  String get onboardingBirthDateDescription =>
      'Hiermee berekenen we hoeveel van je leven er nog over is.';

  @override
  String get onboardingContinueLabel => 'Ga door';

  @override
  String get onboardingIdealAgeTitle => 'Hoe oud wil je worden?';

  @override
  String get onboardingIdealAgeDescription =>
      'Kies je ideaal. Je kunt het later nog wijzigen.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'Je hebt nog $percentage% van je leven over';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'Dat zijn nog $days dagen.';
  }
}
