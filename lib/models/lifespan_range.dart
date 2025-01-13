import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_battery/utils/extensions.dart';

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
  int remainingLifePercentage({
    required DateTime now,
  }) {
    if (birthDate == null || deathDate == null) {
      return 0;
    }

    final dateOnlyNow = now.toDateOnly;
    final dateOnlyBirthDate = birthDate!.toDateOnly;
    final dateOnlyDeathDate = deathDate!.toDateOnly;

    if (dateOnlyNow.isBefore(dateOnlyBirthDate) ||
        dateOnlyNow.isAfter(dateOnlyDeathDate)) {
      return 0;
    }

    if (dateOnlyNow.year == dateOnlyDeathDate.year &&
        dateOnlyNow.month == dateOnlyDeathDate.month &&
        dateOnlyNow.day == dateOnlyDeathDate.day) {
      return 0;
    }

    final totalLife = dateOnlyDeathDate.difference(dateOnlyBirthDate).inDays;
    final remainingLife = dateOnlyDeathDate.difference(dateOnlyNow).inDays;

    return (remainingLife / totalLife * 100).ceil();
  }
}
