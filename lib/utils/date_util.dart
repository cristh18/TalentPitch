import 'package:intl/intl.dart';

DateTime tryParse(String date) {
  try {
    return DateTime.parse(date);
  } catch (e) {
    return DateFormat('dd-MM-yyyy').parse(date);
  }
}
