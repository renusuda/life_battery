// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get generalError => 'Đã xảy ra lỗi.';

  @override
  String get birthDateLabel => 'Ngày sinh';

  @override
  String get idealLifespanLabel => 'Tuổi thọ lý tưởng';

  @override
  String idealAgePresetLabel(int age) {
    return '$age tuổi';
  }

  @override
  String get ageUnit => 'tuổi';

  @override
  String get dayUnit => ' ngày';

  @override
  String get reviewAppLabel => 'Đánh giá ứng dụng';

  @override
  String get widgetGuideLabel => 'Thêm tiện ích';

  @override
  String get widgetGuideSheetTitle => 'Thêm tiện ích vào Màn hình chính';

  @override
  String get widgetGuideDescription =>
      'Xem nhanh quãng đời còn lại ngay trên Màn hình chính.';

  @override
  String get widgetTrialNote =>
      '🎁 Hôm nay bạn có thể dùng thử tiện ích miễn phí.';

  @override
  String get widgetGuideIosStep1 =>
      'Chạm và giữ một vùng trống trên Màn hình chính.';

  @override
  String get widgetGuideIosStep2 =>
      'Chạm vào Sửa ở góc trên bên trái, rồi chạm vào Thêm tiện ích.';

  @override
  String get widgetGuideIosStep3 => 'Tìm Life Battery và thêm tiện ích.';

  @override
  String get widgetGuideAndroidStep1 =>
      'Chạm và giữ một vùng trống trên Màn hình chính.';

  @override
  String get widgetGuideAndroidStep2 => 'Chạm vào Tiện ích.';

  @override
  String get widgetGuideAndroidStep3 => 'Tìm Life Battery và thêm tiện ích.';

  @override
  String get privacyPolicyLabel => 'Chính sách quyền riêng tư';

  @override
  String get appearanceLabel => 'Giao diện';

  @override
  String get systemLabel => 'Hệ thống';

  @override
  String get lightLabel => 'Sáng';

  @override
  String get darkLabel => 'Tối';

  @override
  String get deleteAllLabel => 'Xóa dữ liệu';

  @override
  String get deleteTitle => 'Xóa toàn bộ dữ liệu';

  @override
  String get deleteContent =>
      'Bạn có chắc chắn muốn xóa dữ liệu không?\nDữ liệu đã xóa sẽ không thể khôi phục.';

  @override
  String get cancelLabel => 'Hủy';

  @override
  String get deleteLabel => 'Xóa';

  @override
  String get userDeletionSuccess =>
      'Đã xóa dữ liệu của bạn.\nCảm ơn bạn đã sử dụng ứng dụng.\nHẹn gặp lại bạn một ngày nào đó.😊';

  @override
  String get notificationSettingsLabel => 'Cài đặt thông báo';

  @override
  String notificationTitle(int percentage) {
    return 'Cuộc đời bạn còn $percentage%.';
  }

  @override
  String get notificationBody =>
      'Hãy biến 1% tiếp theo thành chương đẹp nhất của bạn!';

  @override
  String get notificationBodyZeroPercent =>
      'Câu chuyện của bạn sẽ tiếp tục sống trong câu chuyện của người khác. Cảm ơn bạn.';

  @override
  String get longPressToEditHint => 'Nhấn giữ để chỉnh sửa cuộc đời';

  @override
  String get premiumLabel => 'Premium';

  @override
  String get premiumDescriptionContent => 'Mở khóa tất cả tính năng';

  @override
  String get premiumPurchasedLabel => 'Đã mua';

  @override
  String get premiumSheetTitle => 'Trân trọng hơn thời gian còn lại';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'Những gì bạn nhận được với Premium';

  @override
  String get premiumFeatureAdRemovalLabel => 'Ẩn tất cả quảng cáo';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'tất cả quảng cáo';

  @override
  String get premiumFeatureWidgetLabel => 'Xem nhanh bằng tiện ích';

  @override
  String get premiumFeatureWidgetEmphasis => 'tiện ích';

  @override
  String get oneTimePurchaseLabel => 'Mua một lần';

  @override
  String get monthlyPlanLabel => 'Hàng tháng';

  @override
  String get recommendedPlanBadgeLabel => 'Đề xuất';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/tháng';
  }

  @override
  String get monthlySubscriptionDescription => 'Hủy bất cứ lúc nào';

  @override
  String get oneTimePurchaseDescription => 'Trả một lần, dùng mãi mãi';

  @override
  String get lifetimeSupportPlanLabel => 'Mua một lần + ủng hộ';

  @override
  String get lifetimeSupportDescription =>
      'Giống gói mua một lần, kèm ủng hộ nhà phát triển';

  @override
  String get purchaseButtonLabel => 'Mua';

  @override
  String get storeUnavailableContent => 'Hiện không thể truy cập cửa hàng.';

  @override
  String get purchaseSuccessContent =>
      'Cảm ơn bạn! Các tính năng Premium đã được mở khóa.';

  @override
  String get purchasePendingContent =>
      'Giao dịch mua của bạn đang chờ phê duyệt.';

  @override
  String get purchaseErrorContent =>
      'Không thể hoàn tất giao dịch mua. Vui lòng thử lại.';

  @override
  String get restorePurchasesLabel => 'Khôi phục giao dịch mua';

  @override
  String get termsOfUseLabel => 'Điều khoản sử dụng';

  @override
  String get todaysMessageHint => 'Khoảnh khắc này là lúc bạn trẻ nhất.';

  @override
  String get shareLabel => 'Chia sẻ';

  @override
  String shareMessage(int percentage) {
    return 'Cuộc đời mình còn $percentage%. Còn bạn thì sao?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'Quãng đời còn lại';

  @override
  String get shareErrorContent => 'Hiện không thể chia sẻ.';

  @override
  String get onboardingBirthDateTitle => 'Bạn sinh ngày nào?';

  @override
  String get onboardingBirthDateDescription =>
      'Thông tin này được dùng để tính quãng đời còn lại của bạn.';

  @override
  String get onboardingContinueLabel => 'Tiếp tục';

  @override
  String get onboardingIdealAgeTitle => 'Bạn muốn sống đến bao nhiêu tuổi?';

  @override
  String get onboardingIdealAgeDescription =>
      'Cứ chọn theo mong muốn của bạn. Bạn có thể thay đổi sau.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'Cuộc đời bạn còn $percentage%';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'Tức là còn $days ngày nữa.';
  }
}
