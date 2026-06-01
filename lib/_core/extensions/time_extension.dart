import 'package:intl/intl.dart';

extension DateTimeEx on DateTime {
  String formatDate([String pattern = 'dd-MM-yyyy']) {
    return DateFormat(pattern).format(this);
  }
}
