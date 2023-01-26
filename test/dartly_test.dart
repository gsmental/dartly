import 'dart:math';

import 'package:dartly/dartly.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(Validate.isNumber('11'), true);
      expect(Validate.isNumber('ss'), false);
      expect(Validate.daysInMonth(2023, 1), 31);
      expect(Validate.isBlank(""), true);
      expect(Validate.isBlank("s"), false);
      expect(Validate.isLeapYear(2023), false);
      expect(Validate.isLeapYear(2024), true);
      expect(Validate.reverse("India"), "aidnI");
    });
  });
}
