import 'dart:convert';

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
    // TODO(me): Update the lifespan range in Local Storage
    final response = jsonEncode({
      'birthDate': birthDate.toIso8601String(),
      'deathDate': deathDate.toIso8601String(),
    });
    final json = jsonDecode(response) as Map<String, dynamic>;
    state = AsyncData(
      LifespanRange.fromJson(json),
    );
  }
}
