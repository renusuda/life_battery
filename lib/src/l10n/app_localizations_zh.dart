// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get generalError => '发生错误。';

  @override
  String get birthDateLabel => '出生日期';

  @override
  String get idealLifespanLabel => '理想寿命';

  @override
  String idealAgePresetLabel(int age) {
    return '$age岁';
  }

  @override
  String get ageUnit => '岁';

  @override
  String get dayUnit => '天';

  @override
  String get reviewAppLabel => '给应用评分';

  @override
  String get widgetGuideLabel => '添加小组件';

  @override
  String get widgetGuideSheetTitle => '将小组件添加到主屏幕';

  @override
  String get widgetGuideDescription => '在主屏幕上就能一眼看到余生还剩多少。';

  @override
  String get widgetTrialNote => '🎁 今天可免费试用小组件。';

  @override
  String get widgetGuideIosStep1 => '按住主屏幕上的空白区域。';

  @override
  String get widgetGuideIosStep2 => '轻点左上角的“编辑”，然后轻点“添加小组件”。';

  @override
  String get widgetGuideIosStep3 => '搜索“Life Battery”并添加小组件。';

  @override
  String get widgetGuideAndroidStep1 => '长按主屏幕上的空白区域。';

  @override
  String get widgetGuideAndroidStep2 => '点按“微件”。';

  @override
  String get widgetGuideAndroidStep3 => '搜索“Life Battery”并添加微件。';

  @override
  String get privacyPolicyLabel => '隐私政策';

  @override
  String get appearanceLabel => '外观';

  @override
  String get systemLabel => '跟随系统';

  @override
  String get lightLabel => '浅色';

  @override
  String get darkLabel => '深色';

  @override
  String get deleteAllLabel => '删除数据';

  @override
  String get deleteTitle => '删除所有数据';

  @override
  String get deleteContent => '确定要删除数据吗？\n数据删除后将无法恢复。';

  @override
  String get cancelLabel => '取消';

  @override
  String get deleteLabel => '删除';

  @override
  String get userDeletionSuccess => '你的数据已删除。\n感谢你使用本应用。\n期待与你再次相见。😊';

  @override
  String get notificationSettingsLabel => '通知设置';

  @override
  String notificationTitle(int percentage) {
    return '你的人生还剩$percentage%。';
  }

  @override
  String get notificationBody => '让接下来的1%，成为你最精彩的篇章！';

  @override
  String get notificationBodyZeroPercent => '你的故事，会在他人的故事里继续流传。谢谢你。';

  @override
  String get longPressToEditHint => '长按即可编辑你的人生';

  @override
  String get premiumLabel => '高级版';

  @override
  String get premiumDescriptionContent => '解锁全部功能';

  @override
  String get premiumPurchasedLabel => '已购买';

  @override
  String get premiumSheetTitle => '更加珍惜余下的时光';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => '高级版专享功能';

  @override
  String get premiumFeatureAdRemovalLabel => '隐藏所有广告';

  @override
  String get premiumFeatureAdRemovalEmphasis => '所有广告';

  @override
  String get premiumFeatureWidgetLabel => '用小组件一眼查看';

  @override
  String get premiumFeatureWidgetEmphasis => '小组件';

  @override
  String get oneTimePurchaseLabel => '一次性购买';

  @override
  String get monthlyPlanLabel => '按月订阅';

  @override
  String get recommendedPlanBadgeLabel => '推荐';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/月';
  }

  @override
  String get monthlySubscriptionDescription => '可随时取消';

  @override
  String get oneTimePurchaseDescription => '一次付费，永久使用';

  @override
  String get lifetimeSupportPlanLabel => '一次性购买 + 支持';

  @override
  String get lifetimeSupportDescription => '与一次性购买内容相同，还能支持开发';

  @override
  String get purchaseButtonLabel => '购买';

  @override
  String get storeUnavailableContent => '商店暂时无法使用。';

  @override
  String get purchaseSuccessContent => '感谢购买！高级版功能已解锁。';

  @override
  String get purchasePendingContent => '你的购买正在等待批准。';

  @override
  String get purchaseErrorContent => '无法完成购买，请重试。';

  @override
  String get restorePurchasesLabel => '恢复购买';

  @override
  String get termsOfUseLabel => '使用条款';

  @override
  String get todaysMessageHint => '此刻的你，是余生中最年轻的自己。';

  @override
  String get shareLabel => '分享';

  @override
  String shareMessage(int percentage) {
    return '我的人生还剩$percentage%。你呢？';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => '剩余人生';

  @override
  String get shareErrorContent => '暂时无法分享。';

  @override
  String get onboardingBirthDateTitle => '你的生日是哪天？';

  @override
  String get onboardingBirthDateDescription => '用于计算你还剩多少人生。';

  @override
  String get onboardingContinueLabel => '继续';

  @override
  String get onboardingIdealAgeTitle => '你想活到多少岁？';

  @override
  String get onboardingIdealAgeDescription => '按理想填写就好，之后可以修改。';

  @override
  String onboardingResultTitle(int percentage) {
    return '你的人生还剩$percentage%';
  }

  @override
  String onboardingResultDescription(String days) {
    return '换算成天数，还有$days天。';
  }
}
