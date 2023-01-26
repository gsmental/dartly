part of dartly;

extension StringExtension on String {
  ///returns `true`, if the `string` is `number` other-wise `false`
  ///```dart
  ///
  ///'123'.isNumber; // true
  ///'dart'.isNumber; // false
  ///```
  // bool get isNumber {
  //   return double.tryParse(this) != null;
  // }

  // /// Returns [true] if [s] is either null, empty or is solely made of whitespace
  // /// characters (as defined by [String.trim]).
  // bool get isBlank {
  //   // (String? s) => s == null || s.trim().isEmpty;
  //   //return  this.trim().isEmpty ?? true:false;
  // }
}
