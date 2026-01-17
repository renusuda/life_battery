import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_battery/utils/extensions.dart';

part 'lifespan_range.freezed.dart';
part 'lifespan_range.g.dart';

/// A class that represents the range of a person's lifespan.
@freezed
abstract class LifespanRange with _$LifespanRange {
  factory LifespanRange({
    required DateTime birthDate,
    required int idealAge,
  }) = _LifespanRange;

  const LifespanRange._();

  /// Converts a JSON object to a [LifespanRange] instance.
  factory LifespanRange.fromJson(Map<String, dynamic> json) =>
      _$LifespanRangeFromJson(json);

  /// Returns the calculated death date based on birthDate and idealAge.
  DateTime get deathDate => DateTime(
        birthDate.year + idealAge,
        birthDate.month,
        birthDate.day,
      );

  /// Returns the remaining life percentage.
  int remainingLifePercentage({
    required DateTime now,
  }) {
    final dateOnlyNow = now.toDateOnly;
    final dateOnlyBirthDate = birthDate.toDateOnly;
    final dateOnlyDeathDate = deathDate.toDateOnly;

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

  /// Returns the remaining life days.
  int remainingLifeDays({
    required DateTime now,
  }) {
    final dateOnlyNow = now.toDateOnly;
    final dateOnlyDeathDate = deathDate.toDateOnly;

    if (dateOnlyNow.isAfter(dateOnlyDeathDate)) {
      return 0;
    }

    return dateOnlyDeathDate.difference(dateOnlyNow).inDays;
  }
}
