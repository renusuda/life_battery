// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get generalError => 'เกิดข้อผิดพลาด';

  @override
  String get birthDateLabel => 'วันเกิด';

  @override
  String get idealLifespanLabel => 'อายุขัยในอุดมคติ';

  @override
  String idealAgePresetLabel(int age) {
    return '$age ปี';
  }

  @override
  String get ageUnit => 'ปี';

  @override
  String get dayUnit => ' วัน';

  @override
  String get reviewAppLabel => 'ให้คะแนนแอป';

  @override
  String get widgetGuideLabel => 'เพิ่มวิดเจ็ต';

  @override
  String get widgetGuideSheetTitle => 'เพิ่มวิดเจ็ตลงในหน้าจอโฮม';

  @override
  String get widgetGuideDescription =>
      'ดูชีวิตที่เหลืออยู่ได้ในพริบตา บนหน้าจอโฮมของคุณ';

  @override
  String get widgetTrialNote => '🎁 วันนี้ลองใช้วิดเจ็ตได้ฟรี';

  @override
  String get widgetGuideIosStep1 => 'แตะพื้นที่ว่างบนหน้าจอโฮมค้างไว้';

  @override
  String get widgetGuideIosStep2 =>
      'แตะ “แก้ไข” ที่มุมซ้ายบน แล้วแตะ “เพิ่มวิดเจ็ต”';

  @override
  String get widgetGuideIosStep3 => 'ค้นหา Life Battery แล้วเพิ่มวิดเจ็ต';

  @override
  String get widgetGuideAndroidStep1 => 'แตะพื้นที่ว่างบนหน้าจอหลักค้างไว้';

  @override
  String get widgetGuideAndroidStep2 => 'แตะ “วิดเจ็ต”';

  @override
  String get widgetGuideAndroidStep3 => 'ค้นหา Life Battery แล้วเพิ่มวิดเจ็ต';

  @override
  String get privacyPolicyLabel => 'นโยบายความเป็นส่วนตัว';

  @override
  String get appearanceLabel => 'ลักษณะที่ปรากฏ';

  @override
  String get systemLabel => 'ตามระบบ';

  @override
  String get lightLabel => 'สว่าง';

  @override
  String get darkLabel => 'มืด';

  @override
  String get deleteAllLabel => 'ลบข้อมูล';

  @override
  String get deleteTitle => 'ลบข้อมูลทั้งหมด';

  @override
  String get deleteContent =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบข้อมูล\nข้อมูลที่ลบแล้วจะไม่สามารถกู้คืนได้';

  @override
  String get cancelLabel => 'ยกเลิก';

  @override
  String get deleteLabel => 'ลบ';

  @override
  String get userDeletionSuccess =>
      'ลบข้อมูลของคุณเรียบร้อยแล้ว\nขอบคุณที่ใช้แอปของเรา\nหวังว่าจะได้พบกันอีกนะ😊';

  @override
  String get notificationSettingsLabel => 'การตั้งค่าการแจ้งเตือน';

  @override
  String notificationTitle(int percentage) {
    return 'ชีวิตของคุณเหลืออีก $percentage%';
  }

  @override
  String get notificationBody =>
      'มาทำให้ 1% ต่อจากนี้เป็นบทที่ดีที่สุดของคุณกันเถอะ!';

  @override
  String get notificationBodyZeroPercent =>
      'เรื่องราวของคุณจะยังคงมีชีวิตอยู่ในเรื่องราวของผู้อื่น ขอบคุณ';

  @override
  String get longPressToEditHint => 'กดค้างเพื่อแก้ไขชีวิตของคุณ';

  @override
  String get premiumLabel => 'พรีเมียม';

  @override
  String get premiumDescriptionContent => 'ปลดล็อกฟีเจอร์ทั้งหมด';

  @override
  String get premiumPurchasedLabel => 'ซื้อแล้ว';

  @override
  String get premiumSheetTitle => 'ใช้เวลาที่เหลือให้คุ้มค่าที่สุด';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'สิ่งที่คุณจะได้รับจากพรีเมียม';

  @override
  String get premiumFeatureAdRemovalLabel => 'ซ่อนโฆษณาทั้งหมด';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'โฆษณาทั้งหมด';

  @override
  String get premiumFeatureWidgetLabel => 'ดูได้ในพริบตาด้วยวิดเจ็ต';

  @override
  String get premiumFeatureWidgetEmphasis => 'วิดเจ็ต';

  @override
  String get oneTimePurchaseLabel => 'ซื้อครั้งเดียว';

  @override
  String get monthlyPlanLabel => 'รายเดือน';

  @override
  String get recommendedPlanBadgeLabel => 'คุ้มที่สุด';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/เดือน';
  }

  @override
  String get monthlySubscriptionDescription => 'ยกเลิกได้ทุกเมื่อ';

  @override
  String get oneTimePurchaseDescription => 'จ่ายครั้งเดียว ใช้ได้ตลอดไป';

  @override
  String get lifetimeSupportPlanLabel => 'ซื้อครั้งเดียว + สนับสนุน';

  @override
  String get lifetimeSupportDescription =>
      'เหมือนซื้อครั้งเดียว พร้อมสนับสนุนการพัฒนา';

  @override
  String get purchaseButtonLabel => 'ซื้อ';

  @override
  String get storeUnavailableContent => 'ขณะนี้ไม่สามารถใช้งานสโตร์ได้';

  @override
  String get purchaseSuccessContent => 'ขอบคุณ! ปลดล็อกฟีเจอร์พรีเมียมแล้ว';

  @override
  String get purchasePendingContent => 'การซื้อของคุณกำลังรอการอนุมัติ';

  @override
  String get purchaseErrorContent =>
      'ไม่สามารถทำการซื้อให้เสร็จสิ้นได้ โปรดลองอีกครั้ง';

  @override
  String get restorePurchasesLabel => 'กู้คืนการซื้อ';

  @override
  String get termsOfUseLabel => 'ข้อกำหนดการใช้งาน';

  @override
  String get todaysMessageHint => 'วินาทีนี้คือตัวคุณที่อายุน้อยที่สุดแล้ว';

  @override
  String get shareLabel => 'แชร์';

  @override
  String shareMessage(int percentage) {
    return 'ชีวิตฉันเหลืออีก $percentage% แล้วของคุณล่ะ?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'ชีวิตที่เหลือ';

  @override
  String get shareErrorContent => 'ขณะนี้ไม่สามารถแชร์ได้';

  @override
  String get onboardingBirthDateTitle => 'คุณเกิดเมื่อไหร่?';

  @override
  String get onboardingBirthDateDescription =>
      'ใช้สำหรับคำนวณว่าชีวิตของคุณเหลืออยู่เท่าไร';

  @override
  String get onboardingContinueLabel => 'ถัดไป';

  @override
  String get onboardingIdealAgeTitle => 'คุณอยากมีชีวิตอยู่ถึงอายุเท่าไหร่?';

  @override
  String get onboardingIdealAgeDescription =>
      'ตอบตามที่ใจอยากได้เลย เปลี่ยนภายหลังได้';

  @override
  String onboardingResultTitle(int percentage) {
    return 'ชีวิตของคุณเหลืออีก $percentage%';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'คิดเป็นอีก $days วัน';
  }
}
