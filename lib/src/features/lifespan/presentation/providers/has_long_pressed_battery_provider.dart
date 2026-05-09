import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'has_long_pressed_battery_provider.g.dart';

@riverpod
class HasLongPressedBattery extends _$HasLongPressedBattery {
  @override
  Future<bool> build() =>
      ref.watch(lifespanRepositoryProvider).getHasLongPressed();

  Future<void> updateHasLongPressedBattery() async {
    await ref.read(lifespanRepositoryProvider).updateHasLongPressed();
    ref.invalidateSelf();
  }
}
