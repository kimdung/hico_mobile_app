import 'package:intl/intl.dart';

String formatVnd(String price) {
  final oCcy = NumberFormat('#,###', 'en_US');
  return '${oCcy.format(double.parse(price))} VNĐ';
}

String formatD(String price) {
  final oCcy = NumberFormat('#,###', 'en_US');
  return '${oCcy.format(double.parse(price))}đ';
}

bool toBool(String ext) {
  if (ext == 'true') {
    return true;
  }
  return false;
}
