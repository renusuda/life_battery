import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/models/lifespan_range.dart';

void main() {
  group('Test remainingLifePercentage', () {
    test('returns 0 when now is before birthDate', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(2000),
        deathDate: DateTime(2100),
      );
      expect(
        lifespanRange.remainingLifePercentage(now: DateTime(1900)),
        0,
      );
    });

    test('returns 0 when now is after deathDate', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(2000),
        deathDate: DateTime(2100),
      );
      expect(
        lifespanRange.remainingLifePercentage(now: DateTime(2200)),
        0,
      );
    });

    test(
      'returns 1 when the current date is the day before the death date',
      () {
        final lifespanRange = LifespanRange(
          birthDate: DateTime(2000),
          deathDate: DateTime(2000, 12, 31),
        );
        expect(
          lifespanRange.remainingLifePercentage(now: DateTime(2000, 12, 30)),
          1,
        );
      },
    );

    test('returns 100 when the current date is the birth date', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(2000),
        deathDate: DateTime(2100),
      );
      expect(
        lifespanRange.remainingLifePercentage(now: DateTime(2000)),
        100,
      );
    });

    test('returns 0 when the current date is the death date', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(2000),
        deathDate: DateTime(2100),
      );
      expect(
        lifespanRange.remainingLifePercentage(now: DateTime(2100)),
        0,
      );
    });

    test(
      '''
        returns 0 when the current date, the birth date and the death date are same
        ''',
      () {
        final lifespanRange = LifespanRange(
          birthDate: DateTime(2000),
          deathDate: DateTime(2000),
        );
        expect(
          lifespanRange.remainingLifePercentage(now: DateTime(2000)),
          0,
        );
      },
    );

    test('returns correct value with random dates', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(1984, 4, 7),
        deathDate: DateTime(2120, 9, 8),
      );
      expect(
        lifespanRange.remainingLifePercentage(now: DateTime(2025, 1, 12)),
        71,
      );
    });
  });

  group('Test remainingLifeDays', () {
    test('returns 0 when now is after deathDate', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(2000),
        deathDate: DateTime(2100),
      );
      expect(
        lifespanRange.remainingLifeDays(now: DateTime(2200)),
        0,
      );
    });

    test('returns correct value with random dates', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(1984, 4, 7),
        deathDate: DateTime(2120, 9, 8),
      );
      expect(
        lifespanRange.remainingLifeDays(now: DateTime(2025, 1, 12)),
        34937,
      );
    });
  });
}
