// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get generalError => 'లోపం సంభవించింది.';

  @override
  String get birthDateLabel => 'పుట్టిన తేదీ';

  @override
  String get idealLifespanLabel => 'కోరుకునే ఆయుర్దాయం';

  @override
  String idealAgePresetLabel(int age) {
    return '$age ఏళ్లు';
  }

  @override
  String get ageUnit => 'ఏళ్లు';

  @override
  String get dayUnit => ' రోజులు';

  @override
  String get reviewAppLabel => 'ఈ యాప్‌ను రేట్ చేయండి';

  @override
  String get widgetGuideLabel => 'విడ్జెట్‌ను జోడించండి';

  @override
  String get widgetGuideSheetTitle => 'హోమ్ స్క్రీన్‌కు విడ్జెట్‌ను జోడించండి';

  @override
  String get widgetGuideDescription =>
      'మీ జీవితంలో ఇంకా ఎంత మిగిలి ఉందో హోమ్ స్క్రీన్‌పైనే ఒక్క చూపులో చూడండి.';

  @override
  String get widgetTrialNote => '🎁 ఈ రోజు విడ్జెట్‌ను ఉచితంగా ప్రయత్నించండి.';

  @override
  String get widgetGuideIosStep1 =>
      'హోమ్ స్క్రీన్‌లో ఖాళీగా ఉన్న చోట టచ్ చేసి ఉంచండి.';

  @override
  String get widgetGuideIosStep2 =>
      'ఎగువ ఎడమ మూలలో ఉన్న “ఎడిట్” ట్యాప్ చేసి, ఆపై “విడ్జెట్‌ను జోడించండి” ట్యాప్ చేయండి.';

  @override
  String get widgetGuideIosStep3 =>
      'Life Battery కోసం శోధించి, విడ్జెట్‌ను జోడించండి.';

  @override
  String get widgetGuideAndroidStep1 =>
      'హోమ్ స్క్రీన్‌లో ఖాళీగా ఉన్న చోట టచ్ చేసి ఉంచండి.';

  @override
  String get widgetGuideAndroidStep2 => '“విడ్జెట్‌లు” ట్యాప్ చేయండి.';

  @override
  String get widgetGuideAndroidStep3 =>
      'Life Battery కోసం శోధించి, విడ్జెట్‌ను జోడించండి.';

  @override
  String get privacyPolicyLabel => 'గోప్యతా విధానం';

  @override
  String get appearanceLabel => 'రూపం';

  @override
  String get systemLabel => 'సిస్టమ్';

  @override
  String get lightLabel => 'లైట్';

  @override
  String get darkLabel => 'డార్క్';

  @override
  String get deleteAllLabel => 'డేటాను డిలీట్ చేయండి';

  @override
  String get deleteTitle => 'మొత్తం డేటాను డిలీట్ చేయండి';

  @override
  String get deleteContent =>
      'మీరు నిజంగా డేటాను డిలీట్ చేయాలనుకుంటున్నారా?\nడిలీట్ చేసిన డేటాను తిరిగి పొందలేరు.';

  @override
  String get cancelLabel => 'రద్దు';

  @override
  String get deleteLabel => 'డిలీట్';

  @override
  String get userDeletionSuccess =>
      'మీ డేటా విజయవంతంగా డిలీట్ చేయబడింది.\nమా యాప్‌ను ఉపయోగించినందుకు ధన్యవాదాలు.\nమళ్లీ కలుద్దామని ఆశిస్తున్నాము.😊';

  @override
  String get notificationSettingsLabel => 'నోటిఫికేషన్ సెట్టింగ్‌లు';

  @override
  String notificationTitle(int percentage) {
    return 'మీ జీవితంలో $percentage% మిగిలి ఉంది.';
  }

  @override
  String get notificationBody =>
      'తర్వాతి 1%ను మీ జీవితంలోనే అత్యుత్తమ అధ్యాయంగా మలుచుకుందాం!';

  @override
  String get notificationBodyZeroPercent =>
      'మీ కథ ఇతరుల కథల్లో జీవిస్తూనే ఉంటుంది. ధన్యవాదాలు.';

  @override
  String get longPressToEditHint =>
      'మీ జీవితాన్ని ఎడిట్ చేయడానికి టచ్ చేసి ఉంచండి';

  @override
  String get premiumLabel => 'ప్రీమియం';

  @override
  String get premiumDescriptionContent => 'అన్ని ఫీచర్‌లను అన్‌లాక్ చేయండి';

  @override
  String get premiumPurchasedLabel => 'కొనుగోలు చేయబడింది';

  @override
  String get premiumSheetTitle => 'మీ సమయాన్ని పూర్తిగా సద్వినియోగం చేసుకోండి';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'ప్రీమియంతో మీకు లభించేవి';

  @override
  String get premiumFeatureAdRemovalLabel => 'అన్ని ప్రకటనలను దాచిపెడుతుంది';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'అన్ని ప్రకటనలను';

  @override
  String get premiumFeatureWidgetLabel => 'విడ్జెట్‌తో ఒక్క చూపులో చూడండి';

  @override
  String get premiumFeatureWidgetEmphasis => 'విడ్జెట్';

  @override
  String get oneTimePurchaseLabel => 'ఒకేసారి కొనుగోలు';

  @override
  String get monthlyPlanLabel => 'నెలవారీ';

  @override
  String get recommendedPlanBadgeLabel => 'ఉత్తమ విలువ';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/నెల';
  }

  @override
  String get monthlySubscriptionDescription => 'ఎప్పుడైనా రద్దు చేయవచ్చు';

  @override
  String get oneTimePurchaseDescription =>
      'ఒకసారి చెల్లించండి, ఎప్పటికీ ఉపయోగించండి';

  @override
  String get lifetimeSupportPlanLabel => 'ఒకేసారి + మద్దతు';

  @override
  String get lifetimeSupportDescription =>
      'ఒకేసారి కొనుగోలు లాంటిదే, అదనంగా యాప్ డెవలప్‌మెంట్‌కు మద్దతు';

  @override
  String get purchaseButtonLabel => 'కొనుగోలు చేయండి';

  @override
  String get storeUnavailableContent => 'స్టోర్ ప్రస్తుతం అందుబాటులో లేదు.';

  @override
  String get purchaseSuccessContent =>
      'ధన్యవాదాలు! ప్రీమియం ఫీచర్‌లు ఇప్పుడు అన్‌లాక్ అయ్యాయి.';

  @override
  String get purchasePendingContent => 'మీ కొనుగోలు ఆమోదం కోసం వేచి ఉంది.';

  @override
  String get purchaseErrorContent =>
      'కొనుగోలును పూర్తి చేయలేకపోయాము. దయచేసి మళ్లీ ప్రయత్నించండి.';

  @override
  String get restorePurchasesLabel => 'కొనుగోళ్లను పునరుద్ధరించండి';

  @override
  String get termsOfUseLabel => 'ఉపయోగ నిబంధనలు';

  @override
  String get todaysMessageHint =>
      'మీ మిగిలిన జీవితంలో ఈ క్షణంలోనే మీరు అత్యంత చిన్నవారు.';

  @override
  String get shareLabel => 'షేర్ చేయండి';

  @override
  String shareMessage(int percentage) {
    return 'నా జీవితంలో $percentage% మిగిలి ఉంది. మీది ఎంత?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'మిగిలిన జీవితం';

  @override
  String get shareErrorContent => 'ప్రస్తుతం షేర్ చేయడం సాధ్యం కాదు.';

  @override
  String get onboardingBirthDateTitle => 'మీరు ఎప్పుడు పుట్టారు?';

  @override
  String get onboardingBirthDateDescription =>
      'మీ జీవితంలో ఇంకా ఎంత మిగిలి ఉందో లెక్కించడానికి ఇది ఉపయోగపడుతుంది.';

  @override
  String get onboardingContinueLabel => 'కొనసాగించండి';

  @override
  String get onboardingIdealAgeTitle =>
      'మీరు ఎన్ని ఏళ్లు జీవించాలనుకుంటున్నారు?';

  @override
  String get onboardingIdealAgeDescription =>
      'మీరు కోరుకున్నది ఎంచుకోండి. తర్వాత మార్చుకోవచ్చు.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'మీ జీవితంలో $percentage% మిగిలి ఉంది';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'అంటే, ఇంకా $days రోజులు.';
  }
}
