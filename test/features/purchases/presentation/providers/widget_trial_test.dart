import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/purchases/data/entitlements_repository_provider.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/premium_widget_sync_provider.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/widget_trial_provider.dart';

import '../../../../../test_helpers/fake_entitlements.dart';

void main() {
  late FakeEntitlementsLocalDataSource fakeEntitlements;
  late FakeEntitlementsHomeWidgetDataSource fakeWidget;
  late ProviderContainer container;

  setUp(() {
    fakeEntitlements = FakeEntitlementsLocalDataSource();
    fakeWidget = FakeEntitlementsHomeWidgetDataSource();
    container = ProviderContainer(
      overrides: [
        entitlementsLocalDataSourceProvider.overrideWithValue(
          fakeEntitlements,
        ),
        entitlementsHomeWidgetDataSourceProvider.overrideWithValue(fakeWidget),
      ],
    );
    addTearDown(container.dispose);
  });

  test('Starting the trial unlocks the widget right away', () async {
    container.listen(premiumWidgetSyncProvider, (_, _) {});
    await container.read(premiumWidgetSyncProvider.future);
    expect(fakeWidget.syncedValues, [false]);

    await container.read(widgetTrialProvider.notifier).start();
    await container.read(premiumWidgetSyncProvider.future);

    expect(fakeWidget.syncedValues, [false, true]);
    expect(fakeWidget.syncedExpiries.last, isNotNull);
  });

  test('Starting an already started trial does not resync', () async {
    container.listen(premiumWidgetSyncProvider, (_, _) {});
    await container.read(premiumWidgetSyncProvider.future);
    await container.read(widgetTrialProvider.notifier).start();
    await container.read(premiumWidgetSyncProvider.future);
    expect(fakeWidget.syncedValues, [false, true]);

    await container.read(widgetTrialProvider.notifier).start();
    await container.read(premiumWidgetSyncProvider.future);

    expect(fakeWidget.syncedValues, [false, true]);
  });
}
