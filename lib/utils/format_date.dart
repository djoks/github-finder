import 'package:intl/intl.dart';

String formatDate(String inputDate, String outputFormat) {
  DateTime parsedDate = DateTime.parse(inputDate);
  return DateFormat(outputFormat).format(parsedDate);
}
