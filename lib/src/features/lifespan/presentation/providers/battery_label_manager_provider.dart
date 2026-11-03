import 'dart:async';

import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'battery_label_manager_provider.g.dart';

/// The user-entered label above the battery. Null means the localized
/// default and an empty string hides the label.
@riverpod
class BatteryLabelManager extends _$BatteryLabelManager {
  @override
  Future<String?> build() async {
    final label = await ref.watch(lifespanRepositoryProvider).getBatteryLabel();
    unawaited(
      ref
          .read(lifespanRepositoryProvider)
          .syncBatteryLabelToWidget(label: label),
    );
    return label;
  }

  Future<void> updateBatteryLabel(String label) async {
    final trimmed = label.trim();
    state = AsyncData(trimmed);
    final repository = ref.read(lifespanRepositoryProvider);
    unawaited(repository.updateBatteryLabel(label: trimmed));
    unawaited(repository.syncBatteryLabelToWidget(label: trimmed));
  }
}
