import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/models/lifespan_range.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lifespan_range.g.dart';

/// A provider that fetches the life span range from Local Storage.
@riverpod
Future<LifespanRange> lifespanRange(Ref ref) {
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
