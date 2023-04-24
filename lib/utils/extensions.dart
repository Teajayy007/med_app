import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  ///[dateFormat] extension formats DateTime object to match pattern.
  ///Example
  ///```dart
  ///final DateTime currentTime = DateTime.now(); (2023-04-24 01:59:58.392)
  ///currentTime.dateFormat = 2023-04-24T01:59:58.391Z
  ///```
  get dateFormat => DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(this);

  ///[dateParse] extension converts DateTime object pattern.
  ///Example
  ///```dart
  ///final DateTime currentTime = DateTime.now(); (2023-04-24 01:59:58.392)
  ///final toParse = currentTime.dateFormat; 2023-04-24T01:59:58.391Z
  ///toParse.dateParse=2023-04-24 01:59:58.392
  ///```
  get dateParse => DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(toString());
}
