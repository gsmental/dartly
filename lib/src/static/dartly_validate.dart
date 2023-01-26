library dartly;

class Validate {
  ///returns `true`, if the `string` is `number` other-wise `false`
  ///```dart
  ///
  ///'123'.isNumber; // true
  ///'dart'.isNumber; // false
  ///```
  static bool isNumber(String value) {
    return double.tryParse(value) != null;
  }

  /// Returns [true] if [s] is either null, empty or is solely made of whitespace
  /// characters (as defined by [String.trim]).
  static bool isBlank(String? s) => s == null || s.trim().isEmpty;

  /// Returns [true] if [s] is neither null, empty nor is solely made of whitespace
  /// characters.
  ///
  /// See also:
  ///
  ///  * [isBlank]
  static bool isNotBlank(String? s) => s != null && s.trim().isNotEmpty;

  /// Returns [true] if [s] is either null or empty.
  static bool isEmpty(String? s) => s == null || s.isEmpty;

  /// Returns [true] if [s] is a not empty string.
  static bool isNotEmpty(String? s) => s != null && s.isNotEmpty;

  /// Returns a string with characters from the given [s] in reverse order.
  ///
  /// NOTE: without full support for unicode composed character sequences,
  /// sequences including zero-width joiners, etc. this function is unsafe to
  /// use. No replacement is provided.
  static String reverse(String s) {
    if (s == '') return s;
    StringBuffer sb = StringBuffer();
    var runes = s.runes.iterator..reset(s.length);
    while (runes.movePrevious()) {
      sb.writeCharCode(runes.current);
    }
    return sb.toString();
  }

  // static StringBuffer repeat(StringBuffer sink, String s, int times) {
  //   for (int i = 0; i < times; i++) {
  //     sink.write(s);
  //   }
  //   return sink;
  // }

  /// Days in a month. This array uses 1-based month numbers, i.e. January is
  /// the 1-st element in the array, not the 0-th.
  static const _daysInMonth = [
    0,
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  /// Returns true if [year] is a leap year.
  static bool isLeapYear(int year) =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  /// Returns the number of days in the specified month.
  static int daysInMonth(int year, int month) =>
      (month == DateTime.february && isLeapYear(year))
          ? 29
          : _daysInMonth[month];
}
