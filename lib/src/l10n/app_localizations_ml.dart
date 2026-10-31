// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get generalError => 'ഒരു പിശക് സംഭവിച്ചു.';

  @override
  String get birthDateLabel => 'ജനനത്തീയതി';

  @override
  String get idealLifespanLabel => 'ആഗ്രഹിക്കുന്ന ആയുസ്സ്';

  @override
  String idealAgePresetLabel(int age) {
    return '$age വയസ്സ്';
  }

  @override
  String get ageUnit => 'വയസ്സ്';

  @override
  String get dayUnit => ' ദിവസം';

  @override
  String get reviewAppLabel => 'ഈ ആപ്പ് റേറ്റ് ചെയ്യൂ';

  @override
  String get widgetGuideLabel => 'വിജറ്റ് ചേർക്കൂ';

  @override
  String get widgetGuideSheetTitle => 'ഹോം സ്ക്രീനിൽ വിജറ്റ് ചേർക്കൂ';

  @override
  String get widgetGuideDescription =>
      'ശേഷിക്കുന്ന ജീവിതം എത്രയെന്ന് ഹോം സ്ക്രീനിൽത്തന്നെ ഒറ്റനോട്ടത്തിൽ കാണൂ.';

  @override
  String get widgetTrialNote => '🎁 ഇന്ന് വിജറ്റ് സൗജന്യമായി പരീക്ഷിക്കൂ.';

  @override
  String get widgetGuideIosStep1 =>
      'ഹോം സ്ക്രീനിലെ ഒഴിഞ്ഞ ഭാഗത്ത് ദീർഘമായി അമർത്തൂ.';

  @override
  String get widgetGuideIosStep2 =>
      'മുകളിൽ ഇടത് കോണിലുള്ള “എഡിറ്റ്” ടാപ്പ് ചെയ്യൂ, തുടർന്ന് “വിജറ്റ് ചേർക്കൂ” ടാപ്പ് ചെയ്യൂ.';

  @override
  String get widgetGuideIosStep3 =>
      'Life Battery എന്ന് തിരഞ്ഞ് വിജറ്റ് ചേർക്കൂ.';

  @override
  String get widgetGuideAndroidStep1 =>
      'ഹോം സ്ക്രീനിലെ ഒഴിഞ്ഞ ഭാഗത്ത് ദീർഘമായി അമർത്തൂ.';

  @override
  String get widgetGuideAndroidStep2 => '“വിജറ്റുകൾ” ടാപ്പ് ചെയ്യൂ.';

  @override
  String get widgetGuideAndroidStep3 =>
      'Life Battery എന്ന് തിരഞ്ഞ് വിജറ്റ് ചേർക്കൂ.';

  @override
  String get privacyPolicyLabel => 'സ്വകാര്യതാ നയം';

  @override
  String get appearanceLabel => 'ദൃശ്യരീതി';

  @override
  String get systemLabel => 'സിസ്റ്റം';

  @override
  String get lightLabel => 'ലൈറ്റ്';

  @override
  String get darkLabel => 'ഡാർക്ക്';

  @override
  String get deleteAllLabel => 'ഡാറ്റ ഡിലീറ്റ് ചെയ്യൂ';

  @override
  String get deleteTitle => 'എല്ലാ ഡാറ്റയും ഡിലീറ്റ് ചെയ്യൂ';

  @override
  String get deleteContent =>
      'ഡാറ്റ ഡിലീറ്റ് ചെയ്യണമെന്ന് ഉറപ്പാണോ?\nഡിലീറ്റ് ചെയ്ത ഡാറ്റ വീണ്ടെടുക്കാനാവില്ല.';

  @override
  String get cancelLabel => 'റദ്ദാക്കൂ';

  @override
  String get deleteLabel => 'ഡിലീറ്റ്';

  @override
  String get userDeletionSuccess =>
      'നിങ്ങളുടെ ഡാറ്റ വിജയകരമായി ഡിലീറ്റ് ചെയ്തു.\nഞങ്ങളുടെ ആപ്പ് ഉപയോഗിച്ചതിന് നന്ദി.\nഇനിയും കാണാമെന്ന് പ്രതീക്ഷിക്കുന്നു.😊';

  @override
  String get notificationSettingsLabel => 'അറിയിപ്പ് ക്രമീകരണങ്ങൾ';

  @override
  String notificationTitle(int percentage) {
    return 'നിങ്ങളുടെ ജീവിതത്തിന്റെ $percentage% ശേഷിക്കുന്നു.';
  }

  @override
  String get notificationBody =>
      'അടുത്ത 1% നിങ്ങളുടെ ഏറ്റവും മികച്ച അധ്യായമാക്കാം!';

  @override
  String get notificationBodyZeroPercent =>
      'നിങ്ങളുടെ കഥ മറ്റുള്ളവരുടെ കഥകളിലൂടെ ജീവിക്കുന്നു. നന്ദി.';

  @override
  String get longPressToEditHint => 'ജീവിതം എഡിറ്റ് ചെയ്യാൻ ദീർഘമായി അമർത്തൂ';

  @override
  String get premiumLabel => 'പ്രീമിയം';

  @override
  String get premiumDescriptionContent => 'എല്ലാ ഫീച്ചറുകളും അൺലോക്ക് ചെയ്യൂ';

  @override
  String get premiumPurchasedLabel => 'വാങ്ങിയത്';

  @override
  String get premiumSheetTitle => 'നിങ്ങളുടെ സമയം പരമാവധി പ്രയോജനപ്പെടുത്തൂ';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'പ്രീമിയത്തിൽ നിങ്ങൾക്ക് ലഭിക്കുന്നത്';

  @override
  String get premiumFeatureAdRemovalLabel => 'എല്ലാ പരസ്യങ്ങളും മറയ്ക്കുന്നു';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'എല്ലാ പരസ്യങ്ങളും';

  @override
  String get premiumFeatureWidgetLabel => 'വിജറ്റ് വഴി ഒറ്റനോട്ടത്തിൽ കാണൂ';

  @override
  String get premiumFeatureWidgetEmphasis => 'വിജറ്റ്';

  @override
  String get oneTimePurchaseLabel => 'ഒറ്റത്തവണ വാങ്ങൽ';

  @override
  String get monthlyPlanLabel => 'പ്രതിമാസം';

  @override
  String get recommendedPlanBadgeLabel => 'മികച്ച മൂല്യം';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/മാസം';
  }

  @override
  String get monthlySubscriptionDescription => 'എപ്പോൾ വേണമെങ്കിലും റദ്ദാക്കാം';

  @override
  String get oneTimePurchaseDescription =>
      'ഒരിക്കൽ പണമടയ്ക്കൂ, എന്നും ഉപയോഗിക്കൂ';

  @override
  String get lifetimeSupportPlanLabel => 'ഒറ്റത്തവണ + പിന്തുണ';

  @override
  String get lifetimeSupportDescription =>
      'ഒറ്റത്തവണ വാങ്ങലിന് തുല്യം, ഒപ്പം ആപ്പ് വികസനത്തിന് പിന്തുണയും';

  @override
  String get purchaseButtonLabel => 'വാങ്ങൂ';

  @override
  String get storeUnavailableContent => 'സ്റ്റോർ ഇപ്പോൾ ലഭ്യമല്ല.';

  @override
  String get purchaseSuccessContent =>
      'നന്ദി! പ്രീമിയം ഫീച്ചറുകൾ ഇപ്പോൾ അൺലോക്ക് ചെയ്തു.';

  @override
  String get purchasePendingContent =>
      'നിങ്ങളുടെ വാങ്ങൽ അംഗീകാരത്തിനായി കാത്തിരിക്കുന്നു.';

  @override
  String get purchaseErrorContent =>
      'വാങ്ങൽ പൂർത്തിയാക്കാനായില്ല. ദയവായി വീണ്ടും ശ്രമിക്കൂ.';

  @override
  String get restorePurchasesLabel => 'വാങ്ങലുകൾ പുനഃസ്ഥാപിക്കൂ';

  @override
  String get termsOfUseLabel => 'ഉപയോഗ നിബന്ധനകൾ';

  @override
  String get todaysMessageHint =>
      'ഇനിയൊരിക്കലും നിങ്ങൾ ഈ നിമിഷത്തേക്കാൾ ചെറുപ്പമാകില്ല.';

  @override
  String get shareLabel => 'പങ്കിടൂ';

  @override
  String shareMessage(int percentage) {
    return 'എന്റെ ജീവിതത്തിന്റെ $percentage% ശേഷിക്കുന്നു. നിങ്ങളുടേതോ?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'ശേഷിക്കുന്ന ജീവിതം';

  @override
  String get shareErrorContent => 'ഇപ്പോൾ പങ്കിടാനാകില്ല.';

  @override
  String get onboardingBirthDateTitle => 'നിങ്ങൾ എപ്പോഴാണ് ജനിച്ചത്?';

  @override
  String get onboardingBirthDateDescription =>
      'നിങ്ങളുടെ ജീവിതം എത്ര ശേഷിക്കുന്നുവെന്ന് കണക്കാക്കാൻ ഇത് ഉപയോഗിക്കുന്നു.';

  @override
  String get onboardingContinueLabel => 'തുടരൂ';

  @override
  String get onboardingIdealAgeTitle =>
      'എത്ര കാലം ജീവിക്കാനാണ് നിങ്ങളുടെ ആഗ്രഹം?';

  @override
  String get onboardingIdealAgeDescription =>
      'നിങ്ങളുടെ ആഗ്രഹം പോലെ തിരഞ്ഞെടുക്കൂ. പിന്നീട് മാറ്റാം.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'നിങ്ങളുടെ ജീവിതത്തിന്റെ $percentage% ശേഷിക്കുന്നു';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'അതായത് ഇനിയും $days ദിവസം.';
  }
}
