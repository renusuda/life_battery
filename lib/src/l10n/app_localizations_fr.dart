// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get generalError => 'Une erreur s’est produite.';

  @override
  String get birthDateLabel => 'Date de naissance';

  @override
  String get idealLifespanLabel => 'Durée de vie idéale';

  @override
  String idealAgePresetLabel(int age) {
    return '$age ans';
  }

  @override
  String get ageUnit => 'ans';

  @override
  String get dayUnit => ' jours';

  @override
  String get reviewAppLabel => 'Évaluer l’app';

  @override
  String get widgetGuideLabel => 'Ajouter le widget';

  @override
  String get widgetGuideSheetTitle => 'Ajouter le widget à l’écran d’accueil';

  @override
  String get widgetGuideDescription =>
      'Voyez d’un coup d’œil la part de vie qu’il vous reste, directement sur l’écran d’accueil.';

  @override
  String get widgetTrialNote =>
      '🎁 Essayez le widget gratuitement aujourd’hui.';

  @override
  String get widgetGuideIosStep1 =>
      'Touchez de manière prolongée une zone vide de l’écran d’accueil.';

  @override
  String get widgetGuideIosStep2 =>
      'Touchez Modifier dans le coin supérieur gauche, puis touchez Ajouter un widget.';

  @override
  String get widgetGuideIosStep3 =>
      'Recherchez Life Battery et ajoutez le widget.';

  @override
  String get widgetGuideAndroidStep1 =>
      'Appuyez de manière prolongée sur une zone vide de l’écran d’accueil.';

  @override
  String get widgetGuideAndroidStep2 => 'Appuyez sur Widgets.';

  @override
  String get widgetGuideAndroidStep3 =>
      'Recherchez Life Battery et ajoutez le widget.';

  @override
  String get privacyPolicyLabel => 'Politique de confidentialité';

  @override
  String get appearanceLabel => 'Apparence';

  @override
  String get systemLabel => 'Système';

  @override
  String get lightLabel => 'Clair';

  @override
  String get darkLabel => 'Sombre';

  @override
  String get deleteAllLabel => 'Supprimer les données';

  @override
  String get deleteTitle => 'Supprimer toutes les données';

  @override
  String get deleteContent =>
      'Voulez-vous vraiment supprimer les données ?\nLes données supprimées ne pourront pas être restaurées.';

  @override
  String get cancelLabel => 'Annuler';

  @override
  String get deleteLabel => 'Supprimer';

  @override
  String get userDeletionSuccess =>
      'Vos données ont bien été supprimées.\nMerci d’avoir utilisé notre app.\nAu plaisir de vous revoir un jour.😊';

  @override
  String get notificationSettingsLabel => 'Réglages des notifications';

  @override
  String notificationTitle(int percentage) {
    return 'Il vous reste $percentage % de votre vie.';
  }

  @override
  String get notificationBody =>
      'Faites du prochain 1 % le plus beau chapitre de votre vie !';

  @override
  String get notificationBodyZeroPercent =>
      'Votre histoire continue de vivre dans celle des autres. Merci.';

  @override
  String get longPressToEditHint =>
      'Appuyez longuement pour modifier votre vie';

  @override
  String get premiumLabel => 'Premium';

  @override
  String get premiumDescriptionContent =>
      'Débloquez toutes les fonctionnalités';

  @override
  String get premiumPurchasedLabel => 'Acheté';

  @override
  String get premiumSheetTitle => 'Profitez pleinement de votre temps';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'Ce que vous offre Premium';

  @override
  String get premiumFeatureAdRemovalLabel => 'Masque toutes les publicités';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'toutes les publicités';

  @override
  String get premiumFeatureWidgetLabel =>
      'Tout voir d’un coup d’œil avec le widget';

  @override
  String get premiumFeatureWidgetEmphasis => 'widget';

  @override
  String get oneTimePurchaseLabel => 'Achat unique';

  @override
  String get monthlyPlanLabel => 'Mensuel';

  @override
  String get recommendedPlanBadgeLabel => 'Recommandé';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/mois';
  }

  @override
  String get monthlySubscriptionDescription => 'Annulez à tout moment';

  @override
  String get oneTimePurchaseDescription => 'Payez une fois, utilisez à vie';

  @override
  String get lifetimeSupportPlanLabel => 'Achat unique + soutien';

  @override
  String get lifetimeSupportDescription =>
      'Comme l’achat unique, avec un soutien au développement';

  @override
  String get purchaseButtonLabel => 'Acheter';

  @override
  String get storeUnavailableContent =>
      'La boutique est actuellement indisponible.';

  @override
  String get purchaseSuccessContent =>
      'Merci ! Les fonctionnalités Premium sont désormais débloquées.';

  @override
  String get purchasePendingContent =>
      'Votre achat est en attente d’approbation.';

  @override
  String get purchaseErrorContent =>
      'L’achat n’a pas pu être finalisé. Veuillez réessayer.';

  @override
  String get restorePurchasesLabel => 'Restaurer les achats';

  @override
  String get termsOfUseLabel => 'Conditions d’utilisation';

  @override
  String get todaysMessageHint =>
      'Vous ne serez jamais aussi jeune qu’en cet instant.';

  @override
  String get shareLabel => 'Partager';

  @override
  String shareMessage(int percentage) {
    return 'Il me reste $percentage % de ma vie. Et vous ?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'Vie restante';

  @override
  String get shareErrorContent => 'Le partage est indisponible pour le moment.';

  @override
  String get onboardingBirthDateTitle => 'Quelle est votre date de naissance ?';

  @override
  String get onboardingBirthDateDescription =>
      'Elle sert à calculer la part de vie qu’il vous reste.';

  @override
  String get onboardingContinueLabel => 'Continuer';

  @override
  String get onboardingIdealAgeTitle => 'Jusqu’à quel âge voulez-vous vivre ?';

  @override
  String get onboardingIdealAgeDescription =>
      'Choisissez votre idéal. Vous pourrez le modifier plus tard.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'Il vous reste $percentage % de votre vie';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'Soit encore $days jours.';
  }
}
