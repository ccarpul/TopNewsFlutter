import 'package:intl/intl.dart';

String getDateFormatter(String? date) {
  return date != null && date != '' 
  ? DateFormat('yyyy/MM/dd').format(DateTime.parse(date))
  : '';
}