import 'dart:async';

import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:life_battery/src/features/lifespan/use_case/toggle_display_mode_use_case_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'display_mode_manager_provider.g.dart';

/// Manages whether the battery is displayed as a percentage or as remaining
/// days.
@riverpod
class DisplayModeManager extends _$DisplayModeManager {
  @override
  Future<bool> build() async {
    final isPercentageMode = await ref
        .watch(lifespanRepositoryProvider)
        .getIsPercentageMode();
    unawaited(
      ref
          .read(lifespanRepositoryProvider)
          .syncDisplayModeToWidget(
            isPercentageMode: isPercentageMode,
          ),
    );
    return isPercentageMode;
  }

  void toggle() {
    final current = state.value ?? true;
    final next = !current;
    state = AsyncData(next);
    ref.read(toggleDisplayModeUseCaseProvider).execute(isPercentageMode: next);
  }
}
