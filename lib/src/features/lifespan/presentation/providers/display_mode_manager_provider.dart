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
    final isPercentageMode = await _fetch();
    unawaited(
      ref
          .read(lifespanRepositoryProvider)
          .syncDisplayModeToWidget(
            isPercentageMode: isPercentageMode,
          ),
    );
    return isPercentageMode;
  }

  Future<bool> _fetch() async {
    return ref.watch(lifespanRepositoryProvider).getIsPercentageMode();
  }

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
