import 'dart:convert';

import 'package:life_battery/models/lifespan_range.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lifespan_range_manager.g.dart';

/// life span range manager
@riverpod
class LifespanRangeManager extends _$LifespanRangeManager {
  @override
  Future<LifespanRange> build() => fetch();

  /// Fetches the life span range from Local Storage.
  Future<LifespanRange> fetch() {
    // TODO(me): Fetch the life span range from Local Storage
    final response = jsonEncode({
      'birthDate': DateTime(2000).toIso8601String(),
      'deathDate': DateTime(2100).toIso8601String(),
    });
    final json = jsonDecode(response) as Map<String, dynamic>;
    return Future.value(
      LifespanRange.fromJson(json),
    );
  }
}
