// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get generalError => 'त्रुटी आली.';

  @override
  String get birthDateLabel => 'जन्मतारीख';

  @override
  String get idealLifespanLabel => 'आदर्श आयुर्मान';

  @override
  String idealAgePresetLabel(int age) {
    return '$age वर्षे';
  }

  @override
  String get ageUnit => 'वर्षे';

  @override
  String get dayUnit => ' दिवस';

  @override
  String get reviewAppLabel => 'या ॲपला रेटिंग द्या';

  @override
  String get widgetGuideLabel => 'विजेट समाविष्ट करा';

  @override
  String get widgetGuideSheetTitle =>
      'तुमच्या होम स्क्रीनवर विजेट समाविष्ट करा';

  @override
  String get widgetGuideDescription =>
      'तुमचे किती आयुष्य उरले आहे ते थेट होम स्क्रीनवरच एका नजरेत पाहा.';

  @override
  String get widgetTrialNote => '🎁 आज विजेट मोफत वापरून पाहा.';

  @override
  String get widgetGuideIosStep1 =>
      'होम स्क्रीनवरील रिकाम्या जागेला स्पर्श करून धरून ठेवा.';

  @override
  String get widgetGuideIosStep2 =>
      'वरच्या डाव्या कोपऱ्यातील “संपादित करा” वर टॅप करा, नंतर “विजेट समाविष्ट करा” वर टॅप करा.';

  @override
  String get widgetGuideIosStep3 =>
      'Life Battery सर्च करा आणि विजेट समाविष्ट करा.';

  @override
  String get widgetGuideAndroidStep1 =>
      'होम स्क्रीनवरील रिकाम्या जागेला स्पर्श करून धरून ठेवा.';

  @override
  String get widgetGuideAndroidStep2 => '“विजेट” वर टॅप करा.';

  @override
  String get widgetGuideAndroidStep3 => 'Life Battery शोधा आणि विजेट जोडा.';

  @override
  String get privacyPolicyLabel => 'गोपनीयता धोरण';

  @override
  String get appearanceLabel => 'दिखावट';

  @override
  String get systemLabel => 'सिस्टीम';

  @override
  String get lightLabel => 'लाइट';

  @override
  String get darkLabel => 'गडद';

  @override
  String get deleteAllLabel => 'डेटा डिलीट करा';

  @override
  String get deleteTitle => 'सर्व डेटा डिलीट करा';

  @override
  String get deleteContent =>
      'तुम्हाला खरंच डेटा डिलीट करायचा आहे का?\nडिलीट केलेला डेटा पुन्हा मिळवता येणार नाही.';

  @override
  String get cancelLabel => 'रद्द करा';

  @override
  String get deleteLabel => 'डिलीट करा';

  @override
  String get userDeletionSuccess =>
      'तुमचा डेटा यशस्वीरीत्या डिलीट झाला आहे.\nआमचे ॲप वापरल्याबद्दल धन्यवाद.\nपुन्हा भेटूया अशी आशा आहे.😊';

  @override
  String get notificationSettingsLabel => 'नोटिफिकेशन सेटिंग';

  @override
  String notificationTitle(int percentage) {
    return 'तुमच्या आयुष्याचे $percentage% उरले आहे.';
  }

  @override
  String get notificationBody =>
      'चला, पुढचा 1% तुमचा सर्वात सुंदर अध्याय बनवूया!';

  @override
  String get notificationBodyZeroPercent =>
      'तुमची कथा इतरांच्या कथांमध्ये कायम जिवंत राहील. धन्यवाद.';

  @override
  String get longPressToEditHint => 'आयुष्य संपादित करण्यासाठी लॉंग प्रेस करा';

  @override
  String get premiumLabel => 'प्रीमियम';

  @override
  String get premiumDescriptionContent => 'सर्व फीचर अनलॉक करा';

  @override
  String get premiumPurchasedLabel => 'खरेदी केले';

  @override
  String get premiumSheetTitle => 'तुमच्या वेळेचा पुरेपूर उपयोग करा';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'प्रीमियममध्ये तुम्हाला काय मिळते';

  @override
  String get premiumFeatureAdRemovalLabel => 'सर्व जाहिराती लपवते';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'सर्व जाहिराती';

  @override
  String get premiumFeatureWidgetLabel => 'विजेटवर एका नजरेत पाहा';

  @override
  String get premiumFeatureWidgetEmphasis => 'विजेट';

  @override
  String get oneTimePurchaseLabel => 'एक-वेळ खरेदी';

  @override
  String get monthlyPlanLabel => 'मासिक';

  @override
  String get recommendedPlanBadgeLabel => 'सर्वात फायदेशीर';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/महिना';
  }

  @override
  String get monthlySubscriptionDescription => 'कधीही रद्द करा';

  @override
  String get oneTimePurchaseDescription => 'एकदाच पैसे भरा, कायम वापरा';

  @override
  String get lifetimeSupportPlanLabel => 'एक-वेळ खरेदी + पाठिंबा';

  @override
  String get lifetimeSupportDescription =>
      'एक-वेळ खरेदीसारखेच, शिवाय ॲपच्या विकासाला पाठिंबा';

  @override
  String get purchaseButtonLabel => 'खरेदी करा';

  @override
  String get storeUnavailableContent => 'स्टोअर सध्या उपलब्ध नाही.';

  @override
  String get purchaseSuccessContent =>
      'धन्यवाद! प्रीमियम फीचर आता अनलॉक झाले आहेत.';

  @override
  String get purchasePendingContent => 'तुमची खरेदी मंजुरीसाठी प्रलंबित आहे.';

  @override
  String get purchaseErrorContent =>
      'खरेदी पूर्ण होऊ शकली नाही. कृपया पुन्हा प्रयत्न करा.';

  @override
  String get restorePurchasesLabel => 'खरेदी रीस्टोअर करा';

  @override
  String get termsOfUseLabel => 'वापराच्या अटी';

  @override
  String get todaysMessageHint => 'या क्षणाइतके तरुण तुम्ही पुन्हा कधीच नसाल.';

  @override
  String get shareLabel => 'शेअर करा';

  @override
  String shareMessage(int percentage) {
    return 'माझ्या आयुष्याचे $percentage% उरले आहे. तुमचे किती?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'उरलेले आयुष्य';

  @override
  String get shareErrorContent => 'सध्या शेअर करता येत नाही.';

  @override
  String get onboardingBirthDateTitle => 'तुमचा जन्म कधी झाला?';

  @override
  String get onboardingBirthDateDescription =>
      'तुमचे किती आयुष्य उरले आहे हे मोजण्यासाठी याचा वापर होतो.';

  @override
  String get onboardingContinueLabel => 'चालू ठेवा';

  @override
  String get onboardingIdealAgeTitle => 'तुम्हाला किती वर्षे जगायचे आहे?';

  @override
  String get onboardingIdealAgeDescription =>
      'तुमचा आदर्श निवडा. तुम्ही हे नंतर बदलू शकता.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'तुमच्या आयुष्याचे $percentage% उरले आहे';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'म्हणजे अजून $days दिवस बाकी आहेत.';
  }
}
