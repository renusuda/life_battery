// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get generalError => 'कोई त्रुटि हुई।';

  @override
  String get birthDateLabel => 'जन्मतिथि';

  @override
  String get idealLifespanLabel => 'आदर्श जीवनकाल';

  @override
  String idealAgePresetLabel(int age) {
    return '$age वर्ष';
  }

  @override
  String get ageUnit => 'वर्ष';

  @override
  String get dayUnit => ' दिन';

  @override
  String get reviewAppLabel => 'इस ऐप को रेट करें';

  @override
  String get widgetGuideLabel => 'विजेट जोड़ें';

  @override
  String get widgetGuideSheetTitle => 'अपनी होम स्क्रीन पर विजेट जोड़ें';

  @override
  String get widgetGuideDescription =>
      'अपनी होम स्क्रीन पर ही एक नज़र में देखें कि आपका कितना जीवन बाकी है।';

  @override
  String get widgetTrialNote => '🎁 आज विजेट मुफ़्त में आज़माएँ।';

  @override
  String get widgetGuideIosStep1 =>
      'होम स्क्रीन पर किसी खाली जगह को स्पर्श करके रखें।';

  @override
  String get widgetGuideIosStep2 =>
      'ऊपर बाएँ कोने में “संपादित करें” पर टैप करें, फिर “विजेट जोड़ें” पर टैप करें।';

  @override
  String get widgetGuideIosStep3 => 'Life Battery खोजें और विजेट जोड़ें।';

  @override
  String get widgetGuideAndroidStep1 =>
      'होम स्क्रीन पर किसी खाली जगह को टच करके रखें।';

  @override
  String get widgetGuideAndroidStep2 => '“विजेट” पर टैप करें।';

  @override
  String get widgetGuideAndroidStep3 => 'Life Battery खोजें और विजेट जोड़ें।';

  @override
  String get privacyPolicyLabel => 'गोपनीयता नीति';

  @override
  String get appearanceLabel => 'दिखावट';

  @override
  String get systemLabel => 'सिस्टम';

  @override
  String get lightLabel => 'लाइट';

  @override
  String get darkLabel => 'डार्क';

  @override
  String get deleteAllLabel => 'डेटा डिलीट करें';

  @override
  String get deleteTitle => 'सारा डेटा डिलीट करें';

  @override
  String get deleteContent =>
      'क्या आप वाकई डेटा डिलीट करना चाहते हैं?\nडिलीट किया गया डेटा वापस नहीं लाया जा सकता।';

  @override
  String get cancelLabel => 'रद्द करें';

  @override
  String get deleteLabel => 'डिलीट करें';

  @override
  String get userDeletionSuccess =>
      'आपका डेटा सफलतापूर्वक डिलीट हो गया है।\nहमारा ऐप इस्तेमाल करने के लिए धन्यवाद।\nउम्मीद है, हम फिर मिलेंगे।😊';

  @override
  String get notificationSettingsLabel => 'सूचना सेटिंग्स';

  @override
  String notificationTitle(int percentage) {
    return 'आपके जीवन का $percentage% बाकी है।';
  }

  @override
  String get notificationBody =>
      'आइए, अगले 1% को अपना सबसे बेहतरीन अध्याय बनाएँ!';

  @override
  String get notificationBodyZeroPercent =>
      'आपकी कहानी दूसरों की कहानियों में हमेशा ज़िंदा रहेगी। धन्यवाद।';

  @override
  String get longPressToEditHint => 'जीवन संपादित करने के लिए देर तक दबाएँ';

  @override
  String get premiumLabel => 'प्रीमियम';

  @override
  String get premiumDescriptionContent => 'सभी सुविधाएँ अनलॉक करें';

  @override
  String get premiumPurchasedLabel => 'खरीदा गया';

  @override
  String get premiumSheetTitle => 'अपने समय को और भी कीमती बनाएँ';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'प्रीमियम में आपको क्या मिलता है';

  @override
  String get premiumFeatureAdRemovalLabel => 'सभी विज्ञापन हट जाते हैं';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'सभी विज्ञापन';

  @override
  String get premiumFeatureWidgetLabel => 'विजेट से एक नज़र में देखें';

  @override
  String get premiumFeatureWidgetEmphasis => 'विजेट';

  @override
  String get oneTimePurchaseLabel => 'एक बार की खरीद';

  @override
  String get monthlyPlanLabel => 'मासिक';

  @override
  String get recommendedPlanBadgeLabel => 'सबसे फ़ायदेमंद';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/माह';
  }

  @override
  String get monthlySubscriptionDescription => 'कभी भी रद्द करें';

  @override
  String get oneTimePurchaseDescription =>
      'एक बार भुगतान करें, हमेशा इस्तेमाल करें';

  @override
  String get lifetimeSupportPlanLabel => 'एक बार की खरीद + सहयोग';

  @override
  String get lifetimeSupportDescription =>
      'एक बार की खरीद जैसा ही, साथ ही ऐप के विकास में सहयोग';

  @override
  String get purchaseButtonLabel => 'खरीदें';

  @override
  String get storeUnavailableContent => 'स्टोर अभी उपलब्ध नहीं है।';

  @override
  String get purchaseSuccessContent =>
      'धन्यवाद! प्रीमियम सुविधाएँ अब अनलॉक हो गई हैं।';

  @override
  String get purchasePendingContent => 'आपकी खरीद अनुमोदन के लिए लंबित है।';

  @override
  String get purchaseErrorContent =>
      'खरीद पूरी नहीं हो सकी। कृपया फिर से कोशिश करें।';

  @override
  String get restorePurchasesLabel => 'खरीदारी रीस्टोर करें';

  @override
  String get termsOfUseLabel => 'उपयोग की शर्तें';

  @override
  String get todaysMessageHint =>
      'इस पल से ज़्यादा जवान आप फिर कभी नहीं होंगे।';

  @override
  String get shareLabel => 'शेयर करें';

  @override
  String shareMessage(int percentage) {
    return 'मेरी ज़िंदगी का $percentage% बाकी है। आपका कितना है?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'बचा हुआ जीवन';

  @override
  String get shareErrorContent => 'अभी शेयर नहीं किया जा सकता।';

  @override
  String get onboardingBirthDateTitle => 'आपका जन्म कब हुआ था?';

  @override
  String get onboardingBirthDateDescription =>
      'इससे हिसाब लगाया जाता है कि आपका कितना जीवन बाकी है।';

  @override
  String get onboardingContinueLabel => 'जारी रखें';

  @override
  String get onboardingIdealAgeTitle => 'आप कितने साल जीना चाहते हैं?';

  @override
  String get onboardingIdealAgeDescription =>
      'अपना आदर्श चुनें। आप इसे बाद में बदल सकते हैं।';

  @override
  String onboardingResultTitle(int percentage) {
    return 'आपके जीवन का $percentage% बाकी है';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'यानी अभी $days दिन बाकी हैं।';
  }
}
