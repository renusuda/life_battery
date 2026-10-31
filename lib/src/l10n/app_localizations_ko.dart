// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get generalError => '오류가 발생했어요.';

  @override
  String get birthDateLabel => '생년월일';

  @override
  String get idealLifespanLabel => '이상적인 수명';

  @override
  String idealAgePresetLabel(int age) {
    return '$age세';
  }

  @override
  String get ageUnit => '세';

  @override
  String get dayUnit => '일';

  @override
  String get reviewAppLabel => '앱 리뷰 남기기';

  @override
  String get widgetGuideLabel => '위젯 추가';

  @override
  String get widgetGuideSheetTitle => '홈 화면에 위젯 추가하기';

  @override
  String get widgetGuideDescription => '홈 화면에서 남은 인생을 한눈에 확인할 수 있어요.';

  @override
  String get widgetTrialNote => '🎁 오늘은 위젯을 무료로 체험할 수 있어요.';

  @override
  String get widgetGuideIosStep1 => '홈 화면의 빈 영역을 길게 터치하세요.';

  @override
  String get widgetGuideIosStep2 => '왼쪽 상단의 ‘편집’을 탭한 다음 ‘위젯 추가’를 탭하세요.';

  @override
  String get widgetGuideIosStep3 => '‘Life Battery’를 검색한 다음 위젯을 추가하세요.';

  @override
  String get widgetGuideAndroidStep1 => '홈 화면의 빈 공간을 길게 누르세요.';

  @override
  String get widgetGuideAndroidStep2 => '‘위젯’을 누르세요.';

  @override
  String get widgetGuideAndroidStep3 => '‘Life Battery’를 검색한 다음 위젯을 추가하세요.';

  @override
  String get privacyPolicyLabel => '개인정보 처리방침';

  @override
  String get appearanceLabel => '화면 모드';

  @override
  String get systemLabel => '시스템';

  @override
  String get lightLabel => '라이트';

  @override
  String get darkLabel => '다크';

  @override
  String get deleteAllLabel => '데이터 삭제';

  @override
  String get deleteTitle => '모든 데이터 삭제';

  @override
  String get deleteContent => '정말 데이터를 삭제할까요?\n삭제한 데이터는 복구할 수 없어요.';

  @override
  String get cancelLabel => '취소';

  @override
  String get deleteLabel => '삭제';

  @override
  String get userDeletionSuccess =>
      '데이터를 삭제했어요.\n앱을 이용해 주셔서 감사합니다.\n언젠가 또 만나요.😊';

  @override
  String get notificationSettingsLabel => '알림 설정';

  @override
  String notificationTitle(int percentage) {
    return '인생이 $percentage% 남았어요.';
  }

  @override
  String get notificationBody => '다음 1%를 최고의 이야기로 만들어 봐요!';

  @override
  String get notificationBodyZeroPercent =>
      '당신의 이야기는 누군가의 이야기 속에서 계속 살아갑니다. 감사합니다.';

  @override
  String get longPressToEditHint => '길게 눌러 인생 편집';

  @override
  String get premiumLabel => '프리미엄';

  @override
  String get premiumDescriptionContent => '모든 기능 잠금 해제';

  @override
  String get premiumPurchasedLabel => '구매 완료';

  @override
  String get premiumSheetTitle => '남은 시간을 더 소중하게';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => '프리미엄으로 할 수 있는 것';

  @override
  String get premiumFeatureAdRemovalLabel => '모든 광고 숨기기';

  @override
  String get premiumFeatureAdRemovalEmphasis => '모든 광고';

  @override
  String get premiumFeatureWidgetLabel => '위젯으로 한눈에 확인';

  @override
  String get premiumFeatureWidgetEmphasis => '위젯';

  @override
  String get oneTimePurchaseLabel => '1회 구매';

  @override
  String get monthlyPlanLabel => '월간';

  @override
  String get recommendedPlanBadgeLabel => '추천';

  @override
  String monthlyPriceLabel(String price) {
    return '월 $price';
  }

  @override
  String get monthlySubscriptionDescription => '언제든지 해지할 수 있어요';

  @override
  String get oneTimePurchaseDescription => '한 번 결제로 평생 이용';

  @override
  String get lifetimeSupportPlanLabel => '1회 구매 + 응원';

  @override
  String get lifetimeSupportDescription => '1회 구매와 같은 내용에 개발 응원까지';

  @override
  String get purchaseButtonLabel => '구매하기';

  @override
  String get storeUnavailableContent => '현재 스토어를 이용할 수 없어요.';

  @override
  String get purchaseSuccessContent => '구매해 주셔서 감사합니다! 이제 프리미엄 기능을 이용할 수 있어요.';

  @override
  String get purchasePendingContent => '구매 승인을 기다리고 있어요.';

  @override
  String get purchaseErrorContent => '구매를 완료하지 못했어요. 다시 시도해 주세요.';

  @override
  String get restorePurchasesLabel => '구매 복원';

  @override
  String get termsOfUseLabel => '이용약관';

  @override
  String get todaysMessageHint => '지금 이 순간이 가장 젊은 나';

  @override
  String get shareLabel => '공유';

  @override
  String shareMessage(int percentage) {
    return '내 인생은 $percentage% 남았대. 너는?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => '남은 인생';

  @override
  String get shareErrorContent => '지금은 공유할 수 없어요.';

  @override
  String get onboardingBirthDateTitle => '생일이 언제인가요?';

  @override
  String get onboardingBirthDateDescription => '남은 인생을 계산하는 데 사용돼요.';

  @override
  String get onboardingContinueLabel => '다음';

  @override
  String get onboardingIdealAgeTitle => '몇 살까지 살고 싶나요?';

  @override
  String get onboardingIdealAgeDescription => '이상적인 나이로 괜찮아요. 나중에 변경할 수 있어요.';

  @override
  String onboardingResultTitle(int percentage) {
    return '남은 인생은 $percentage%';
  }

  @override
  String onboardingResultDescription(String days) {
    return '일수로 환산하면 앞으로 $days일이에요.';
  }
}
