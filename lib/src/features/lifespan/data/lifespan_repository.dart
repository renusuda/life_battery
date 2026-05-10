import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import 'package:life_battery/src/features/lifespan/data/local/lifespan_local_data_source.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';

class LifespanRepository {
  const LifespanRepository({required LifespanLocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  final LifespanLocalDataSource _localDataSource;

  Future<LifespanRange> getLifespan() {
    return _localDataSource.getLifespan();
  }

  Future<bool> getIsInitialUser() {
    return _localDataSource.getIsInitialUser();
  }

  Future<bool> getHasLongPressed() {
    return _localDataSource.getHasLongPressed();
  }

  Future<bool> getIsPercentageMode() {
    return _localDataSource.getIsPercentageMode();
  }

  Future<void> updateLifespan({
    required DateTime birthDate,
    required int idealAge,
  }) {
    return _localDataSource.updateLifespan(
      birthDate: birthDate,
      idealAge: idealAge,
    );
  }

  Future<void> updateUserIsNotInitialUser() {
    return _localDataSource.updateUserIsNotInitialUser();
  }

  Future<void> updateIsPercentageMode({required bool isPercentageMode}) {
    return _localDataSource.updateIsPercentageMode(
      isPercentageMode: isPercentageMode,
    );
  }

  Future<void> updateHasLongPressed() {
    return _localDataSource.updateHasLongPressed();
  }

  Future<void> syncLifespanRangeToWidget({
    required DateTime birthDate,
    required int idealAge,
  }) async {
    try {
      await HomeWidget.saveWidgetData('birthDate', birthDate.toIso8601String());
      await HomeWidget.saveWidgetData('idealAge', idealAge);
      await _updateHomeWidget();
    } on PlatformException catch (_) {
      // Widget sync may fail in test environments.
    }
  }

  Future<void> syncDisplayModeToWidget({
    required bool isPercentageMode,
  }) async {
    try {
      await HomeWidget.saveWidgetData('isPercentageMode', isPercentageMode);
      await _updateHomeWidget();
    } on PlatformException catch (_) {
      // Widget sync may fail in test environments.
    }
  }

  Future<void> _updateHomeWidget() async {
    await HomeWidget.updateWidget(
      name: 'LifeBatteryWidget',
      iOSName: 'LifeBatteryWidget',
      androidName: 'LifeBatteryWidgetReceiver',
    );
  }
}
