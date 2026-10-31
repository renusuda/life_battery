// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get generalError => 'Ocurrió un error.';

  @override
  String get birthDateLabel => 'Fecha de nacimiento';

  @override
  String get idealLifespanLabel => 'Esperanza de vida ideal';

  @override
  String idealAgePresetLabel(int age) {
    return '$age años';
  }

  @override
  String get ageUnit => 'años';

  @override
  String get dayUnit => ' días';

  @override
  String get reviewAppLabel => 'Calificar la app';

  @override
  String get widgetGuideLabel => 'Agregar el widget';

  @override
  String get widgetGuideSheetTitle =>
      'Agrega el widget a tu pantalla de inicio';

  @override
  String get widgetGuideDescription =>
      'Mira de un vistazo cuánta vida te queda, directamente en tu pantalla de inicio.';

  @override
  String get widgetTrialNote => '🎁 Prueba el widget gratis hoy.';

  @override
  String get widgetGuideIosStep1 =>
      'Mantén presionado un espacio vacío de la pantalla de inicio.';

  @override
  String get widgetGuideIosStep2 =>
      'Toca Editar en la esquina superior izquierda y luego toca Agregar widget.';

  @override
  String get widgetGuideIosStep3 => 'Busca Life Battery y agrega el widget.';

  @override
  String get widgetGuideAndroidStep1 =>
      'Mantén presionado un espacio vacío de la pantalla principal.';

  @override
  String get widgetGuideAndroidStep2 => 'Toca Widgets.';

  @override
  String get widgetGuideAndroidStep3 =>
      'Busca Life Battery y agrega el widget.';

  @override
  String get privacyPolicyLabel => 'Política de privacidad';

  @override
  String get appearanceLabel => 'Apariencia';

  @override
  String get systemLabel => 'Sistema';

  @override
  String get lightLabel => 'Claro';

  @override
  String get darkLabel => 'Oscuro';

  @override
  String get deleteAllLabel => 'Eliminar datos';

  @override
  String get deleteTitle => 'Eliminar todos los datos';

  @override
  String get deleteContent =>
      '¿Seguro que quieres eliminar los datos?\nLos datos eliminados no se pueden recuperar.';

  @override
  String get cancelLabel => 'Cancelar';

  @override
  String get deleteLabel => 'Eliminar';

  @override
  String get userDeletionSuccess =>
      'Tus datos se eliminaron correctamente.\nGracias por usar nuestra app.\nEsperamos verte de nuevo algún día.😊';

  @override
  String get notificationSettingsLabel => 'Configuración de notificaciones';

  @override
  String notificationTitle(int percentage) {
    return 'Te queda el $percentage% de tu vida.';
  }

  @override
  String get notificationBody =>
      '¡Haz que el próximo 1% sea tu mejor capítulo!';

  @override
  String get notificationBodyZeroPercent =>
      'Tu historia sigue viva en las historias de los demás. Gracias.';

  @override
  String get longPressToEditHint => 'Mantén presionado para editar tu vida';

  @override
  String get premiumLabel => 'Premium';

  @override
  String get premiumDescriptionContent => 'Desbloquea todas las funciones';

  @override
  String get premiumPurchasedLabel => 'Comprado';

  @override
  String get premiumSheetTitle => 'Aprovecha al máximo tu tiempo';

  @override
  String get fiveStarsLabel => '5 stars';

  @override
  String get premiumFeatureListTitle => 'Lo que obtienes con Premium';

  @override
  String get premiumFeatureAdRemovalLabel => 'Oculta todos los anuncios';

  @override
  String get premiumFeatureAdRemovalEmphasis => 'todos los anuncios';

  @override
  String get premiumFeatureWidgetLabel => 'Todo de un vistazo con el widget';

  @override
  String get premiumFeatureWidgetEmphasis => 'widget';

  @override
  String get oneTimePurchaseLabel => 'Pago único';

  @override
  String get monthlyPlanLabel => 'Mensual';

  @override
  String get recommendedPlanBadgeLabel => 'Recomendado';

  @override
  String monthlyPriceLabel(String price) {
    return '$price/mes';
  }

  @override
  String get monthlySubscriptionDescription => 'Cancela cuando quieras';

  @override
  String get oneTimePurchaseDescription => 'Paga una vez y úsala para siempre';

  @override
  String get lifetimeSupportPlanLabel => 'Pago único + apoyo';

  @override
  String get lifetimeSupportDescription =>
      'Igual que el pago único, y además apoyas el desarrollo';

  @override
  String get purchaseButtonLabel => 'Comprar';

  @override
  String get storeUnavailableContent =>
      'La tienda no está disponible en este momento.';

  @override
  String get purchaseSuccessContent =>
      '¡Gracias! Las funciones Premium ya están desbloqueadas.';

  @override
  String get purchasePendingContent =>
      'Tu compra está pendiente de aprobación.';

  @override
  String get purchaseErrorContent =>
      'No se pudo completar la compra. Inténtalo de nuevo.';

  @override
  String get restorePurchasesLabel => 'Restaurar compras';

  @override
  String get termsOfUseLabel => 'Términos de uso';

  @override
  String get todaysMessageHint =>
      'Nunca volverás a ser tan joven como en este momento.';

  @override
  String get shareLabel => 'Compartir';

  @override
  String shareMessage(int percentage) {
    return 'Me queda el $percentage% de mi vida. ¿Y a ti?';
  }

  @override
  String get shareHashtag => '#LifeBattery';

  @override
  String get shareCardAppName => 'Life Battery';

  @override
  String get shareCardCaption => 'Vida restante';

  @override
  String get shareErrorContent => 'No se puede compartir en este momento.';

  @override
  String get onboardingBirthDateTitle => '¿Cuándo naciste?';

  @override
  String get onboardingBirthDateDescription =>
      'Se usa para calcular cuánta vida te queda.';

  @override
  String get onboardingContinueLabel => 'Continuar';

  @override
  String get onboardingIdealAgeTitle => '¿Hasta qué edad quieres vivir?';

  @override
  String get onboardingIdealAgeDescription =>
      'Elige tu ideal. Puedes cambiarlo después.';

  @override
  String onboardingResultTitle(int percentage) {
    return 'Te queda el $percentage% de tu vida';
  }

  @override
  String onboardingResultDescription(String days) {
    return 'Es decir, te quedan $days días.';
  }
}
