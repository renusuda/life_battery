import 'dart:async';

import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'battery_label_manager_provider.g.dart';

/// The user-entered label above the battery. Null means the localized
/// default and an empty string hides the label.
@riverpod
class BatteryLabelManager extends _$BatteryLabelManager {
  @override
  Future<String?> build() =>
      ref.watch(lifespanRepositoryProvider).getBatteryLabel();

  Future<void> updateBatteryLabel(String label) async {
    final trimmed = label.trim();
    state = AsyncData(trimmed);
    unawaited(
      ref.read(lifespanRepositoryProvider).updateBatteryLabel(label: trimmed),
    );
  }
}
