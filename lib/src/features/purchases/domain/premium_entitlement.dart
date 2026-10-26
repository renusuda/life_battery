/// The stored premium entitlement.
///
/// The lifetime purchase and the subscription are tracked independently;
/// either one grants the premium features.
class PremiumEntitlement {
  const PremiumEntitlement({
    required this.hasLifetime,
    this.subscriptionExpiresAt,
    this.widgetTrialExpiresAt,
  });

  const PremiumEntitlement.none() : this(hasLifetime: false);

  /// Whether the one-time lifetime purchase was made.
  final bool hasLifetime;

  /// Locally estimated expiry of the latest known subscription renewal;
  /// null when the user never subscribed.
  final DateTime? subscriptionExpiresAt;

  /// End of the free widget trial granted during onboarding; null when it
  /// never started. The trial unlocks only the widget, not ad removal, so
  /// it is kept apart from [isActive].
  final DateTime? widgetTrialExpiresAt;

  /// Whether the entitlement grants premium at [now].
  bool isActive(DateTime now) {
    if (hasLifetime) return true;
    final expiresAt = subscriptionExpiresAt;
    return expiresAt != null && now.isBefore(expiresAt);
  }

  /// Whether the home screen widget is unlocked at [now].
  bool isWidgetUnlocked(DateTime now) {
    if (isActive(now)) return true;
    final expiresAt = widgetTrialExpiresAt;
    return expiresAt != null && now.isBefore(expiresAt);
  }

  /// When the widget unlock ends; null when it never ends or is locked.
  DateTime? widgetUnlockExpiresAt(DateTime now) {
    if (hasLifetime) return null;
    if (isActive(now)) return subscriptionExpiresAt;
    return isWidgetUnlocked(now) ? widgetTrialExpiresAt : null;
  }
}
