import 'package:freezed_annotation/freezed_annotation.dart';

part 'lifespan_range.freezed.dart';
part 'lifespan_range.g.dart';

/// A class that represents the range of a person's lifespan.
@freezed
class LifespanRange with _$LifespanRange {
  /// Constructor
  factory LifespanRange({
    required DateTime birthDate,
    required DateTime deathDate,
  }) = _LifespanRange;

  /// Converts a JSON object to a [LifespanRange] instance.
  factory LifespanRange.fromJson(Map<String, dynamic> json) =>
      _$LifespanRangeFromJson(json);
}
