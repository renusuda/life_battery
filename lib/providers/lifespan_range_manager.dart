import 'dart:convert';

import 'package:life_battery/models/lifespan_range.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lifespan_range_manager.g.dart';

/// lifespan range manager
@riverpod
class LifespanRangeManager extends _$LifespanRangeManager {
  @override
  Future<LifespanRange> build() => fetch();

  /// Fetches the lifespan range from Local Storage.
  Future<LifespanRange> fetch() {
    // TODO(me): Fetch the lifespan range from Local Storage
    final response = jsonEncode({
      'birthDate': DateTime(2000).toIso8601String(),
      'deathDate': DateTime(2100).toIso8601String(),
    });
    final json = jsonDecode(response) as Map<String, dynamic>;
    return Future.value(
      LifespanRange.fromJson(json),
    );
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
