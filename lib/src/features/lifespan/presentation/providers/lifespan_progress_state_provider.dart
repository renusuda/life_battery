import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/display_mode_manager_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/has_long_pressed_battery_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/is_initial_user_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_range_manager_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lifespan_progress_state_provider.g.dart';

typedef LifespanProgressState = ({
  bool isInitialUser,
  LifespanRange lifespanRange,
  bool hasLongPressedBattery,
  bool isPercentageMode,
});

@riverpod
Future<LifespanProgressState> lifespanProgressState(Ref ref) async {
  final (
    isInitialUser,
    lifespanRange,
    hasLongPressedBattery,
    isPercentageMode,
  ) = await (
    ref.watch(isInitialUserProvider.future),
    ref.watch(lifespanRangeManagerProvider.future),
    ref.watch(hasLongPressedBatteryProvider.future),
    ref.watch(displayModeManagerProvider.future),
  ).wait;
  return (
    isInitialUser: isInitialUser,
    lifespanRange: lifespanRange,
    hasLongPressedBattery: hasLongPressedBattery,
    isPercentageMode: isPercentageMode,
  );
}
