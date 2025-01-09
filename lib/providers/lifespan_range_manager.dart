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
  Future<LifespanRange> build() => fetchLifespanRange();

  /// Fetches the lifespan range from Local Storage.
  Future<LifespanRange> fetchLifespanRange() async {
    final response = await _lifespanRepository.getLifespan();
    return response;
  }

  /// Updates the lifespan range in Local Storage.
  Future<void> updateLifespanRange({
    required DateTime birthDate,
    required DateTime deathDate,
  }) async {
    await _lifespanRepository.updateLifespan(
      birthDate: birthDate,
      deathDate: deathDate,
    );
    final newLifespanRange = await fetchLifespanRange();
    state = AsyncData(newLifespanRange);
  }
}
