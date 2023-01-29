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

  /// Remove extra whitespace between words then trim.
  static String removeExtraWhiteSpaces(String value) {
    final regex = RegExp(r'\S+');
    final words =
        regex.allMatches(value).map((v) => v.group(0)).join(' ').trim();
    return words;
  }

  static bool isAlphanumeric(String value) {
    if (value.length < 2) return false;
    return value.contains(RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).*$'));
  }

  static bool isAlphanumericUppercase(String value) {
    if (value.length < 2) return false;
    return value.contains(RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[A-Z]).*$'));
  }

  static bool isAlphanumericUppercaseWithSymbol(String value) {
    if (value.length < 2) return false;
    return value.contains(
        RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[A-Z])(?=.*?[!@#$]).*$'));
  }

  static bool isUrl(String value, {bool protocolMandatory = true}) {
    final RegExp regexOptionalProtocol = RegExp(
        r'(https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)');

    final RegExp regexMandatoryProtocol = RegExp(
        r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#()?&//=]*)');

    return value.contains(
      protocolMandatory ? regexMandatoryProtocol : regexOptionalProtocol,
    );
  }

  static bool isContainsWhiteSpace(String value) {
    if (value.isEmpty) return false;
    return value.contains(RegExp(r'\s'));
  }

  static bool isContainsUpperCase(String value) {
    return value.contains(RegExp(r'(?=.*?[A-Z]).*$'));
  }

  static bool isContainsLowerCase(String value) {
    return value.contains(RegExp(r'(?=.*?[a-z]).*$'));
  }

  /// convert the input to a boolean.
  ///
  /// Everything except for '0', 'false' and ''
  /// returns `true`. In `strict` mode only '1' and 'true' return `true`.
  static bool toBoolean(String str, [bool? strict]) {
    if (strict == true) {
      return str == '1' || str == 'true';
    }
    return str != '0' && str != 'false' && str != '';
  }

  /// trim characters (whitespace by default) from both sides of the input
  static String trim(String str, [String? chars]) {
    RegExp pattern = (chars != null)
        ? RegExp('^[$chars]+|[$chars]+\$')
        : RegExp(r'^\s+|\s+$');
    return str.replaceAll(pattern, '');
  }

  /// trim characters from the left-side of the input
  static String ltrim(String str, [String? chars]) {
    var pattern = chars != null ? RegExp('^[$chars]+') : RegExp(r'^\s+');
    return str.replaceAll(pattern, '');
  }

  /// trim characters from the right-side of the input
  static String rtrim(String str, [String? chars]) {
    var pattern = chars != null ? RegExp('[$chars]+\$') : RegExp(r'\s+$');
    return str.replaceAll(pattern, '');
  }

  /// check if the string is a date
  static bool isDate(String str) {
    try {
      DateTime.parse(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// check if the string [str] is an email
  static bool isEmail(String str) {
    RegExp _email = RegExp(
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    return _email.hasMatch(str.toLowerCase());
  }

  ///Returns true if [date] is the next day
  static bool isTomorrow(DateTime date) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day + 1) ==
        (DateTime(date.year, date.month, date.day));
  }

  ///Returns true if [date] is current day
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    final diffDays = date.difference(now).inDays;
    final isSameAsToday = (diffDays == 0 && date.day == now.day);
    return isSameAsToday;
  }

  ///Returns true if [date] is the previous day
  static bool isYesterday(DateTime date) {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day - 1) ==
        (DateTime(date.year, date.month, date.day));
  }

  ///Returs true if [date] is in current month of the current year
  static bool isThisMonth(DateTime date) =>
      date.year == DateTime.now().year && date.month == DateTime.now().month;
}
