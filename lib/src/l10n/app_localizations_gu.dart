// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get generalError => 'કોઈ ભૂલ આવી.';

  @override
  String get birthDateLabel => 'જન્મતારીખ';

  @override
  String get idealLifespanLabel => 'આદર્શ આયુષ્ય';

  @override
  String idealAgePresetLabel(int age) {
    return '$age વર્ષ';
  }

  @override
  String get ageUnit => 'વર્ષ';

  @override
  String get dayUnit => ' દિવસ';

  @override
  String get reviewAppLabel => 'આ ઍપને રેટ કરો';

  @override
  String get widgetGuideLabel => 'વિજેટ ઉમેરો';

  @override
  String get widgetGuideSheetTitle => 'હોમ સ્ક્રીન પર વિજેટ ઉમેરો';

  @override
  String get widgetGuideDescription =>
      'હોમ સ્ક્રીન પર જ એક નજરમાં જુઓ કે તમારું કેટલું જીવન બાકી છે.';

  @override
  String get widgetTrialNote => '🎁 આજે વિજેટ મફતમાં અજમાવી જુઓ.';

  @override
  String get widgetGuideIosStep1 =>
      'હોમ સ્ક્રીન પર કોઈ ખાલી જગ્યાને ટચ અને હોલ્ડ કરો.';

  @override
  String get widgetGuideIosStep2 =>
      'ઉપર ડાબા ખૂણામાં “સંપાદિત કરો” પર ટૅપ કરો, પછી “વિજેટ ઉમેરો” પર ટૅપ કરો.';

  @override
  String get widgetGuideIosStep3 => 'Life Battery સર્ચ કરો અને વિજેટ ઉમેરો.';

  @override
  String get widgetGuideAndroidStep1 =>
      'હોમ સ્ક્રીન પર કોઈ ખાલી જગ્યાને ટચ કરીને દબાવી રાખો.';

  @override
  String get widgetGuideAndroidStep2 => '“વિજેટ” પર ટૅપ કરો.';

  @override
  String get widgetGuideAndroidStep3 =>
      'Life Battery સર્ચ કરો અને વિજેટ ઉમેરો.';

  @override
  String get privacyPolicyLabel => 'પ્રાઇવસી પૉલિસી';

  @override
  String get appearanceLabel => 'દેખાવ';

  @override
  String get systemLabel => 'સિસ્ટમ';

  @override
  String get lightLabel => 'લાઇટ';

  @override
  String get darkLabel => 'ડાર્ક';

  @override
  String get deleteAllLabel => 'ડેટા ડિલીટ કરો';

  @override
  String get deleteTitle => 'બધો ડેટા ડિલીટ કરો';

  @override
  String get deleteContent =>
      'શું તમે ખરેખર ડેટા ડિલીટ કરવા માંગો છો?\nડિલીટ કરેલો ડેટા પાછો મેળવી શકાશે નહીં.';

  @override
  String get cancelLabel => 'રદ કરો';

  @override
  String get deleteLabel => 'ડિલીટ કરો';

  @override
  String get userDeletionSuccess =>
      'તમારો ડેટા સફળતાપૂર્વક ડિલીટ થઈ ગયો છે.\nઅમારી ઍપનો ઉપયોગ કરવા બદલ આભાર.\nફરી મળીશું એવી આશા છે.😊';

  @override
  String get notificationSettingsLabel => 'સૂચના સેટિંગ્સ';

  @override
  String notificationTitle(int percentage) {
    return 'તમારા જીવનનું $percentage% બાકી છે.';
  }

  @override
  String get notificationBody =>
      'ચાલો, આગામી 1%ને તમારો શ્રેષ્ઠ અધ્યાય બનાવીએ!';

  @override
  String get notificationBodyZeroPercent =>
      'તમારી વાર્તા બીજાઓની વાર્તાઓમાં જીવંત રહેશે. આભાર.';

  @override
  String get longPressToEditHint => 'જીવન સંપાદિત કરવા માટે લાંબું દબાવો';

  @override
  String get premiumLabel => 'પ્રીમિયમ';

  @override
  String get premiumDescriptionContent => 'બધી સુવિધાઓ અનલૉક કરો';

  @override
  String get premiumPurchasedLabel => 'ખરીદેલ';

  @override
  String get premiumSheetTitle => 'તમારા સમયને વધુ કીમતી બનાવો';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'પ્રીમિયમમાં તમને શું મળે છે';

  @override
  String get premiumFeatureAdRemovalLabel => 'બધી જાહેરાતો છુપાવે છે';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'બધી જાહેરાતો';

  @override
  String get premiumFeatureWidgetLabel => 'વિજેટ વડે એક નજરમાં જુઓ';

  @override
  String get premiumFeatureWidgetEmphasis => 'વિજેટ';

  @override
  String get oneTimePurchaseLabel => 'એક વખતની ખરીદી';

  @override
  String get monthlyPlanLabel => 'માસિક';

  @override
  String get recommendedPlanBadgeLabel => 'સૌથી કિફાયતી';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/મહિનો';
  }

  @override
  String get monthlySubscriptionDescription => 'ગમે ત્યારે રદ કરો';

  @override
  String get oneTimePurchaseDescription => 'એક વાર ચૂકવો, હંમેશાં વાપરો';

  @override
  String get lifetimeSupportPlanLabel => 'એક વખતની ખરીદી + સપોર્ટ';

  @override
  String get lifetimeSupportDescription =>
      'એક વખતની ખરીદી જેવું જ, સાથે ઍપના વિકાસમાં સહયોગ';

  @override
  String get purchaseButtonLabel => 'ખરીદો';

  @override
  String get storeUnavailableContent => 'સ્ટોર હાલમાં ઉપલબ્ધ નથી.';

  @override
  String get purchaseSuccessContent =>
      'આભાર! પ્રીમિયમ સુવિધાઓ હવે અનલૉક થઈ ગઈ છે.';

  @override
  String get purchasePendingContent => 'તમારી ખરીદી મંજૂરીની રાહ જોઈ રહી છે.';

  @override
  String get purchaseErrorContent =>
      'ખરીદી પૂર્ણ થઈ શકી નહીં. ફરી પ્રયત્ન કરો.';

  @override
  String get restorePurchasesLabel => 'ખરીદીઓ રિસ્ટોર કરો';

  @override
  String get termsOfUseLabel => 'ઉપયોગની શરતો';

  @override
  String get todaysMessageHint =>
      'આ ક્ષણે તમે જેટલા યુવાન છો, એટલા ફરી ક્યારેય નહીં હો.';

  @override
  String get shareLabel => 'શેર કરો';

  @override
  String shareMessage(int percentage) {
    return 'મારા જીવનનું $percentage% બાકી છે. તમારું કેટલું?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'બાકી જીવન';

  @override
  String get shareErrorContent => 'હાલમાં શેર કરી શકાતું નથી.';

  @override
  String get onboardingBirthDateTitle => 'તમારો જન્મ ક્યારે થયો હતો?';

  @override
  String get onboardingBirthDateDescription =>
      'તમારું કેટલું જીવન બાકી છે તેની ગણતરી કરવા માટે આનો ઉપયોગ થાય છે.';

  @override
  String get onboardingContinueLabel => 'આગળ વધો';

  @override
  String get onboardingIdealAgeTitle => 'તમે કેટલાં વર્ષ જીવવા માંગો છો?';

  @override
  String get onboardingIdealAgeDescription =>
      'તમારો આદર્શ પસંદ કરો. તમે તેને પછીથી બદલી શકો છો.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'તમારા જીવનનું $percentage% બાકી છે';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'એટલે કે હજી $days દિવસ બાકી.';
  }
}
