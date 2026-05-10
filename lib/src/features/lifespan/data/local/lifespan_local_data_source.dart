import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';

abstract interface class LifespanLocalDataSource {
  Future<LifespanRange> getLifespan();

  Future<bool> getIsInitialUser();

  Future<bool> getHasLongPressed();

  Future<bool> getIsPercentageMode();

  Future<void> updateLifespan({
    required DateTime birthDate,
    required int idealAge,
  });

  Future<void> updateUserIsNotInitialUser();

  Future<void> updateIsPercentageMode({required bool isPercentageMode});

  Future<void> updateHasLongPressed();
}
