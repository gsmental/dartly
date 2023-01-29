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

      expect(Validate.isAlphanumeric('^&'), false); // result : false
      expect(Validate.isAlphanumeric('Dart2'), true); // result : true
      expect(
          Validate.isAlphanumericUppercase('dart2'), false); // result : false
      expect(Validate.isAlphanumericUppercase('Dart2'), true); // result : true

// Date Time
      expect(Validate.isLeapYear(2023), false); // result : false
      expect(Validate.isLeapYear(2024), true); // result : true
      expect(Validate.daysInMonth(2023, 1), 31); // result: 31

      /// Url
      expect(Validate.isUrl('Dart'), false); // result : false
      expect(Validate.isUrl('http://dart.dev'), true); // result : true
      expect(Validate.isContainsWhiteSpace(' Dart '), true); //resutl : Dart

      // Bool
      expect(Validate.toBoolean('1'),
          true); //result :true Other params:- 1,true;  false:'',0,false

      // Date time
      expect(Validate.isDate('2023-01-01'), true); // result : true
      expect(Validate.isTomorrow(DateTime.now()), false); //result:false
      expect(Validate.isToday(DateTime.now()), true); //result: true
      expect(Validate.isYesterday(DateTime.now()), false); //result :false
    });
  });
}
