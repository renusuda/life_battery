import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';

abstract interface class LifespanLocalDataSource {
  Future<LifespanRange> getLifespan();

  Future<String> getThemeMode();

  Future<bool> getIsInitialUser();

  Future<bool> getIsDeletedUser();

  Future<bool> getHasLongPressed();

  Future<bool> getIsPercentageMode();

  Future<void> updateLifespan({
    required DateTime birthDate,
    required int idealAge,
  });

  Future<void> updateThemeMode({required String themeMode});

  Future<void> updateUserIsNotInitialUser();

  Future<void> updateIsPercentageMode({required bool isPercentageMode});

  Future<void> updateHasLongPressed();

  Future<void> deleteAllData();

  bool get isUserDeleted;

  Stream<bool> isUserDeletedStateChanges();
}
