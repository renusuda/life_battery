import 'package:freezed_annotation/freezed_annotation.dart';

part 'lifespan_range.freezed.dart';
part 'lifespan_range.g.dart';

/// A class that represents the range of a person's lifespan.
@freezed
class LifespanRange with _$LifespanRange {
  /// Constructor
  factory LifespanRange({
    required DateTime? birthDate,
    required DateTime? deathDate,
  }) = _LifespanRange;

  const LifespanRange._();

  /// Converts a JSON object to a [LifespanRange] instance.
  factory LifespanRange.fromJson(Map<String, dynamic> json) =>
      _$LifespanRangeFromJson(json);

  /// Returns the remaining life percentage.
  int get remainingLifePercentage {
    if (birthDate == null || deathDate == null) {
      return 0;
    }

    final now = DateTime.now();
    if (now.isBefore(birthDate!) || now.isAfter(deathDate!)) {
      return 0;
    }

    final totalLife = deathDate!.difference(birthDate!).inDays;
    final remainingLife = deathDate!.difference(now).inDays;

    return (remainingLife / totalLife * 100).round();
  }
}
