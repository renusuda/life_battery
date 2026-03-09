import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/models/lifespan_range.dart';

void main() {
  group('Test remainingLifePercentage', () {
    test('returns 0 when now is before birthDate', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(2000),
        idealAge: 100,
      );
      expect(
        lifespanRange.remainingLifePercentage(now: DateTime(1900)),
        0,
      );
    });

    test('returns 0 when now is after deathDate', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(2000),
        idealAge: 100,
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
          idealAge: 1,
        );
        expect(
          lifespanRange.remainingLifePercentage(now: DateTime(2000, 12, 31)),
          1,
        );
      },
    );

    test('returns 100 when the current date is the birth date', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(2000),
        idealAge: 100,
      );
      expect(
        lifespanRange.remainingLifePercentage(now: DateTime(2000)),
        100,
      );
    });

    test('returns 0 when the current date is the death date', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(2000),
        idealAge: 100,
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
          idealAge: 0,
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
        idealAge: 136,
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
        idealAge: 100,
      );
      expect(
        lifespanRange.remainingLifeDays(now: DateTime(2200)),
        0,
      );
    });

    test('returns correct value with random dates', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(1984, 4, 7),
        idealAge: 136,
      );
      expect(
        lifespanRange.remainingLifeDays(now: DateTime(2025, 1, 12)),
        34783,
      );
    });
  });

  group('Test nextDropDate', () {
    test('returns null when idealAge is 0', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(2000),
        idealAge: 0,
      );
      expect(
        lifespanRange.nextDropDate(now: DateTime(2000)),
        isNull,
      );
    });

    test('returns null when now is after deathDate', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(2000),
        idealAge: 100,
      );
      expect(
        lifespanRange.nextDropDate(now: DateTime(2200)),
        isNull,
      );
    });

    test('returns correct next drop date', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(2000),
        idealAge: 1,
      );
      final now = DateTime(2000, 7);
      expect(
        lifespanRange.nextDropDate(now: now),
        DateTime(2000, 7, 2),
      );
    });

    test('returns correct next drop date with realistic lifespan', () {
      final lifespanRange = LifespanRange(
        birthDate: DateTime(1980, 3, 14),
        idealAge: 84,
      );
      final now = DateTime(2026, 2, 2);
      expect(
        lifespanRange.nextDropDate(now: now),
        DateTime(2026, 5, 27),
      );
    });
  });
}
