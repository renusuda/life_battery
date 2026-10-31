// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get generalError => 'ਕੋਈ ਗੜਬੜ ਹੋ ਗਈ।';

  @override
  String get birthDateLabel => 'ਜਨਮ ਮਿਤੀ';

  @override
  String get idealLifespanLabel => 'ਆਦਰਸ਼ ਉਮਰ';

  @override
  String idealAgePresetLabel(int age) {
    return '$age ਸਾਲ';
  }

  @override
  String get ageUnit => 'ਸਾਲ';

  @override
  String get dayUnit => ' ਦਿਨ';

  @override
  String get reviewAppLabel => 'ਇਸ ਐਪ ਨੂੰ ਰੇਟ ਕਰੋ';

  @override
  String get widgetGuideLabel => 'ਵਿਜੇਟ ਜੋੜੋ';

  @override
  String get widgetGuideSheetTitle => 'ਆਪਣੀ ਹੋਮ ਸਕਰੀਨ ’ਤੇ ਵਿਜੇਟ ਜੋੜੋ';

  @override
  String get widgetGuideDescription =>
      'ਆਪਣੀ ਹੋਮ ਸਕਰੀਨ ’ਤੇ ਹੀ ਇੱਕ ਨਜ਼ਰ ਵਿੱਚ ਦੇਖੋ ਕਿ ਤੁਹਾਡੀ ਕਿੰਨੀ ਜ਼ਿੰਦਗੀ ਬਾਕੀ ਹੈ।';

  @override
  String get widgetTrialNote => '🎁 ਅੱਜ ਵਿਜੇਟ ਮੁਫ਼ਤ ਵਿੱਚ ਅਜ਼ਮਾਓ।';

  @override
  String get widgetGuideIosStep1 =>
      'ਹੋਮ ਸਕਰੀਨ ’ਤੇ ਕਿਸੇ ਖਾਲੀ ਥਾਂ ਨੂੰ ਟੱਚ ਕਰ ਕੇ ਰੱਖੋ।';

  @override
  String get widgetGuideIosStep2 =>
      'ਉੱਪਰ ਖੱਬੇ ਕੋਨੇ ਵਿੱਚ “ਸੋਧ ਕਰੋ” ’ਤੇ ਟੈਪ ਕਰੋ, ਫਿਰ “ਵਿਜੇਟ ਜੋੜੋ” ’ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get widgetGuideIosStep3 => 'Life Battery ਖੋਜੋ ਅਤੇ ਵਿਜੇਟ ਜੋੜੋ।';

  @override
  String get widgetGuideAndroidStep1 =>
      'ਹੋਮ ਸਕਰੀਨ ’ਤੇ ਕਿਸੇ ਖਾਲੀ ਥਾਂ ਨੂੰ ਦਬਾ ਕੇ ਰੱਖੋ।';

  @override
  String get widgetGuideAndroidStep2 => '“ਵਿਜੇਟ” ’ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get widgetGuideAndroidStep3 => 'Life Battery ਖੋਜੋ ਅਤੇ ਵਿਜੇਟ ਜੋੜੋ।';

  @override
  String get privacyPolicyLabel => 'ਪਰਦੇਦਾਰੀ ਨੀਤੀ';

  @override
  String get appearanceLabel => 'ਦਿੱਖ';

  @override
  String get systemLabel => 'ਸਿਸਟਮ';

  @override
  String get lightLabel => 'ਲਾਈਟ';

  @override
  String get darkLabel => 'ਡਾਰਕ';

  @override
  String get deleteAllLabel => 'ਡੇਟਾ ਡਿਲੀਟ ਕਰੋ';

  @override
  String get deleteTitle => 'ਸਾਰਾ ਡੇਟਾ ਡਿਲੀਟ ਕਰੋ';

  @override
  String get deleteContent =>
      'ਕੀ ਤੁਸੀਂ ਸੱਚਮੁੱਚ ਡੇਟਾ ਡਿਲੀਟ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?\nਡਿਲੀਟ ਕੀਤਾ ਡੇਟਾ ਵਾਪਸ ਨਹੀਂ ਲਿਆਂਦਾ ਜਾ ਸਕਦਾ।';

  @override
  String get cancelLabel => 'ਰੱਦ ਕਰੋ';

  @override
  String get deleteLabel => 'ਡਿਲੀਟ ਕਰੋ';

  @override
  String get userDeletionSuccess =>
      'ਤੁਹਾਡਾ ਡੇਟਾ ਸਫਲਤਾਪੂਰਵਕ ਡਿਲੀਟ ਹੋ ਗਿਆ ਹੈ।\nਸਾਡੀ ਐਪ ਵਰਤਣ ਲਈ ਧੰਨਵਾਦ।\nਉਮੀਦ ਹੈ, ਅਸੀਂ ਫਿਰ ਮਿਲਾਂਗੇ।😊';

  @override
  String get notificationSettingsLabel => 'ਸੂਚਨਾ ਸੈਟਿੰਗਾਂ';

  @override
  String notificationTitle(int percentage) {
    return 'ਤੁਹਾਡੀ ਜ਼ਿੰਦਗੀ ਦਾ $percentage% ਬਾਕੀ ਹੈ।';
  }

  @override
  String get notificationBody =>
      'ਆਓ, ਅਗਲੇ 1% ਨੂੰ ਆਪਣਾ ਸਭ ਤੋਂ ਵਧੀਆ ਅਧਿਆਇ ਬਣਾਈਏ!';

  @override
  String get notificationBodyZeroPercent =>
      'ਤੁਹਾਡੀ ਕਹਾਣੀ ਦੂਜਿਆਂ ਦੀਆਂ ਕਹਾਣੀਆਂ ਵਿੱਚ ਹਮੇਸ਼ਾ ਜਿਉਂਦੀ ਰਹੇਗੀ। ਧੰਨਵਾਦ।';

  @override
  String get longPressToEditHint => 'ਜ਼ਿੰਦਗੀ ਸੋਧਣ ਲਈ ਦੇਰ ਤੱਕ ਦਬਾਓ';

  @override
  String get premiumLabel => 'ਪ੍ਰੀਮੀਅਮ';

  @override
  String get premiumDescriptionContent => 'ਸਾਰੇ ਫ਼ੀਚਰ ਅਨਲੌਕ ਕਰੋ';

  @override
  String get premiumPurchasedLabel => 'ਖ਼ਰੀਦਿਆ ਗਿਆ';

  @override
  String get premiumSheetTitle => 'ਆਪਣੇ ਸਮੇਂ ਨੂੰ ਹੋਰ ਵੀ ਕੀਮਤੀ ਬਣਾਓ';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'ਪ੍ਰੀਮੀਅਮ ਨਾਲ ਤੁਹਾਨੂੰ ਕੀ ਮਿਲਦਾ ਹੈ';

  @override
  String get premiumFeatureAdRemovalLabel => 'ਸਾਰੇ ਇਸ਼ਤਿਹਾਰ ਹਟ ਜਾਂਦੇ ਹਨ';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'ਸਾਰੇ ਇਸ਼ਤਿਹਾਰ';

  @override
  String get premiumFeatureWidgetLabel => 'ਵਿਜੇਟ ਨਾਲ ਇੱਕ ਨਜ਼ਰ ਵਿੱਚ ਦੇਖੋ';

  @override
  String get premiumFeatureWidgetEmphasis => 'ਵਿਜੇਟ';

  @override
  String get oneTimePurchaseLabel => 'ਇੱਕ ਵਾਰ ਦੀ ਖ਼ਰੀਦ';

  @override
  String get monthlyPlanLabel => 'ਮਹੀਨਾਵਾਰ';

  @override
  String get recommendedPlanBadgeLabel => 'ਸਭ ਤੋਂ ਫ਼ਾਇਦੇਮੰਦ';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/ਮਹੀਨਾ';
  }

  @override
  String get monthlySubscriptionDescription => 'ਕਦੇ ਵੀ ਰੱਦ ਕਰੋ';

  @override
  String get oneTimePurchaseDescription => 'ਇੱਕ ਵਾਰ ਭੁਗਤਾਨ ਕਰੋ, ਹਮੇਸ਼ਾ ਵਰਤੋ';

  @override
  String get lifetimeSupportPlanLabel => 'ਇੱਕ ਵਾਰ ਦੀ ਖ਼ਰੀਦ + ਸਹਿਯੋਗ';

  @override
  String get lifetimeSupportDescription =>
      'ਇੱਕ ਵਾਰ ਦੀ ਖ਼ਰੀਦ ਵਾਂਗ ਹੀ, ਨਾਲ ਹੀ ਐਪ ਦੇ ਵਿਕਾਸ ਵਿੱਚ ਸਹਿਯੋਗ';

  @override
  String get purchaseButtonLabel => 'ਖ਼ਰੀਦੋ';

  @override
  String get storeUnavailableContent => 'ਸਟੋਰ ਇਸ ਵੇਲੇ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get purchaseSuccessContent =>
      'ਧੰਨਵਾਦ! ਪ੍ਰੀਮੀਅਮ ਫ਼ੀਚਰ ਹੁਣ ਅਨਲੌਕ ਹੋ ਗਏ ਹਨ।';

  @override
  String get purchasePendingContent => 'ਤੁਹਾਡੀ ਖ਼ਰੀਦ ਮਨਜ਼ੂਰੀ ਲਈ ਬਕਾਇਆ ਹੈ।';

  @override
  String get purchaseErrorContent =>
      'ਖ਼ਰੀਦ ਪੂਰੀ ਨਹੀਂ ਹੋ ਸਕੀ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get restorePurchasesLabel => 'ਖ਼ਰੀਦਾਂ ਰੀਸਟੋਰ ਕਰੋ';

  @override
  String get termsOfUseLabel => 'ਵਰਤੋਂ ਦੀਆਂ ਸ਼ਰਤਾਂ';

  @override
  String get todaysMessageHint =>
      'ਇਸ ਪਲ ਤੋਂ ਵੱਧ ਜਵਾਨ ਤੁਸੀਂ ਫਿਰ ਕਦੇ ਨਹੀਂ ਹੋਵੋਗੇ।';

  @override
  String get shareLabel => 'ਸਾਂਝਾ ਕਰੋ';

  @override
  String shareMessage(int percentage) {
    return 'ਮੇਰੀ ਜ਼ਿੰਦਗੀ ਦਾ $percentage% ਬਾਕੀ ਹੈ। ਤੁਹਾਡੀ ਕਿੰਨੀ ਬਾਕੀ ਹੈ?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'ਬਾਕੀ ਜ਼ਿੰਦਗੀ';

  @override
  String get shareErrorContent => 'ਇਸ ਵੇਲੇ ਸਾਂਝਾ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';

  @override
  String get onboardingBirthDateTitle => 'ਤੁਹਾਡਾ ਜਨਮ ਕਦੋਂ ਹੋਇਆ ਸੀ?';

  @override
  String get onboardingBirthDateDescription =>
      'ਇਸ ਨਾਲ ਹਿਸਾਬ ਲਗਾਇਆ ਜਾਂਦਾ ਹੈ ਕਿ ਤੁਹਾਡੀ ਕਿੰਨੀ ਜ਼ਿੰਦਗੀ ਬਾਕੀ ਹੈ।';

  @override
  String get onboardingContinueLabel => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get onboardingIdealAgeTitle => 'ਤੁਸੀਂ ਕਿੰਨੇ ਸਾਲ ਜਿਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get onboardingIdealAgeDescription =>
      'ਆਪਣਾ ਆਦਰਸ਼ ਚੁਣੋ। ਤੁਸੀਂ ਇਸ ਨੂੰ ਬਾਅਦ ਵਿੱਚ ਬਦਲ ਸਕਦੇ ਹੋ।';

  @override
  String onboardingResultTitle(int percentage) {
    return 'ਤੁਹਾਡੀ ਜ਼ਿੰਦਗੀ ਦਾ $percentage% ਬਾਕੀ ਹੈ';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'ਯਾਨੀ ਅਜੇ $days ਦਿਨ ਬਾਕੀ ਹਨ।';
  }
}
