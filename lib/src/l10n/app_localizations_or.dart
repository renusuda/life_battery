// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get generalError => 'ଏକ ତ୍ରୁଟି ଘଟିଛି।';

  @override
  String get birthDateLabel => 'ଜନ୍ମ ତାରିଖ';

  @override
  String get idealLifespanLabel => 'ଆଦର୍ଶ ଆୟୁ';

  @override
  String idealAgePresetLabel(int age) {
    return '$age ବର୍ଷ';
  }

  @override
  String get ageUnit => 'ବର୍ଷ';

  @override
  String get dayUnit => ' ଦିନ';

  @override
  String get reviewAppLabel => 'ଏହି ଆପ୍‌କୁ ରେଟିଂ ଦିଅନ୍ତୁ';

  @override
  String get widgetGuideLabel => 'ୱିଜେଟ୍ ଯୋଡ଼ନ୍ତୁ';

  @override
  String get widgetGuideSheetTitle => 'ହୋମ୍ ସ୍କ୍ରୀନ୍‌ରେ ୱିଜେଟ୍ ଯୋଡ଼ନ୍ତୁ';

  @override
  String get widgetGuideDescription =>
      'ହୋମ୍ ସ୍କ୍ରୀନ୍‌ରେ ହିଁ ଏକ ନଜରରେ ଦେଖନ୍ତୁ, ଆପଣଙ୍କ ଜୀବନର କେତେ ବାକି ଅଛି।';

  @override
  String get widgetTrialNote => '🎁 ଆଜି ୱିଜେଟ୍‌କୁ ମାଗଣାରେ ବ୍ୟବହାର କରି ଦେଖନ୍ତୁ।';

  @override
  String get widgetGuideIosStep1 =>
      'ହୋମ୍ ସ୍କ୍ରୀନ୍‌ର ଏକ ଖାଲି ସ୍ଥାନରେ ସ୍ପର୍ଶ କରି ହୋଲ୍ଡ୍ କରନ୍ତୁ।';

  @override
  String get widgetGuideIosStep2 =>
      'ଉପର ବାମ କୋଣରେ “ଏଡିଟ୍” ରେ ଟାପ୍ କରନ୍ତୁ, ତା’ପରେ “ୱିଜେଟ୍ ଯୋଡ଼ନ୍ତୁ” ରେ ଟାପ୍ କରନ୍ତୁ।';

  @override
  String get widgetGuideIosStep3 => 'Life Battery ସର୍ଚ୍ଚ୍ କରି ୱିଜେଟ୍ ଯୋଡ଼ନ୍ତୁ।';

  @override
  String get widgetGuideAndroidStep1 =>
      'ହୋମ୍ ସ୍କ୍ରୀନ୍‌ର ଏକ ଖାଲି ସ୍ଥାନରେ ସ୍ପର୍ଶ କରି ହୋଲ୍ଡ୍ କରନ୍ତୁ।';

  @override
  String get widgetGuideAndroidStep2 => '“ୱିଜେଟ୍” ରେ ଟାପ୍ କରନ୍ତୁ।';

  @override
  String get widgetGuideAndroidStep3 =>
      'Life Battery ସର୍ଚ୍ଚ୍ କରି ୱିଜେଟ୍ ଯୋଡ଼ନ୍ତୁ।';

  @override
  String get privacyPolicyLabel => 'ଗୋପନୀୟତା ନୀତି';

  @override
  String get appearanceLabel => 'ଆପିଅରନ୍ସ୍';

  @override
  String get systemLabel => 'ସିଷ୍ଟମ୍';

  @override
  String get lightLabel => 'ଲାଇଟ୍';

  @override
  String get darkLabel => 'ଡାର୍କ୍';

  @override
  String get deleteAllLabel => 'ଡେଟା ଡିଲୀଟ୍ କରନ୍ତୁ';

  @override
  String get deleteTitle => 'ସମସ୍ତ ଡେଟା ଡିଲୀଟ୍ କରନ୍ତୁ';

  @override
  String get deleteContent =>
      'ଆପଣ ଡେଟା ଡିଲୀଟ୍ କରିବାକୁ ଚାହୁଁଛନ୍ତି ବୋଲି ନିଶ୍ଚିତ କି?\nଡିଲୀଟ୍ ହୋଇଥିବା ଡେଟା ଆଉ ଫେରାଇ ଆଣିହେବ ନାହିଁ।';

  @override
  String get cancelLabel => 'ବାତିଲ୍ କରନ୍ତୁ';

  @override
  String get deleteLabel => 'ଡିଲୀଟ୍ କରନ୍ତୁ';

  @override
  String get userDeletionSuccess =>
      'ଆପଣଙ୍କ ଡେଟା ସଫଳତାର ସହ ଡିଲୀଟ୍ ହୋଇଛି।\nଆମ ଆପ୍ ବ୍ୟବହାର କରିଥିବାରୁ ଧନ୍ୟବାଦ।\nଆଶା କରୁଛୁ ପୁଣି ଦେଖା ହେବ।😊';

  @override
  String get notificationSettingsLabel => 'ନୋଟିଫିକେଶନ୍ ସେଟିଂସ୍';

  @override
  String notificationTitle(int percentage) {
    return 'ଆପଣଙ୍କ ଜୀବନର $percentage% ବାକି ଅଛି।';
  }

  @override
  String get notificationBody =>
      'ଆସନ୍ତୁ, ପରବର୍ତ୍ତୀ 1%କୁ ଆପଣଙ୍କ ଜୀବନର ସର୍ବଶ୍ରେଷ୍ଠ ଅଧ୍ୟାୟ କରିବା!';

  @override
  String get notificationBodyZeroPercent =>
      'ଆପଣଙ୍କ କାହାଣୀ ଅନ୍ୟମାନଙ୍କ କାହାଣୀରେ ବଞ୍ଚି ରହିବ। ଧନ୍ୟବାଦ।';

  @override
  String get longPressToEditHint => 'ଜୀବନ ଏଡିଟ୍ କରିବାକୁ ଦବାଇ ଧରନ୍ତୁ';

  @override
  String get premiumLabel => 'ପ୍ରିମିୟମ୍';

  @override
  String get premiumDescriptionContent => 'ସମସ୍ତ ଫିଚର୍ ଅନ୍‌ଲକ୍ କରନ୍ତୁ';

  @override
  String get premiumPurchasedLabel => 'କ୍ରୟ କରାଯାଇଛି';

  @override
  String get premiumSheetTitle => 'ଆପଣଙ୍କ ସମୟର ସର୍ବୋତ୍ତମ ଉପଯୋଗ କରନ୍ତୁ';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'ପ୍ରିମିୟମ୍‌ରେ ଆପଣ ଯାହା ପାଇବେ';

  @override
  String get premiumFeatureAdRemovalLabel => 'ସମସ୍ତ ବିଜ୍ଞାପନ ଲୁଚାଇଦିଏ';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'ସମସ୍ତ ବିଜ୍ଞାପନ';

  @override
  String get premiumFeatureWidgetLabel => 'ୱିଜେଟ୍ ମାଧ୍ୟମରେ ଏକ ନଜରରେ ଦେଖନ୍ତୁ';

  @override
  String get premiumFeatureWidgetEmphasis => 'ୱିଜେଟ୍';

  @override
  String get oneTimePurchaseLabel => 'ଏକକାଳୀନ କ୍ରୟ';

  @override
  String get monthlyPlanLabel => 'ମାସିକ';

  @override
  String get recommendedPlanBadgeLabel => 'ସବୁଠାରୁ ଲାଭଦାୟକ';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/ମାସ';
  }

  @override
  String get monthlySubscriptionDescription => 'ଯେକୌଣସି ସମୟରେ ବାତିଲ୍ କରନ୍ତୁ';

  @override
  String get oneTimePurchaseDescription =>
      'ଥରେ ପେମେଣ୍ଟ କରନ୍ତୁ, ସବୁଦିନ ପାଇଁ ବ୍ୟବହାର କରନ୍ତୁ';

  @override
  String get lifetimeSupportPlanLabel => 'ଏକକାଳୀନ + ସପୋର୍ଟ';

  @override
  String get lifetimeSupportDescription =>
      'ଏକକାଳୀନ କ୍ରୟ ସହିତ ସମାନ, ସାଙ୍ଗକୁ ଆପ୍‌ର ବିକାଶରେ ସହଯୋଗ';

  @override
  String get purchaseButtonLabel => 'କ୍ରୟ କରନ୍ତୁ';

  @override
  String get storeUnavailableContent => 'ଷ୍ଟୋର୍ ବର୍ତ୍ତମାନ ଉପଲବ୍ଧ ନାହିଁ।';

  @override
  String get purchaseSuccessContent =>
      'ଧନ୍ୟବାଦ! ପ୍ରିମିୟମ୍ ଫିଚର୍‌ଗୁଡ଼ିକ ବର୍ତ୍ତମାନ ଅନ୍‌ଲକ୍ ହୋଇଗଲା।';

  @override
  String get purchasePendingContent =>
      'ଆପଣଙ୍କ କ୍ରୟ ଅନୁମୋଦନ ପାଇଁ ଅପେକ୍ଷାରେ ଅଛି।';

  @override
  String get purchaseErrorContent =>
      'କ୍ରୟ ସମ୍ପୂର୍ଣ୍ଣ ହୋଇପାରିଲା ନାହିଁ। ଦୟାକରି ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ।';

  @override
  String get restorePurchasesLabel => 'କ୍ରୟ ରିଷ୍ଟୋର୍ କରନ୍ତୁ';

  @override
  String get termsOfUseLabel => 'ବ୍ୟବହାରର ସର୍ତ୍ତାବଳୀ';

  @override
  String get todaysMessageHint => 'ଆପଣ ଆଉ କେବେ ଏବେଠାରୁ କମ୍ ବୟସର ହେବେ ନାହିଁ।';

  @override
  String get shareLabel => 'ଶେୟର୍ କରନ୍ତୁ';

  @override
  String shareMessage(int percentage) {
    return 'ମୋ ଜୀବନର $percentage% ବାକି ଅଛି। ଆପଣଙ୍କର କେତେ?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'ବାକି ଜୀବନ';

  @override
  String get shareErrorContent => 'ବର୍ତ୍ତମାନ ଶେୟର୍ କରିହେବ ନାହିଁ।';

  @override
  String get onboardingBirthDateTitle => 'ଆପଣଙ୍କ ଜନ୍ମ କେବେ ହୋଇଥିଲା?';

  @override
  String get onboardingBirthDateDescription =>
      'ଆପଣଙ୍କ ଜୀବନର କେତେ ବାକି ଅଛି, ତାହା ହିସାବ କରିବା ପାଇଁ ଏହା ବ୍ୟବହାର କରାଯାଏ।';

  @override
  String get onboardingContinueLabel => 'ଜାରି ରଖନ୍ତୁ';

  @override
  String get onboardingIdealAgeTitle => 'ଆପଣ କେତେ ବର୍ଷ ବଞ୍ଚିବାକୁ ଚାହାଁନ୍ତି?';

  @override
  String get onboardingIdealAgeDescription =>
      'ଆପଣଙ୍କ ଆଦର୍ଶ ବୟସ ବାଛନ୍ତୁ। ଏହାକୁ ପରେ ବଦଳାଇ ପାରିବେ।';

  @override
  String onboardingResultTitle(int percentage) {
    return 'ଆପଣଙ୍କ ଜୀବନର $percentage% ବାକି ଅଛି';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'ଅର୍ଥାତ୍ ଆଉ $days ଦିନ ବାକି।';
  }
}
