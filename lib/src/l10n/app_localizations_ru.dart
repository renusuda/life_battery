// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get generalError => 'Произошла ошибка.';

  @override
  String get birthDateLabel => 'Дата рождения';

  @override
  String get idealLifespanLabel => 'Желаемая продолжительность жизни';

  @override
  String idealAgePresetLabel(int age) {
    return '$age лет';
  }

  @override
  String get ageUnit => 'лет';

  @override
  String get dayUnit => ' дн.';

  @override
  String get reviewAppLabel => 'Оценить приложение';

  @override
  String get widgetGuideLabel => 'Добавить виджет';

  @override
  String get widgetGuideSheetTitle => 'Добавьте виджет на экран «Домой»';

  @override
  String get widgetGuideDescription =>
      'Следите за тем, сколько жизни осталось, прямо на экране «Домой».';

  @override
  String get widgetTrialNote =>
      '🎁 Сегодня виджет можно попробовать бесплатно.';

  @override
  String get widgetGuideIosStep1 =>
      'Нажмите и удерживайте пустое место на экране «Домой».';

  @override
  String get widgetGuideIosStep2 =>
      'Коснитесь «Изменить» в левом верхнем углу, затем — «Добавить виджет».';

  @override
  String get widgetGuideIosStep3 => 'Найдите Life Battery и добавьте виджет.';

  @override
  String get widgetGuideAndroidStep1 =>
      'Нажмите и удерживайте пустое место на главном экране.';

  @override
  String get widgetGuideAndroidStep2 => 'Нажмите «Виджеты».';

  @override
  String get widgetGuideAndroidStep3 =>
      'Найдите Life Battery и добавьте виджет.';

  @override
  String get privacyPolicyLabel => 'Политика конфиденциальности';

  @override
  String get appearanceLabel => 'Оформление';

  @override
  String get systemLabel => 'Как в системе';

  @override
  String get lightLabel => 'Светлое';

  @override
  String get darkLabel => 'Тёмное';

  @override
  String get deleteAllLabel => 'Удалить данные';

  @override
  String get deleteTitle => 'Удалить все данные';

  @override
  String get deleteContent =>
      'Вы уверены, что хотите удалить данные?\nУдалённые данные нельзя восстановить.';

  @override
  String get cancelLabel => 'Отменить';

  @override
  String get deleteLabel => 'Удалить';

  @override
  String get userDeletionSuccess =>
      'Ваши данные удалены.\nСпасибо, что пользовались нашим приложением.\nНадеемся когда-нибудь увидеть вас снова.😊';

  @override
  String get notificationSettingsLabel => 'Настройки уведомлений';

  @override
  String notificationTitle(int percentage) {
    return 'У вас осталось $percentage% жизни.';
  }

  @override
  String get notificationBody =>
      'Пусть следующий 1% станет лучшей главой вашей жизни!';

  @override
  String get notificationBodyZeroPercent =>
      'Ваша история продолжает жить в историях других людей. Спасибо.';

  @override
  String get longPressToEditHint => 'Удерживайте, чтобы изменить свою жизнь';

  @override
  String get premiumLabel => 'Premium';

  @override
  String get premiumDescriptionContent => 'Откройте все функции';

  @override
  String get premiumPurchasedLabel => 'Куплено';

  @override
  String get premiumSheetTitle => 'Цените оставшееся время';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'Что даёт Premium';

  @override
  String get premiumFeatureAdRemovalLabel => 'Скрывает всю рекламу';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'всю рекламу';

  @override
  String get premiumFeatureWidgetLabel =>
      'Всё видно с одного взгляда в виджете';

  @override
  String get premiumFeatureWidgetEmphasis => 'виджете';

  @override
  String get oneTimePurchaseLabel => 'Разовая покупка';

  @override
  String get monthlyPlanLabel => 'Ежемесячно';

  @override
  String get recommendedPlanBadgeLabel => 'Выгоднее всего';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/мес.';
  }

  @override
  String get monthlySubscriptionDescription => 'Отмена в любое время';

  @override
  String get oneTimePurchaseDescription =>
      'Платите один раз — пользуйтесь всегда';

  @override
  String get lifetimeSupportPlanLabel => 'Разовая + поддержка';

  @override
  String get lifetimeSupportDescription =>
      'То же, что разовая покупка, плюс поддержка разработки';

  @override
  String get purchaseButtonLabel => 'Купить';

  @override
  String get storeUnavailableContent => 'Магазин сейчас недоступен.';

  @override
  String get purchaseSuccessContent =>
      'Спасибо! Функции Premium разблокированы.';

  @override
  String get purchasePendingContent => 'Покупка ожидает подтверждения.';

  @override
  String get purchaseErrorContent =>
      'Не удалось завершить покупку. Попробуйте ещё раз.';

  @override
  String get restorePurchasesLabel => 'Восстановить покупки';

  @override
  String get termsOfUseLabel => 'Условия использования';

  @override
  String get todaysMessageHint =>
      'Моложе, чем сейчас, вы уже никогда не будете.';

  @override
  String get shareLabel => 'Поделиться';

  @override
  String shareMessage(int percentage) {
    return 'Мне осталось $percentage% жизни. А тебе?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'Осталось жизни';

  @override
  String get shareErrorContent => 'Сейчас поделиться невозможно.';

  @override
  String get onboardingBirthDateTitle => 'Когда вы родились?';

  @override
  String get onboardingBirthDateDescription =>
      'Это нужно, чтобы рассчитать, сколько жизни у вас осталось.';

  @override
  String get onboardingContinueLabel => 'Продолжить';

  @override
  String get onboardingIdealAgeTitle => 'До скольких лет вы хотите прожить?';

  @override
  String get onboardingIdealAgeDescription =>
      'Укажите желаемый возраст. Его можно изменить позже.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'У вас осталось $percentage% жизни';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'Осталось дней: $days.';
  }
}
