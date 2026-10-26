import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/src/features/purchases/data/entitlements_repository.dart';
import 'package:life_battery/src/features/purchases/domain/premium_entitlement.dart';

import '../../../../test_helpers/fake_entitlements.dart';

void main() {
  late FakeEntitlementsLocalDataSource fakeLocal;
  late FakeEntitlementsHomeWidgetDataSource fakeWidget;
  late EntitlementsRepository repository;

  final now = DateTime(2026, 10, 26, 15, 30);

  setUp(() {
    fakeLocal = FakeEntitlementsLocalDataSource();
    fakeWidget = FakeEntitlementsHomeWidgetDataSource();
    repository = EntitlementsRepository(
      localDataSource: fakeLocal,
      homeWidgetDataSource: fakeWidget,
    );
  });

  test('Starts the widget trial until the end of the local day', () async {
    final started = await repository.startWidgetTrialIfNeeded(now: now);

    expect(started, isTrue);
    expect(fakeLocal.entitlement.widgetTrialExpiresAt, DateTime(2026, 10, 27));
    expect(fakeLocal.entitlement.isActive(now), isFalse);
  });

  test('Starts the widget trial only once', () async {
    await repository.startWidgetTrialIfNeeded(now: now);
    final expiresAt = fakeLocal.entitlement.widgetTrialExpiresAt;

    final startedAgain = await repository.startWidgetTrialIfNeeded(
      now: now.add(const Duration(days: 3)),
    );

    expect(startedAgain, isFalse);
    expect(fakeLocal.entitlement.widgetTrialExpiresAt, expiresAt);
  });

  test('Skips the widget trial when premium is held', () async {
    fakeLocal.isPremium = true;

    final started = await repository.startWidgetTrialIfNeeded(now: now);

    expect(started, isFalse);
    expect(fakeLocal.entitlement.widgetTrialExpiresAt, isNull);
  });

  test('Syncs the trial expiry to the widget', () async {
    final expiresAt = DateTime.now().add(const Duration(hours: 5));
    fakeLocal.entitlement = PremiumEntitlement(
      hasLifetime: false,
      widgetTrialExpiresAt: expiresAt,
    );

    await repository.syncEntitlementToWidget();

    expect(fakeWidget.syncedValues, [true]);
    expect(fakeWidget.syncedExpiries, [expiresAt]);
  });
}
