// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get generalError => 'Berlaku ralat.';

  @override
  String get birthDateLabel => 'Tarikh lahir';

  @override
  String get idealLifespanLabel => 'Jangka hayat ideal';

  @override
  String idealAgePresetLabel(int age) {
    return '$age tahun';
  }

  @override
  String get ageUnit => 'tahun';

  @override
  String get dayUnit => ' hari';

  @override
  String get reviewAppLabel => 'Nilai aplikasi ini';

  @override
  String get widgetGuideLabel => 'Tambah widget';

  @override
  String get widgetGuideSheetTitle => 'Tambah widget ke Skrin Utama anda';

  @override
  String get widgetGuideDescription =>
      'Lihat baki hidup anda dengan sekali pandang, terus di Skrin Utama.';

  @override
  String get widgetTrialNote => '🎁 Cuba widget secara percuma hari ini.';

  @override
  String get widgetGuideIosStep1 =>
      'Sentuh dan tahan kawasan kosong pada Skrin Utama.';

  @override
  String get widgetGuideIosStep2 =>
      'Ketik Edit di penjuru kiri atas, kemudian ketik Tambah Widget.';

  @override
  String get widgetGuideIosStep3 => 'Cari Life Battery dan tambah widget.';

  @override
  String get widgetGuideAndroidStep1 =>
      'Sentuh dan tahan kawasan kosong pada skrin utama.';

  @override
  String get widgetGuideAndroidStep2 => 'Ketik Widget.';

  @override
  String get widgetGuideAndroidStep3 => 'Cari Life Battery dan tambah widget.';

  @override
  String get privacyPolicyLabel => 'Dasar privasi';

  @override
  String get appearanceLabel => 'Penampilan';

  @override
  String get systemLabel => 'Sistem';

  @override
  String get lightLabel => 'Cerah';

  @override
  String get darkLabel => 'Gelap';

  @override
  String get deleteAllLabel => 'Padam data';

  @override
  String get deleteTitle => 'Padam semua data';

  @override
  String get deleteContent =>
      'Adakah anda pasti mahu memadam data?\nData yang dipadam tidak boleh dipulihkan.';

  @override
  String get cancelLabel => 'Batal';

  @override
  String get deleteLabel => 'Padam';

  @override
  String get userDeletionSuccess =>
      'Data anda telah berjaya dipadam.\nTerima kasih kerana menggunakan aplikasi kami.\nKami harap dapat berjumpa anda lagi.😊';

  @override
  String get notificationSettingsLabel => 'Tetapan pemberitahuan';

  @override
  String notificationTitle(int percentage) {
    return 'Hidup anda berbaki $percentage%.';
  }

  @override
  String get notificationBody => 'Jadikan 1% seterusnya bab terbaik anda!';

  @override
  String get notificationBodyZeroPercent =>
      'Kisah anda terus hidup dalam kisah orang lain. Terima kasih.';

  @override
  String get longPressToEditHint => 'Tekan lama untuk mengedit hidup anda';

  @override
  String get premiumLabel => 'Premium';

  @override
  String get premiumDescriptionContent => 'Buka semua ciri';

  @override
  String get premiumPurchasedLabel => 'Telah dibeli';

  @override
  String get premiumSheetTitle => 'Manfaatkan masa anda sebaiknya';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'Apa yang anda dapat dengan Premium';

  @override
  String get premiumFeatureAdRemovalLabel => 'Sembunyikan semua iklan';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'semua iklan';

  @override
  String get premiumFeatureWidgetLabel =>
      'Semak dengan sekali pandang melalui widget';

  @override
  String get premiumFeatureWidgetEmphasis => 'widget';

  @override
  String get oneTimePurchaseLabel => 'Bayaran sekali';

  @override
  String get monthlyPlanLabel => 'Bulanan';

  @override
  String get recommendedPlanBadgeLabel => 'Nilai terbaik';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/bln';
  }

  @override
  String get monthlySubscriptionDescription => 'Batal bila-bila masa';

  @override
  String get oneTimePurchaseDescription => 'Bayar sekali, guna selama-lamanya';

  @override
  String get lifetimeSupportPlanLabel => 'Bayaran sekali + sokongan';

  @override
  String get lifetimeSupportDescription =>
      'Sama seperti bayaran sekali, serta menyokong pembangunan';

  @override
  String get purchaseButtonLabel => 'Beli';

  @override
  String get storeUnavailableContent => 'Kedai tidak tersedia buat masa ini.';

  @override
  String get purchaseSuccessContent =>
      'Terima kasih! Ciri Premium kini telah dibuka.';

  @override
  String get purchasePendingContent =>
      'Pembelian anda sedang menunggu kelulusan.';

  @override
  String get purchaseErrorContent =>
      'Pembelian tidak dapat diselesaikan. Sila cuba lagi.';

  @override
  String get restorePurchasesLabel => 'Pulihkan pembelian';

  @override
  String get termsOfUseLabel => 'Terma Penggunaan';

  @override
  String get todaysMessageHint => 'Anda tidak akan semuda saat ini lagi.';

  @override
  String get shareLabel => 'Kongsi';

  @override
  String shareMessage(int percentage) {
    return 'Hidup saya berbaki $percentage%. Anda pula?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'Baki hidup';

  @override
  String get shareErrorContent => 'Perkongsian tidak tersedia buat masa ini.';

  @override
  String get onboardingBirthDateTitle => 'Bilakah anda dilahirkan?';

  @override
  String get onboardingBirthDateDescription =>
      'Ini digunakan untuk mengira baki hidup anda.';

  @override
  String get onboardingContinueLabel => 'Teruskan';

  @override
  String get onboardingIdealAgeTitle => 'Berapa lama anda mahu hidup?';

  @override
  String get onboardingIdealAgeDescription =>
      'Pilih umur ideal anda. Anda boleh mengubahnya kemudian.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'Baki hidup anda $percentage%';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'Itu bermakna $days hari lagi.';
  }
}
