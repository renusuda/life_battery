import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/utils/extensions.dart';

void main() {
  group('IntExtensions', () {
    test('Converts three digits numbers directly to string', () {
      final result = 100.withCommaString;
      expect(
        result,
        '100',
      );
    });

    test('Converts four digits numbers to string with a comma', () {
      final result = 1000.withCommaString;
      expect(
        result,
        '1,000',
      );
    });

    test('Converts seven digits numbers to string with a comma', () {
      final result = 1000000.withCommaString;
      expect(
        result,
        '1,000,000',
      );
    });
  });
}
