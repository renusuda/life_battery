// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get generalError => 'אירעה שגיאה.';

  @override
  String get birthDateLabel => 'תאריך לידה';

  @override
  String get idealLifespanLabel => 'תוחלת חיים אידיאלית';

  @override
  String idealAgePresetLabel(int age) {
    return '$age שנה';
  }

  @override
  String get ageUnit => 'שנה';

  @override
  String get dayUnit => ' ימים';

  @override
  String get reviewAppLabel => 'דירוג היישום';

  @override
  String get widgetGuideLabel => 'הוספת הווידג׳ט';

  @override
  String get widgetGuideSheetTitle => 'הוספת הווידג׳ט למסך הבית';

  @override
  String get widgetGuideDescription =>
      'ניתן לראות במבט אחד כמה נותר מהחיים, ישירות במסך הבית.';

  @override
  String get widgetTrialNote => '🎁 היום ניתן לנסות את הווידג׳ט בחינם.';

  @override
  String get widgetGuideIosStep1 =>
      'יש ללחוץ לחיצה ממושכת על אזור ריק במסך הבית.';

  @override
  String get widgetGuideIosStep2 =>
      'יש להקיש על ״עריכה״ בפינה העליונה, ואז על ״הוספת וידג׳ט״.';

  @override
  String get widgetGuideIosStep3 =>
      'יש לחפש את Life Battery ולהוסיף את הווידג׳ט.';

  @override
  String get widgetGuideAndroidStep1 =>
      'יש ללחוץ לחיצה ממושכת על אזור ריק במסך הבית.';

  @override
  String get widgetGuideAndroidStep2 => 'יש להקיש על ״וידג׳טים״.';

  @override
  String get widgetGuideAndroidStep3 =>
      'יש לחפש את Life Battery ולהוסיף את הווידג׳ט.';

  @override
  String get privacyPolicyLabel => 'מדיניות הפרטיות';

  @override
  String get appearanceLabel => 'מראה';

  @override
  String get systemLabel => 'מערכת';

  @override
  String get lightLabel => 'בהיר';

  @override
  String get darkLabel => 'כהה';

  @override
  String get deleteAllLabel => 'מחיקת הנתונים';

  @override
  String get deleteTitle => 'מחיקת כל הנתונים';

  @override
  String get deleteContent =>
      'למחוק את הנתונים?\nלא ניתן לשחזר נתונים לאחר מחיקתם.';

  @override
  String get cancelLabel => 'ביטול';

  @override
  String get deleteLabel => 'מחיקה';

  @override
  String get userDeletionSuccess =>
      'הנתונים שלך נמחקו בהצלחה.\nתודה שהשתמשת ביישום שלנו.\nנשמח לראותך שוב בעתיד.😊';

  @override
  String get notificationSettingsLabel => 'הגדרות עדכונים';

  @override
  String notificationTitle(int percentage) {
    return 'נותרו לך $percentage% מהחיים.';
  }

  @override
  String get notificationBody => 'בואו נהפוך את ה-1% הבא לפרק הטוב ביותר!';

  @override
  String get notificationBodyZeroPercent =>
      'הסיפור שלך ממשיך לחיות בסיפורים של אחרים. תודה.';

  @override
  String get longPressToEditHint => 'לחיצה ממושכת לעריכת החיים שלך';

  @override
  String get premiumLabel => 'פרימיום';

  @override
  String get premiumDescriptionContent => 'גישה לכל התכונות';

  @override
  String get premiumPurchasedLabel => 'נרכש';

  @override
  String get premiumSheetTitle => 'להפיק את המרב מהזמן שלך';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'מה מקבלים עם פרימיום';

  @override
  String get premiumFeatureAdRemovalLabel => 'הסתרת כל הפרסומות';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'כל הפרסומות';

  @override
  String get premiumFeatureWidgetLabel => 'מעקב במבט אחד עם הווידג׳ט';

  @override
  String get premiumFeatureWidgetEmphasis => 'הווידג׳ט';

  @override
  String get oneTimePurchaseLabel => 'רכישה חד־פעמית';

  @override
  String get monthlyPlanLabel => 'חודשי';

  @override
  String get recommendedPlanBadgeLabel => 'הכי משתלם';

  @override
  String monthlyPriceLabel(String price) {
    return '$price לחודש';
  }

  @override
  String get monthlySubscriptionDescription => 'ניתן לבטל בכל עת';

  @override
  String get oneTimePurchaseDescription => 'תשלום אחד, שימוש לתמיד';

  @override
  String get lifetimeSupportPlanLabel => 'חד־פעמי + תמיכה';

  @override
  String get lifetimeSupportDescription =>
      'כמו רכישה חד־פעמית, עם תמיכה בפיתוח';

  @override
  String get purchaseButtonLabel => 'רכישה';

  @override
  String get storeUnavailableContent => 'החנות אינה זמינה כרגע.';

  @override
  String get purchaseSuccessContent => 'תודה! תכונות הפרימיום זמינות עכשיו.';

  @override
  String get purchasePendingContent => 'הרכישה ממתינה לאישור.';

  @override
  String get purchaseErrorContent =>
      'לא ניתן היה להשלים את הרכישה. יש לנסות שוב.';

  @override
  String get restorePurchasesLabel => 'שחזור רכישות';

  @override
  String get termsOfUseLabel => 'תנאי שימוש';

  @override
  String get todaysMessageHint => 'הרגע הזה הוא הצעיר ביותר בשארית חייך.';

  @override
  String get shareLabel => 'שיתוף';

  @override
  String shareMessage(int percentage) {
    return 'נותרו לי $percentage% מהחיים. ולך?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'החיים שנותרו';

  @override
  String get shareErrorContent => 'לא ניתן לשתף כרגע.';

  @override
  String get onboardingBirthDateTitle => 'מתי נולדת?';

  @override
  String get onboardingBirthDateDescription =>
      'המידע משמש לחישוב כמה נותר מהחיים שלך.';

  @override
  String get onboardingContinueLabel => 'המשך';

  @override
  String get onboardingIdealAgeTitle => 'עד איזה גיל היית רוצה לחיות?';

  @override
  String get onboardingIdealAgeDescription =>
      'אפשר לבחור את הגיל האידיאלי. ניתן לשנות אותו בהמשך.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'נותרו לך $percentage% מהחיים';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'כלומר, עוד $days ימים.';
  }
}
