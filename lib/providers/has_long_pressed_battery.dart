import 'package:life_battery/repositories/lifespan_repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'has_long_pressed_battery.g.dart';

@riverpod
class HasLongPressedBattery extends _$HasLongPressedBattery {
  static final _lifespanRepository = LifespanRepository();

  @override
  Future<bool> build() => fetchHasLongPressedBattery();

  Future<bool> fetchHasLongPressedBattery() async {
    final response = await _lifespanRepository.getHasLongPressed();
    return response;
  }

  Future<void> updateHasLongPressedBattery() async {
    await _lifespanRepository.updateHasLongPressed();
    state = const AsyncData(true);
  }
}
