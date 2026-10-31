// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get generalError => 'Terjadi kesalahan.';

  @override
  String get birthDateLabel => 'Tanggal lahir';

  @override
  String get idealLifespanLabel => 'Harapan hidup ideal';

  @override
  String idealAgePresetLabel(int age) {
    return '$age tahun';
  }

  @override
  String get ageUnit => 'tahun';

  @override
  String get dayUnit => ' hari';

  @override
  String get reviewAppLabel => 'Beri rating aplikasi ini';

  @override
  String get widgetGuideLabel => 'Tambahkan widget';

  @override
  String get widgetGuideSheetTitle => 'Tambahkan widget ke Layar Utama';

  @override
  String get widgetGuideDescription =>
      'Lihat sisa hidup Anda sekilas, langsung dari Layar Utama.';

  @override
  String get widgetTrialNote => '🎁 Coba widget gratis hari ini.';

  @override
  String get widgetGuideIosStep1 =>
      'Sentuh dan tahan area kosong di Layar Utama.';

  @override
  String get widgetGuideIosStep2 =>
      'Ketuk Edit di pojok kiri atas, lalu ketuk Tambah Widget.';

  @override
  String get widgetGuideIosStep3 => 'Cari Life Battery, lalu tambahkan widget.';

  @override
  String get widgetGuideAndroidStep1 =>
      'Sentuh lama area kosong di layar utama.';

  @override
  String get widgetGuideAndroidStep2 => 'Ketuk Widget.';

  @override
  String get widgetGuideAndroidStep3 =>
      'Cari Life Battery, lalu tambahkan widget.';

  @override
  String get privacyPolicyLabel => 'Kebijakan privasi';

  @override
  String get appearanceLabel => 'Tampilan';

  @override
  String get systemLabel => 'Sistem';

  @override
  String get lightLabel => 'Terang';

  @override
  String get darkLabel => 'Gelap';

  @override
  String get deleteAllLabel => 'Hapus data';

  @override
  String get deleteTitle => 'Hapus semua data';

  @override
  String get deleteContent =>
      'Yakin ingin menghapus data?\nData yang sudah dihapus tidak dapat dikembalikan.';

  @override
  String get cancelLabel => 'Batal';

  @override
  String get deleteLabel => 'Hapus';

  @override
  String get userDeletionSuccess =>
      'Data Anda berhasil dihapus.\nTerima kasih telah menggunakan aplikasi kami.\nSampai jumpa lagi di lain waktu.😊';

  @override
  String get notificationSettingsLabel => 'Pengaturan notifikasi';

  @override
  String notificationTitle(int percentage) {
    return 'Hidup Anda tersisa $percentage%.';
  }

  @override
  String get notificationBody =>
      'Jadikan 1% berikutnya babak terbaik dalam hidup Anda!';

  @override
  String get notificationBodyZeroPercent =>
      'Kisah Anda terus hidup dalam kisah orang lain. Terima kasih.';

  @override
  String get longPressToEditHint => 'Tekan lama untuk mengedit hidup Anda';

  @override
  String get premiumLabel => 'Premium';

  @override
  String get premiumDescriptionContent => 'Buka semua fitur';

  @override
  String get premiumPurchasedLabel => 'Sudah dibeli';

  @override
  String get premiumSheetTitle => 'Manfaatkan waktu Anda sebaik-baiknya';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'Yang Anda dapatkan dengan Premium';

  @override
  String get premiumFeatureAdRemovalLabel => 'Sembunyikan semua iklan';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'semua iklan';

  @override
  String get premiumFeatureWidgetLabel => 'Cek sekilas lewat widget';

  @override
  String get premiumFeatureWidgetEmphasis => 'widget';

  @override
  String get oneTimePurchaseLabel => 'Sekali bayar';

  @override
  String get monthlyPlanLabel => 'Bulanan';

  @override
  String get recommendedPlanBadgeLabel => 'Paling hemat';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/bln';
  }

  @override
  String get monthlySubscriptionDescription => 'Batalkan kapan saja';

  @override
  String get oneTimePurchaseDescription => 'Bayar sekali, pakai selamanya';

  @override
  String get lifetimeSupportPlanLabel => 'Sekali bayar + dukungan';

  @override
  String get lifetimeSupportDescription =>
      'Sama dengan sekali bayar, plus mendukung pengembangan';

  @override
  String get purchaseButtonLabel => 'Beli';

  @override
  String get storeUnavailableContent => 'Toko sedang tidak tersedia saat ini.';

  @override
  String get purchaseSuccessContent =>
      'Terima kasih! Fitur Premium kini sudah terbuka.';

  @override
  String get purchasePendingContent =>
      'Pembelian Anda sedang menunggu persetujuan.';

  @override
  String get purchaseErrorContent =>
      'Pembelian tidak dapat diselesaikan. Silakan coba lagi.';

  @override
  String get restorePurchasesLabel => 'Pulihkan pembelian';

  @override
  String get termsOfUseLabel => 'Ketentuan Penggunaan';

  @override
  String get todaysMessageHint =>
      'Momen ini adalah saat termuda dalam sisa hidup Anda.';

  @override
  String get shareLabel => 'Bagikan';

  @override
  String shareMessage(int percentage) {
    return 'Sisa hidupku $percentage%. Kalau kamu?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'Sisa hidup';

  @override
  String get shareErrorContent => 'Fitur berbagi sedang tidak tersedia.';

  @override
  String get onboardingBirthDateTitle => 'Kapan Anda lahir?';

  @override
  String get onboardingBirthDateDescription =>
      'Ini digunakan untuk menghitung sisa hidup Anda.';

  @override
  String get onboardingContinueLabel => 'Lanjutkan';

  @override
  String get onboardingIdealAgeTitle => 'Ingin hidup sampai usia berapa?';

  @override
  String get onboardingIdealAgeDescription =>
      'Isi sesuai harapan Anda. Bisa diubah nanti.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'Sisa hidup Anda $percentage%';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'Artinya, masih ada $days hari lagi.';
  }
}
