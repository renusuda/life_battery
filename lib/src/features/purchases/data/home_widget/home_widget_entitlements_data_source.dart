import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import 'package:life_battery/src/features/purchases/data/home_widget/entitlements_home_widget_data_source.dart';

class HomeWidgetEntitlementsDataSource
    implements EntitlementsHomeWidgetDataSource {
  const HomeWidgetEntitlementsDataSource();

  @override
  Future<void> syncWidgetUnlock({
    required bool isUnlocked,
    required DateTime? expiresAt,
  }) async {
    try {
      // Read by the widget extension to decide between the battery view
      // and the locked view.
      await HomeWidget.saveWidgetData('isWidgetUnlocked', isUnlocked);
      // null removes the key, so a lifetime purchase clears any old expiry.
      await HomeWidget.saveWidgetData(
        'widgetUnlockExpiresAt',
        expiresAt?.millisecondsSinceEpoch,
      );
      await HomeWidget.updateWidget(
        name: 'LifeBatteryWidget',
        iOSName: 'LifeBatteryWidget',
        androidName: 'LifeBatteryWidgetReceiver',
      );
    } on PlatformException catch (_) {
      // Widget sync may fail in test environments.
    }
  }
}
