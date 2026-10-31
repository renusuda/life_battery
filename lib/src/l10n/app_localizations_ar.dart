// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get generalError => 'حدث خطأ.';

  @override
  String get birthDateLabel => 'تاريخ الميلاد';

  @override
  String get idealLifespanLabel => 'العمر المثالي';

  @override
  String idealAgePresetLabel(int age) {
    return '$age سنة';
  }

  @override
  String get ageUnit => 'سنة';

  @override
  String get dayUnit => ' يوم';

  @override
  String get reviewAppLabel => 'قيّم التطبيق';

  @override
  String get widgetGuideLabel => 'إضافة الأداة';

  @override
  String get widgetGuideSheetTitle => 'أضف الأداة إلى الشاشة الرئيسية';

  @override
  String get widgetGuideDescription =>
      'اعرف كم تبقّى من عمرك بنظرة سريعة، مباشرةً على الشاشة الرئيسية.';

  @override
  String get widgetTrialNote => '🎁 جرّب الأداة مجانًا اليوم.';

  @override
  String get widgetGuideIosStep1 =>
      'المس مطولًا مساحة فارغة على الشاشة الرئيسية.';

  @override
  String get widgetGuideIosStep2 =>
      'اضغط على «تعديل» في أعلى الشاشة، ثم اضغط على «إضافة أداة».';

  @override
  String get widgetGuideIosStep3 => 'ابحث عن Life Battery وأضف الأداة.';

  @override
  String get widgetGuideAndroidStep1 =>
      'المس مطولًا مساحة فارغة على الشاشة الرئيسية.';

  @override
  String get widgetGuideAndroidStep2 => 'اضغط على «التطبيقات المصغّرة».';

  @override
  String get widgetGuideAndroidStep3 => 'ابحث عن Life Battery وأضف الأداة.';

  @override
  String get privacyPolicyLabel => 'سياسة الخصوصية';

  @override
  String get appearanceLabel => 'المظهر';

  @override
  String get systemLabel => 'النظام';

  @override
  String get lightLabel => 'فاتح';

  @override
  String get darkLabel => 'داكن';

  @override
  String get deleteAllLabel => 'حذف البيانات';

  @override
  String get deleteTitle => 'حذف جميع البيانات';

  @override
  String get deleteContent =>
      'هل تريد بالتأكيد حذف البيانات؟\nلا يمكن استعادة البيانات بعد حذفها.';

  @override
  String get cancelLabel => 'إلغاء';

  @override
  String get deleteLabel => 'حذف';

  @override
  String get userDeletionSuccess =>
      'تم حذف بياناتك بنجاح.\nشكرًا لاستخدامك تطبيقنا.\nنأمل أن نراك مجددًا يومًا ما.😊';

  @override
  String get notificationSettingsLabel => 'إعدادات الإشعارات';

  @override
  String notificationTitle(int percentage) {
    return 'تبقّى $percentage% من عمرك.';
  }

  @override
  String get notificationBody => 'لنجعل الـ1% القادمة أجمل فصول قصتك!';

  @override
  String get notificationBodyZeroPercent =>
      'قصتك تبقى حيّة في قصص الآخرين. شكرًا لك.';

  @override
  String get longPressToEditHint => 'اضغط مطولًا لتعديل عمرك';

  @override
  String get premiumLabel => 'بريميوم';

  @override
  String get premiumDescriptionContent => 'افتح جميع الميزات';

  @override
  String get premiumPurchasedLabel => 'تم الشراء';

  @override
  String get premiumSheetTitle => 'استفد من وقتك أقصى استفادة';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'ما تحصل عليه مع بريميوم';

  @override
  String get premiumFeatureAdRemovalLabel => 'إخفاء جميع الإعلانات';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'جميع الإعلانات';

  @override
  String get premiumFeatureWidgetLabel => 'تابع بنظرة سريعة عبر الأداة';

  @override
  String get premiumFeatureWidgetEmphasis => 'الأداة';

  @override
  String get oneTimePurchaseLabel => 'شراء لمرة واحدة';

  @override
  String get monthlyPlanLabel => 'شهري';

  @override
  String get recommendedPlanBadgeLabel => 'الأوفر';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/شهر';
  }

  @override
  String get monthlySubscriptionDescription => 'يمكنك الإلغاء في أي وقت';

  @override
  String get oneTimePurchaseDescription => 'ادفع مرة واحدة واستخدمه للأبد';

  @override
  String get lifetimeSupportPlanLabel => 'لمرة واحدة + دعم';

  @override
  String get lifetimeSupportDescription =>
      'مثل الشراء لمرة واحدة، مع دعم التطوير';

  @override
  String get purchaseButtonLabel => 'شراء';

  @override
  String get storeUnavailableContent => 'المتجر غير متاح حاليًا.';

  @override
  String get purchaseSuccessContent => 'شكرًا لك! تم فتح ميزات بريميوم.';

  @override
  String get purchasePendingContent => 'عملية الشراء بانتظار الموافقة.';

  @override
  String get purchaseErrorContent =>
      'تعذّر إتمام عملية الشراء. يُرجى المحاولة مرة أخرى.';

  @override
  String get restorePurchasesLabel => 'استعادة المشتريات';

  @override
  String get termsOfUseLabel => 'شروط الاستخدام';

  @override
  String get todaysMessageHint => 'أنت الآن أصغر مما ستكون عليه أبدًا.';

  @override
  String get shareLabel => 'مشاركة';

  @override
  String shareMessage(int percentage) {
    return 'تبقّى $percentage% من عمري. وأنت؟';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'العمر المتبقي';

  @override
  String get shareErrorContent => 'المشاركة غير متاحة حاليًا.';

  @override
  String get onboardingBirthDateTitle => 'متى وُلدت؟';

  @override
  String get onboardingBirthDateDescription =>
      'نستخدمه لحساب ما تبقّى من عمرك.';

  @override
  String get onboardingContinueLabel => 'متابعة';

  @override
  String get onboardingIdealAgeTitle => 'كم سنة تريد أن تعيش؟';

  @override
  String get onboardingIdealAgeDescription =>
      'اختر ما تتمناه، ويمكنك تغييره لاحقًا.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'تبقّى لك $percentage% من عمرك';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'أي أن أمامك $days يومًا.';
  }
}
