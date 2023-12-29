import 'package:flutter_test/flutter_test.dart';
import 'package:ghfinder/utils/format_date.dart';

void main() {
  test('formatDate should correctly format date in YYYY-MM-DD format', () {
    final formattedDate = formatDate("2023-09-14", "yyyy-MM-dd");
    expect(formattedDate, "2023-09-14");
  });

  test('formatDate should correctly format date in MM/DD/YYYY format', () {
    final formattedDate = formatDate("2023-09-14", "MM/dd/yyyy");
    expect(formattedDate, "09/14/2023");
  });

  test('formatDate should correctly format date in dd MMMM yyyy format', () {
    final formattedDate = formatDate("2023-09-14", "dd MMMM yyyy");
    expect(formattedDate, "14 September 2023");
  });
}
