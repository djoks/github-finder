import 'package:flutter_test/flutter_test.dart';
import 'package:github_finder/models/language.dart';
import 'package:github_finder/utils/parse_languages.dart';

void main() {
  test('parseLanguages should correctly parse language data', () async {
    // Mock data
    Map<String, int> mockData = {
      'Dart': 500,
      'JavaScript': 300,
      'Python': 200,
    };

    // Mock default color
    String defaultColor = '#FFFFFF';

    // Expected output
    List<Language> expectedLanguages = [
      Language('Dart', bytes: 500, percentage: 50.0, color: '#FFFFFF'),
      Language('JavaScript', bytes: 300, percentage: 30.0, color: '#FFFFFF'),
      Language('Python', bytes: 200, percentage: 20.0, color: '#FFFFFF'),
    ];

    // Run the function
    List<Language> result =
        await parseLanguages(mockData, defaultColor: defaultColor);

    // Check the output
    expect(result, expectedLanguages);
  });
}
