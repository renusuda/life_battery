// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get generalError => 'பிழை ஏற்பட்டது.';

  @override
  String get birthDateLabel => 'பிறந்த தேதி';

  @override
  String get idealLifespanLabel => 'விரும்பும் ஆயுட்காலம்';

  @override
  String idealAgePresetLabel(int age) {
    return '$age வயது';
  }

  @override
  String get ageUnit => 'வயது';

  @override
  String get dayUnit => ' நாட்கள்';

  @override
  String get reviewAppLabel => 'இந்தச் செயலியை மதிப்பிடுங்கள்';

  @override
  String get widgetGuideLabel => 'விட்ஜெட்டைச் சேர்';

  @override
  String get widgetGuideSheetTitle =>
      'முகப்புத் திரையில் விட்ஜெட்டைச் சேருங்கள்';

  @override
  String get widgetGuideDescription =>
      'மீதமுள்ள வாழ்நாளை முகப்புத் திரையிலேயே ஒரே பார்வையில் பாருங்கள்.';

  @override
  String get widgetTrialNote =>
      '🎁 இன்று விட்ஜெட்டை இலவசமாக முயன்று பாருங்கள்.';

  @override
  String get widgetGuideIosStep1 =>
      'முகப்புத் திரையில் காலியான இடத்தை நீண்ட நேரம் அழுத்திப் பிடியுங்கள்.';

  @override
  String get widgetGuideIosStep2 =>
      'மேல் இடது மூலையில் உள்ள “திருத்து” என்பதைத் தட்டி, பின்னர் “விட்ஜெட்டைச் சேர்” என்பதைத் தட்டுங்கள்.';

  @override
  String get widgetGuideIosStep3 =>
      'Life Battery எனத் தேடி, விட்ஜெட்டைச் சேருங்கள்.';

  @override
  String get widgetGuideAndroidStep1 =>
      'முகப்புத் திரையில் காலியான இடத்தை நீண்ட நேரம் அழுத்திப் பிடியுங்கள்.';

  @override
  String get widgetGuideAndroidStep2 => '“விட்ஜெட்கள்” என்பதைத் தட்டுங்கள்.';

  @override
  String get widgetGuideAndroidStep3 =>
      'Life Battery எனத் தேடி, விட்ஜெட்டைச் சேருங்கள்.';

  @override
  String get privacyPolicyLabel => 'தனியுரிமைக் கொள்கை';

  @override
  String get appearanceLabel => 'தோற்றம்';

  @override
  String get systemLabel => 'சிஸ்டம்';

  @override
  String get lightLabel => 'வெளிர்';

  @override
  String get darkLabel => 'அடர்';

  @override
  String get deleteAllLabel => 'தரவை நீக்கு';

  @override
  String get deleteTitle => 'எல்லாத் தரவையும் நீக்கு';

  @override
  String get deleteContent =>
      'தரவை நிச்சயமாக நீக்க வேண்டுமா?\nநீக்கிய தரவை மீட்டெடுக்க முடியாது.';

  @override
  String get cancelLabel => 'ரத்துசெய்';

  @override
  String get deleteLabel => 'நீக்கு';

  @override
  String get userDeletionSuccess =>
      'உங்கள் தரவு வெற்றிகரமாக நீக்கப்பட்டது.\nஎங்கள் செயலியைப் பயன்படுத்தியதற்கு நன்றி.\nமீண்டும் சந்திப்போம் என நம்புகிறோம்.😊';

  @override
  String get notificationSettingsLabel => 'அறிவிப்பு அமைப்புகள்';

  @override
  String notificationTitle(int percentage) {
    return 'உங்கள் வாழ்நாளில் $percentage% மீதமுள்ளது.';
  }

  @override
  String get notificationBody =>
      'அடுத்த 1%-ஐ உங்கள் வாழ்வின் சிறந்த அத்தியாயமாக்குவோம்!';

  @override
  String get notificationBodyZeroPercent =>
      'உங்கள் கதை மற்றவர்களின் கதைகளில் தொடர்ந்து வாழும். நன்றி.';

  @override
  String get longPressToEditHint =>
      'வாழ்நாளைத் திருத்த நீண்ட நேரம் அழுத்துங்கள்';

  @override
  String get premiumLabel => 'பிரீமியம்';

  @override
  String get premiumDescriptionContent =>
      'எல்லா அம்சங்களையும் அன்லாக் செய்யுங்கள்';

  @override
  String get premiumPurchasedLabel => 'வாங்கப்பட்டது';

  @override
  String get premiumSheetTitle => 'உங்கள் நேரத்தை முழுமையாகப் பயன்படுத்துங்கள்';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'பிரீமியத்தில் உங்களுக்குக் கிடைப்பவை';

  @override
  String get premiumFeatureAdRemovalLabel =>
      'எல்லா விளம்பரங்களையும் மறைக்கிறது';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'எல்லா விளம்பரங்களையும்';

  @override
  String get premiumFeatureWidgetLabel =>
      'விட்ஜெட் மூலம் ஒரே பார்வையில் பாருங்கள்';

  @override
  String get premiumFeatureWidgetEmphasis => 'விட்ஜெட்';

  @override
  String get oneTimePurchaseLabel => 'ஒருமுறை வாங்குதல்';

  @override
  String get monthlyPlanLabel => 'மாதாந்திரம்';

  @override
  String get recommendedPlanBadgeLabel => 'சிறந்த மதிப்பு';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/மாதம்';
  }

  @override
  String get monthlySubscriptionDescription =>
      'எப்போது வேண்டுமானாலும் ரத்துசெய்யலாம்';

  @override
  String get oneTimePurchaseDescription =>
      'ஒருமுறை செலுத்துங்கள், என்றும் பயன்படுத்துங்கள்';

  @override
  String get lifetimeSupportPlanLabel => 'ஒருமுறை + ஆதரவு';

  @override
  String get lifetimeSupportDescription =>
      'ஒருமுறை வாங்குதலைப் போன்றதே, கூடவே செயலியின் மேம்பாட்டுக்கும் ஆதரவு';

  @override
  String get purchaseButtonLabel => 'வாங்கு';

  @override
  String get storeUnavailableContent => 'ஸ்டோர் தற்போது கிடைக்கவில்லை.';

  @override
  String get purchaseSuccessContent =>
      'நன்றி! பிரீமியம் அம்சங்கள் இப்போது அன்லாக் செய்யப்பட்டன.';

  @override
  String get purchasePendingContent =>
      'உங்கள் வாங்குதல் ஒப்புதலுக்காகக் காத்திருக்கிறது.';

  @override
  String get purchaseErrorContent =>
      'வாங்குதலை முடிக்க முடியவில்லை. மீண்டும் முயலுங்கள்.';

  @override
  String get restorePurchasesLabel => 'வாங்கியவற்றை மீட்டெடு';

  @override
  String get termsOfUseLabel => 'பயன்பாட்டு விதிமுறைகள்';

  @override
  String get todaysMessageHint =>
      'இனி வரும் நாட்களைவிட இந்தக் கணத்தில்தான் நீங்கள் இளமையானவர்.';

  @override
  String get shareLabel => 'பகிர்';

  @override
  String shareMessage(int percentage) {
    return 'என் வாழ்நாளில் $percentage% மீதமுள்ளது. உங்களுக்கு?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'மீதமுள்ள வாழ்நாள்';

  @override
  String get shareErrorContent => 'இப்போது பகிர முடியவில்லை.';

  @override
  String get onboardingBirthDateTitle => 'நீங்கள் எப்போது பிறந்தீர்கள்?';

  @override
  String get onboardingBirthDateDescription =>
      'உங்கள் வாழ்நாளில் எவ்வளவு மீதமுள்ளது என்று கணக்கிட இது பயன்படும்.';

  @override
  String get onboardingContinueLabel => 'தொடர்க';

  @override
  String get onboardingIdealAgeTitle =>
      'எத்தனை வயது வரை வாழ விரும்புகிறீர்கள்?';

  @override
  String get onboardingIdealAgeDescription =>
      'உங்கள் விருப்பப்படி தேர்ந்தெடுங்கள். பின்னர் மாற்றலாம்.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'உங்கள் வாழ்நாளில் $percentage% மீதமுள்ளது';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'அதாவது, இன்னும் $days நாட்கள்.';
  }
}
