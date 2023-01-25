import 'package:dartly/dartly.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect('dart'.isNumber, false);
      expect('1'.isNumber, true);
    });
  });
}
