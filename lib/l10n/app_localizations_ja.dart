// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get generalError => 'エラーが発生しました。';

  @override
  String get birthDateLabel => '生年月日';

  @override
  String get idealLifespanLabel => '理想の寿命';

  @override
  String get ageUnit => '歳';

  @override
  String get dayUnit => '日';

  @override
  String get reviewAppLabel => 'アプリをレビューする';

  @override
  String get privacyPolicyLabel => 'プライバシーポリシー';

  @override
  String get appearanceLabel => '表示モード';

  @override
  String get systemLabel => 'システム';

  @override
  String get lightLabel => 'ライト';

  @override
  String get darkLabel => 'ダーク';

  @override
  String get deleteAllLabel => 'データを削除';

  @override
  String get deleteTitle => '全てのデータを削除';

  @override
  String get deleteContent => '本当にデータを削除しますか？\n一度削除されたデータは元に戻すことができません。';

  @override
  String get cancelLabel => 'キャンセル';

  @override
  String get deleteLabel => '削除';

  @override
  String get userDeletionSuccess =>
      'データを削除できました。\nアプリを使用してくださりありがとうございます。\nまたいつかお会いしましょう😊';
}
