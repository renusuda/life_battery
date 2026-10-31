// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get generalError => 'کوئی خرابی پیش آ گئی۔';

  @override
  String get birthDateLabel => 'تاریخ پیدائش';

  @override
  String get idealLifespanLabel => 'مثالی عمر';

  @override
  String idealAgePresetLabel(int age) {
    return '$age سال';
  }

  @override
  String get ageUnit => 'سال';

  @override
  String get dayUnit => ' دن';

  @override
  String get reviewAppLabel => 'ایپ کو ریٹ کریں';

  @override
  String get widgetGuideLabel => 'ویجٹ شامل کریں';

  @override
  String get widgetGuideSheetTitle => 'ہوم اسکرین پر ویجٹ شامل کریں';

  @override
  String get widgetGuideDescription =>
      'اپنی باقی زندگی ایک نظر میں دیکھیں، سیدھا ہوم اسکرین پر۔';

  @override
  String get widgetTrialNote => '🎁 آج ویجٹ مفت آزمائیں۔';

  @override
  String get widgetGuideIosStep1 =>
      'ہوم اسکرین پر کسی خالی جگہ کو ٹچ کریں اور دبائے رکھیں۔';

  @override
  String get widgetGuideIosStep2 =>
      'اسکرین کے اوپر “ترمیم” پر ٹیپ کریں، پھر “ویجیٹ شامل کریں” پر ٹیپ کریں۔';

  @override
  String get widgetGuideIosStep3 =>
      'Life Battery تلاش کریں اور ویجٹ شامل کریں۔';

  @override
  String get widgetGuideAndroidStep1 =>
      'ہوم اسکرین پر کسی خالی جگہ کو ٹچ کریں اور دبائے رکھیں۔';

  @override
  String get widgetGuideAndroidStep2 => '“ویجیٹس” پر ٹیپ کریں۔';

  @override
  String get widgetGuideAndroidStep3 =>
      'Life Battery تلاش کریں اور ویجٹ شامل کریں۔';

  @override
  String get privacyPolicyLabel => 'رازداری کی پالیسی';

  @override
  String get appearanceLabel => 'شکل';

  @override
  String get systemLabel => 'سسٹم';

  @override
  String get lightLabel => 'روشن';

  @override
  String get darkLabel => 'تاریک';

  @override
  String get deleteAllLabel => 'ڈیٹا حذف کریں';

  @override
  String get deleteTitle => 'تمام ڈیٹا حذف کریں';

  @override
  String get deleteContent =>
      'کیا آپ واقعی ڈیٹا حذف کرنا چاہتے ہیں؟\nحذف شدہ ڈیٹا بحال نہیں کیا جا سکتا۔';

  @override
  String get cancelLabel => 'منسوخ کریں';

  @override
  String get deleteLabel => 'حذف کریں';

  @override
  String get userDeletionSuccess =>
      'آپ کا ڈیٹا کامیابی سے حذف ہو گیا ہے۔\nہماری ایپ استعمال کرنے کا شکریہ۔\nامید ہے پھر کبھی ملاقات ہو گی۔😊';

  @override
  String get notificationSettingsLabel => 'اطلاعات کی ترتیبات';

  @override
  String notificationTitle(int percentage) {
    return 'آپ کی زندگی کا $percentage% باقی ہے۔';
  }

  @override
  String get notificationBody =>
      'آئیے اگلے 1% کو اپنی کہانی کا بہترین باب بنائیں!';

  @override
  String get notificationBodyZeroPercent =>
      'آپ کی کہانی دوسروں کی کہانیوں میں زندہ رہے گی۔ شکریہ۔';

  @override
  String get longPressToEditHint => 'زندگی میں ترمیم کے لیے دیر تک دبائیں';

  @override
  String get premiumLabel => 'پریمیم';

  @override
  String get premiumDescriptionContent => 'تمام فیچرز ان لاک کریں';

  @override
  String get premiumPurchasedLabel => 'خریدا جا چکا';

  @override
  String get premiumSheetTitle => 'اپنے وقت کا بھرپور فائدہ اٹھائیں';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'پریمیم میں آپ کو کیا ملتا ہے';

  @override
  String get premiumFeatureAdRemovalLabel => 'تمام اشتہارات چھپ جاتے ہیں';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'تمام اشتہارات';

  @override
  String get premiumFeatureWidgetLabel => 'ویجٹ سے ایک نظر میں دیکھیں';

  @override
  String get premiumFeatureWidgetEmphasis => 'ویجٹ';

  @override
  String get oneTimePurchaseLabel => 'ایک بار کی خریداری';

  @override
  String get monthlyPlanLabel => 'ماہانہ';

  @override
  String get recommendedPlanBadgeLabel => 'بہترین ویلیو';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/ماہ';
  }

  @override
  String get monthlySubscriptionDescription => 'کسی بھی وقت منسوخ کریں';

  @override
  String get oneTimePurchaseDescription => 'ایک بار ادائیگی، ہمیشہ استعمال';

  @override
  String get lifetimeSupportPlanLabel => 'ایک بار + سپورٹ';

  @override
  String get lifetimeSupportDescription =>
      'ایک بار کی خریداری جیسا، ساتھ ڈیولپمنٹ کی سپورٹ';

  @override
  String get purchaseButtonLabel => 'خریدیں';

  @override
  String get storeUnavailableContent => 'اسٹور فی الحال دستیاب نہیں ہے۔';

  @override
  String get purchaseSuccessContent =>
      'شکریہ! پریمیم فیچرز اب ان لاک ہو گئے ہیں۔';

  @override
  String get purchasePendingContent => 'آپ کی خریداری منظوری کی منتظر ہے۔';

  @override
  String get purchaseErrorContent =>
      'خریداری مکمل نہیں ہو سکی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get restorePurchasesLabel => 'خریداریاں بحال کریں';

  @override
  String get termsOfUseLabel => 'استعمال کی شرائط';

  @override
  String get todaysMessageHint => 'آج آپ جتنے جوان ہیں، پھر کبھی نہیں ہوں گے۔';

  @override
  String get shareLabel => 'شیئر کریں';

  @override
  String shareMessage(int percentage) {
    return 'میری زندگی کا $percentage% باقی ہے۔ آپ کا کتنا؟';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'باقی زندگی';

  @override
  String get shareErrorContent => 'فی الحال شیئر نہیں کیا جا سکتا۔';

  @override
  String get onboardingBirthDateTitle => 'آپ کب پیدا ہوئے؟';

  @override
  String get onboardingBirthDateDescription =>
      'اس سے حساب لگایا جاتا ہے کہ آپ کی کتنی زندگی باقی ہے۔';

  @override
  String get onboardingContinueLabel => 'جاری رکھیں';

  @override
  String get onboardingIdealAgeTitle => 'آپ کتنی عمر تک جینا چاہتے ہیں؟';

  @override
  String get onboardingIdealAgeDescription =>
      'اپنی خواہش کے مطابق چنیں۔ آپ اسے بعد میں بدل سکتے ہیں۔';

  @override
  String onboardingResultTitle(int percentage) {
    return 'آپ کی زندگی کا $percentage% باقی ہے';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'یعنی ابھی $days دن باقی ہیں۔';
  }
}
