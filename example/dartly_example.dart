import 'package:dartly/dartly.dart';

void main() {
  Validate.isNumber('dart'); // Result :false
  Validate.isNumber('1'); // result : true
  Validate.daysInMonth(2023, 1); // result: 31
  Validate.isBlank(""); //result : true
  Validate.isBlank("s"); // result false
  Validate.isLeapYear(2023); // result : false
  Validate.isLeapYear(2024); // result : true
  Validate.reverse("India"); //result :aidnI
}
