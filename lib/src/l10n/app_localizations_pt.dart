// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get generalError => 'Ocorreu um erro.';

  @override
  String get birthDateLabel => 'Data de nascimento';

  @override
  String get idealLifespanLabel => 'Expectativa de vida ideal';

  @override
  String idealAgePresetLabel(int age) {
    return '$age anos';
  }

  @override
  String get ageUnit => 'anos';

  @override
  String get dayUnit => ' dias';

  @override
  String get reviewAppLabel => 'Avaliar o app';

  @override
  String get widgetGuideLabel => 'Adicionar o widget';

  @override
  String get widgetGuideSheetTitle => 'Adicione o widget à sua Tela de Início';

  @override
  String get widgetGuideDescription =>
      'Veja de relance quanto da sua vida ainda resta, direto na Tela de Início.';

  @override
  String get widgetTrialNote => '🎁 Experimente o widget de graça hoje.';

  @override
  String get widgetGuideIosStep1 =>
      'Toque e mantenha pressionado um espaço vazio da Tela de Início.';

  @override
  String get widgetGuideIosStep2 =>
      'Toque em Editar no canto superior esquerdo e depois em Adicionar Widget.';

  @override
  String get widgetGuideIosStep3 => 'Busque Life Battery e adicione o widget.';

  @override
  String get widgetGuideAndroidStep1 =>
      'Toque e mantenha pressionado um espaço vazio da tela inicial.';

  @override
  String get widgetGuideAndroidStep2 => 'Toque em Widgets.';

  @override
  String get widgetGuideAndroidStep3 =>
      'Pesquise Life Battery e adicione o widget.';

  @override
  String get privacyPolicyLabel => 'Política de privacidade';

  @override
  String get appearanceLabel => 'Aparência';

  @override
  String get systemLabel => 'Sistema';

  @override
  String get lightLabel => 'Claro';

  @override
  String get darkLabel => 'Escuro';

  @override
  String get deleteAllLabel => 'Apagar dados';

  @override
  String get deleteTitle => 'Apagar todos os dados';

  @override
  String get deleteContent =>
      'Tem certeza de que deseja apagar os dados?\nOs dados apagados não podem ser recuperados.';

  @override
  String get cancelLabel => 'Cancelar';

  @override
  String get deleteLabel => 'Apagar';

  @override
  String get userDeletionSuccess =>
      'Seus dados foram apagados.\nObrigado por usar nosso app.\nEsperamos ver você de novo um dia.😊';

  @override
  String get notificationSettingsLabel => 'Configurações de notificação';

  @override
  String notificationTitle(int percentage) {
    return 'Resta $percentage% da sua vida.';
  }

  @override
  String get notificationBody => 'Faça do próximo 1% o seu melhor capítulo!';

  @override
  String get notificationBodyZeroPercent =>
      'Sua história continua viva nas histórias de outras pessoas. Obrigado.';

  @override
  String get longPressToEditHint => 'Mantenha pressionado para editar sua vida';

  @override
  String get premiumLabel => 'Premium';

  @override
  String get premiumDescriptionContent => 'Desbloqueie todos os recursos';

  @override
  String get premiumPurchasedLabel => 'Comprado';

  @override
  String get premiumSheetTitle => 'Aproveite ao máximo o seu tempo';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'O que você ganha com o Premium';

  @override
  String get premiumFeatureAdRemovalLabel => 'Oculte todos os anúncios';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'todos os anúncios';

  @override
  String get premiumFeatureWidgetLabel => 'Veja tudo de relance com o widget';

  @override
  String get premiumFeatureWidgetEmphasis => 'widget';

  @override
  String get oneTimePurchaseLabel => 'Pagamento único';

  @override
  String get monthlyPlanLabel => 'Mensal';

  @override
  String get recommendedPlanBadgeLabel => 'Recomendado';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/mês';
  }

  @override
  String get monthlySubscriptionDescription => 'Cancele quando quiser';

  @override
  String get oneTimePurchaseDescription => 'Pague uma vez e use para sempre';

  @override
  String get lifetimeSupportPlanLabel => 'Pagamento único + apoio';

  @override
  String get lifetimeSupportDescription =>
      'O mesmo que o pagamento único, e você ainda apoia o desenvolvimento';

  @override
  String get purchaseButtonLabel => 'Comprar';

  @override
  String get storeUnavailableContent =>
      'A loja não está disponível no momento.';

  @override
  String get purchaseSuccessContent =>
      'Obrigado! Os recursos Premium já estão liberados.';

  @override
  String get purchasePendingContent => 'Sua compra está aguardando aprovação.';

  @override
  String get purchaseErrorContent =>
      'Não foi possível concluir a compra. Tente novamente.';

  @override
  String get restorePurchasesLabel => 'Restaurar compras';

  @override
  String get termsOfUseLabel => 'Termos de uso';

  @override
  String get todaysMessageHint =>
      'Você nunca mais será tão jovem quanto agora.';

  @override
  String get shareLabel => 'Compartilhar';

  @override
  String shareMessage(int percentage) {
    return 'Ainda me resta $percentage% de vida. E você?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'Vida restante';

  @override
  String get shareErrorContent => 'Não é possível compartilhar no momento.';

  @override
  String get onboardingBirthDateTitle => 'Quando você nasceu?';

  @override
  String get onboardingBirthDateDescription =>
      'Usamos isso para calcular quanto da sua vida ainda resta.';

  @override
  String get onboardingContinueLabel => 'Continuar';

  @override
  String get onboardingIdealAgeTitle => 'Até que idade você quer viver?';

  @override
  String get onboardingIdealAgeDescription =>
      'Escolha a sua idade ideal. Você pode mudar depois.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'Resta $percentage% da sua vida';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'Ou seja, você ainda tem $days dias pela frente.';
  }
}
