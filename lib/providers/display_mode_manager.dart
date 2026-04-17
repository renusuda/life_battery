import 'package:life_battery/repositories/lifespan_repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'display_mode_manager.g.dart';

/// Manages whether the battery is displayed as a percentage or as remaining
/// days.
@riverpod
class DisplayModeManager extends _$DisplayModeManager {
  static final _lifespanRepository = LifespanRepository();

  @override
  Future<bool> build() => fetchIsPercentageMode();

  /// Fetches whether the battery is shown in percentage mode.
  Future<bool> fetchIsPercentageMode() async {
    final response = await _lifespanRepository.getIsPercentageMode();
    return response;
  }

  /// Toggles the display mode and persists the new value.
  Future<void> toggle() async {
    final current = state.value ?? true;
    final next = !current;
    state = AsyncData(next);
    await _lifespanRepository.updateIsPercentageMode(
      isPercentageMode: next,
    );
  }
}
