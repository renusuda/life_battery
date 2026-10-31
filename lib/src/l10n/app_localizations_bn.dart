// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get generalError => 'একটি সমস্যা হয়েছে।';

  @override
  String get birthDateLabel => 'জন্মতারিখ';

  @override
  String get idealLifespanLabel => 'আদর্শ আয়ু';

  @override
  String idealAgePresetLabel(int age) {
    return '$age বছর';
  }

  @override
  String get ageUnit => 'বছর';

  @override
  String get dayUnit => ' দিন';

  @override
  String get reviewAppLabel => 'এই অ্যাপটি রেট করুন';

  @override
  String get widgetGuideLabel => 'উইজেট যোগ করুন';

  @override
  String get widgetGuideSheetTitle => 'হোম স্ক্রিনে উইজেট যোগ করুন';

  @override
  String get widgetGuideDescription =>
      'হোম স্ক্রিনেই এক নজরে দেখুন, আপনার জীবনের কতটা বাকি আছে।';

  @override
  String get widgetTrialNote => '🎁 আজ উইজেটটি বিনামূল্যে ব্যবহার করে দেখুন।';

  @override
  String get widgetGuideIosStep1 =>
      'হোম স্ক্রিনের কোনো ফাঁকা জায়গা টাচ করে ধরে রাখুন।';

  @override
  String get widgetGuideIosStep2 =>
      'উপরের বাঁ কোণে “এডিট”-এ ট্যাপ করুন, তারপর “উইজেট যোগ করুন”-এ ট্যাপ করুন।';

  @override
  String get widgetGuideIosStep3 => 'Life Battery সার্চ করে উইজেটটি যোগ করুন।';

  @override
  String get widgetGuideAndroidStep1 =>
      'হোম স্ক্রিনের কোনো ফাঁকা জায়গা টাচ করে ধরে রাখুন।';

  @override
  String get widgetGuideAndroidStep2 => '“উইজেট”-এ ট্যাপ করুন।';

  @override
  String get widgetGuideAndroidStep3 =>
      'Life Battery সার্চ করে উইজেটটি যোগ করুন।';

  @override
  String get privacyPolicyLabel => 'গোপনীয়তা নীতি';

  @override
  String get appearanceLabel => 'রূপ';

  @override
  String get systemLabel => 'সিস্টেম';

  @override
  String get lightLabel => 'লাইট';

  @override
  String get darkLabel => 'ডার্ক';

  @override
  String get deleteAllLabel => 'ডেটা ডিলিট করুন';

  @override
  String get deleteTitle => 'সব ডেটা ডিলিট করুন';

  @override
  String get deleteContent =>
      'আপনি কি নিশ্চিত যে ডেটা ডিলিট করতে চান?\nডিলিট করা ডেটা আর ফিরিয়ে আনা যাবে না।';

  @override
  String get cancelLabel => 'বাতিল করুন';

  @override
  String get deleteLabel => 'ডিলিট করুন';

  @override
  String get userDeletionSuccess =>
      'আপনার ডেটা সফলভাবে ডিলিট করা হয়েছে।\nআমাদের অ্যাপ ব্যবহার করার জন্য ধন্যবাদ।\nআশা করি আবার দেখা হবে।😊';

  @override
  String get notificationSettingsLabel => 'নোটিফিকেশন সেটিংস';

  @override
  String notificationTitle(int percentage) {
    return 'আপনার জীবনের $percentage% বাকি আছে।';
  }

  @override
  String get notificationBody =>
      'চলুন, পরের 1%-কে আপনার সেরা অধ্যায় করে তুলি!';

  @override
  String get notificationBodyZeroPercent =>
      'আপনার গল্প বেঁচে থাকবে অন্যদের গল্পের মাঝে। ধন্যবাদ।';

  @override
  String get longPressToEditHint => 'জীবন এডিট করতে দীর্ঘক্ষণ চাপুন';

  @override
  String get premiumLabel => 'প্রিমিয়াম';

  @override
  String get premiumDescriptionContent => 'সব ফিচার আনলক করুন';

  @override
  String get premiumPurchasedLabel => 'কেনা হয়েছে';

  @override
  String get premiumSheetTitle => 'আপনার সময়কে আরও মূল্যবান করে তুলুন';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'প্রিমিয়ামে যা যা পাবেন';

  @override
  String get premiumFeatureAdRemovalLabel => 'সব বিজ্ঞাপন সরিয়ে দেয়';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'সব বিজ্ঞাপন';

  @override
  String get premiumFeatureWidgetLabel => 'উইজেট দিয়ে এক নজরে দেখুন';

  @override
  String get premiumFeatureWidgetEmphasis => 'উইজেট';

  @override
  String get oneTimePurchaseLabel => 'এককালীন কেনাকাটা';

  @override
  String get monthlyPlanLabel => 'মাসিক';

  @override
  String get recommendedPlanBadgeLabel => 'সবচেয়ে সাশ্রয়ী';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/মাস';
  }

  @override
  String get monthlySubscriptionDescription => 'যেকোনো সময় বাতিল করুন';

  @override
  String get oneTimePurchaseDescription =>
      'একবার পেমেন্ট করুন, চিরকাল ব্যবহার করুন';

  @override
  String get lifetimeSupportPlanLabel => 'এককালীন + সাপোর্ট';

  @override
  String get lifetimeSupportDescription =>
      'এককালীন কেনাকাটার মতোই, সঙ্গে অ্যাপের উন্নয়নে সহায়তা';

  @override
  String get purchaseButtonLabel => 'কিনুন';

  @override
  String get storeUnavailableContent => 'স্টোরটি এখন উপলভ্য নেই।';

  @override
  String get purchaseSuccessContent =>
      'ধন্যবাদ! প্রিমিয়াম ফিচারগুলো এখন আনলক হয়েছে।';

  @override
  String get purchasePendingContent =>
      'আপনার কেনাকাটা অনুমোদনের অপেক্ষায় আছে।';

  @override
  String get purchaseErrorContent =>
      'কেনাকাটা সম্পন্ন করা যায়নি। আবার চেষ্টা করুন।';

  @override
  String get restorePurchasesLabel => 'কেনাকাটা রিস্টোর করুন';

  @override
  String get termsOfUseLabel => 'ব্যবহারের শর্তাবলি';

  @override
  String get todaysMessageHint => 'এখনকার চেয়ে কম বয়সী আপনি আর কখনো হবেন না।';

  @override
  String get shareLabel => 'শেয়ার করুন';

  @override
  String shareMessage(int percentage) {
    return 'আমার জীবনের $percentage% বাকি। আপনার কত?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'বাকি জীবন';

  @override
  String get shareErrorContent => 'এই মুহূর্তে শেয়ার করা যাচ্ছে না।';

  @override
  String get onboardingBirthDateTitle => 'আপনার জন্ম কবে?';

  @override
  String get onboardingBirthDateDescription =>
      'আপনার জীবনের কতটা বাকি আছে, তা হিসাব করতে এটি ব্যবহার করা হয়।';

  @override
  String get onboardingContinueLabel => 'চালিয়ে যান';

  @override
  String get onboardingIdealAgeTitle => 'আপনি কত বছর বাঁচতে চান?';

  @override
  String get onboardingIdealAgeDescription =>
      'আপনার আদর্শটাই বেছে নিন। পরে এটি বদলাতে পারবেন।';

  @override
  String onboardingResultTitle(int percentage) {
    return 'আপনার জীবনের $percentage% বাকি আছে';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'অর্থাৎ আরও $days দিন বাকি।';
  }
}
