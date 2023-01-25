part of dartly;

extension StringExtension on String {
  ///returns `true`, if the `string` is `number` other-wise `false`
  ///```dart
  ///
  ///'123'.isNumber; // true
  ///'dart'.isNumber; // false
  ///```
  bool get isNumber {
    return double.tryParse(this) != null;
  }
}
