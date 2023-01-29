import 'package:dartly/dartly.dart';

void main() {
  // Number
  Validate.isNumber('dart'); // Result :false
  Validate.isNumber('1'); // result : true

  //String
  Validate.isBlank(""); //result : true
  Validate.isBlank("s"); // result false
  Validate.isNotBlank('s'); //result:true
  Validate.isEmpty(''); //result:true
  Validate.isNotEmpty('s'); //result:true
  Validate.reverse("Dart"); //result :traD
  Validate.removeExtraWhiteSpaces(' Dart '); //resutl : Dart
  Validate.isAlphanumeric('^&'); // result : false
  Validate.isAlphanumeric('Dart2'); // result : true
  Validate.isAlphanumericUppercase('dart2'); // result : false
  Validate.isAlphanumericUppercase('Dart2'); // result : true

// Date Time
  Validate.isLeapYear(2023); // result : false
  Validate.isLeapYear(2024); // result : true
  Validate.daysInMonth(2023, 1); // result: 31

  /// Url
  Validate.isUrl('Dart'); // result : false
  Validate.isUrl('http://dart.dev'); // result : true
  Validate.isContainsWhiteSpace(' Dart '); //resutl : true

  // Bool
  Validate.toBoolean(
      '1'); //result :true Other params:- 1,true;  false:'',0,false

  // Date time
  Validate.isDate('2023-01-01'); // result : true
  Validate.isTomorrow(DateTime.now()); //result:false
  Validate.isToday(DateTime.now()); //result: true
  Validate.isYesterday(DateTime.now()); //result :false
}
