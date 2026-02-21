import 'dart:async';

import 'package:life_battery/models/lifespan_range.dart';
import 'package:life_battery/repositories/lifespan_repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lifespan_range_manager.g.dart';

/// lifespan range manager
@riverpod
class LifespanRangeManager extends _$LifespanRangeManager {
  /// lifespan repository
  static final _lifespanRepository = LifespanRepository();

  @override
  Future<LifespanRange> build() async {
    final lifespanRange = await fetchLifespanRange();
    unawaited(
      _lifespanRepository.syncWidgetData(
        birthDate: lifespanRange.birthDate,
        idealAge: lifespanRange.idealAge,
      ),
    );
    return lifespanRange;
  }

  /// Fetches the lifespan range from Local Storage.
  Future<LifespanRange> fetchLifespanRange() async {
    final response = await _lifespanRepository.getLifespan();
    return response;
  }

  /// Updates the lifespan range in Local Storage.
  Future<void> updateLifespanRange({
    required DateTime birthDate,
    required int idealAge,
  }) async {
    await _lifespanRepository.updateLifespan(
      birthDate: birthDate,
      idealAge: idealAge,
    );
    final newLifespanRange = await fetchLifespanRange();
    state = AsyncData(newLifespanRange);

    unawaited(
      _lifespanRepository.syncWidgetData(
        birthDate: newLifespanRange.birthDate,
        idealAge: newLifespanRange.idealAge,
      ),
    );
  }
}
