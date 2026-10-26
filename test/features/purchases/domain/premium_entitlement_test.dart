import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/features/purchases/domain/premium_entitlement.dart';

void main() {
  final now = DateTime(2026, 9, 6);

  test('No purchase is never active', () {
    const entitlement = PremiumEntitlement.none();

    expect(entitlement.isActive(now), isFalse);
  });

  test('Lifetime purchase is always active', () {
    const entitlement = PremiumEntitlement(hasLifetime: true);

    expect(entitlement.isActive(now), isTrue);
  });

  test('Subscription is active before its expiry', () {
    final entitlement = PremiumEntitlement(
      hasLifetime: false,
      subscriptionExpiresAt: now.add(const Duration(days: 1)),
    );

    expect(entitlement.isActive(now), isTrue);
  });

  test('Subscription is inactive at and after its expiry', () {
    final entitlement = PremiumEntitlement(
      hasLifetime: false,
      subscriptionExpiresAt: now,
    );

    expect(entitlement.isActive(now), isFalse);
    expect(entitlement.isActive(now.add(const Duration(days: 1))), isFalse);
  });

  test('Lifetime purchase stays active after the subscription expired', () {
    final entitlement = PremiumEntitlement(
      hasLifetime: true,
      subscriptionExpiresAt: now.subtract(const Duration(days: 1)),
    );

    expect(entitlement.isActive(now), isTrue);
  });

  test('Widget is locked without a purchase or a trial', () {
    const entitlement = PremiumEntitlement.none();

    expect(entitlement.isWidgetUnlocked(now), isFalse);
    expect(entitlement.widgetUnlockExpiresAt(now), isNull);
  });

  test('Widget trial unlocks the widget until its expiry without premium', () {
    final expiresAt = now.add(const Duration(hours: 5));
    final entitlement = PremiumEntitlement(
      hasLifetime: false,
      widgetTrialExpiresAt: expiresAt,
    );

    expect(entitlement.isActive(now), isFalse);
    expect(entitlement.isWidgetUnlocked(now), isTrue);
    expect(entitlement.widgetUnlockExpiresAt(now), expiresAt);
    expect(entitlement.isWidgetUnlocked(expiresAt), isFalse);
    expect(entitlement.widgetUnlockExpiresAt(expiresAt), isNull);
  });

  test('Lifetime purchase outranks the widget trial', () {
    final entitlement = PremiumEntitlement(
      hasLifetime: true,
      widgetTrialExpiresAt: now.add(const Duration(hours: 5)),
    );

    expect(entitlement.isWidgetUnlocked(now), isTrue);
    expect(entitlement.widgetUnlockExpiresAt(now), isNull);
  });

  test('Subscription expiry outranks the widget trial', () {
    final subscriptionExpiresAt = now.add(const Duration(days: 30));
    final entitlement = PremiumEntitlement(
      hasLifetime: false,
      subscriptionExpiresAt: subscriptionExpiresAt,
      widgetTrialExpiresAt: now.add(const Duration(hours: 5)),
    );

    expect(entitlement.widgetUnlockExpiresAt(now), subscriptionExpiresAt);
  });
}
