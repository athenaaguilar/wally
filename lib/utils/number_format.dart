import 'package:intl/intl.dart';

String numberFormat(int? num) {
  return NumberFormat('#,##0', 'en_US').format(num ?? 0);
}