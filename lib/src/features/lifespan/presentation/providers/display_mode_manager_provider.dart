import 'dart:async';

import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'display_mode_manager_provider.g.dart';

/// Manages whether the battery is displayed as a percentage or as remaining
/// days.
@riverpod
class DisplayModeManager extends _$DisplayModeManager {
  @override
  Future<bool> build() async {
    final isPercentageMode = await _fetchIsPercentageMode();
    unawaited(
      ref
          .read(lifespanRepositoryProvider)
          .syncDisplayModeToWidget(
            isPercentageMode: isPercentageMode,
          ),
    );
    return isPercentageMode;
  }

  /// Fetches whether the battery is shown in percentage mode.
  Future<bool> _fetchIsPercentageMode() async {
    final response = await ref
        .read(lifespanRepositoryProvider)
        .getIsPercentageMode();
    return response;
  }

  /// Toggles the display mode and persists the new value.
  Future<void> toggle() async {
    final current = state.value ?? true;
    final next = !current;
    state = AsyncData(next);
    await ref
        .read(lifespanRepositoryProvider)
        .updateIsPercentageMode(isPercentageMode: next);
    unawaited(
      ref
          .read(lifespanRepositoryProvider)
          .syncDisplayModeToWidget(isPercentageMode: next),
    );
  }
}
