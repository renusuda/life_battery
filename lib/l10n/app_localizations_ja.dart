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
  String get dayUnit => '日';

  @override
  String get tutorialLabel => 'アプリの使い方';

  @override
  String get reviewAppLabel => 'アプリをレビューする';

  @override
  String get firstTutorialPageTitle => '日付入力';

  @override
  String get firstTutorialPageBody => 'アプリを使うには、あなたの生年月日と目標とする寿命を設定しましょう。';

  @override
  String get secondTutorialPageTitle => '人生の時間を可視化';

  @override
  String get secondTutorialPageBody =>
      '入力した情報をもとに、残りの時間を%で表示します。\nバッテリーアイコンをタップすると、残りの日数も確認できます。';

  @override
  String get thirdTutorialPageTitle => '日付情報の更新方法';

  @override
  String get thirdTutorialPageBody => 'バッテリーアイコンを長押しすると、日付入力画面が再度開きます。';

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
