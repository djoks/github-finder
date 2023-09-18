import 'package:github_finder/models/language.dart';
import 'package:github_finder/utils/get_language_color.dart';

Future<List<Language>> parseLanguages(Map<String, int> data,
    {String? defaultColor}) async {
  int totalBytes = data.values.fold(0, (prev, element) => prev + element);

  List<Language> languages = [];

  for (var entry in data.entries) {
    String color = defaultColor ?? await getLanguageColor(entry.key);
    double percentage = ((entry.value / totalBytes) * 100).toDouble();
    percentage = double.parse(percentage.toStringAsFixed(2));
    languages.add(Language(entry.key,
        bytes: entry.value, percentage: percentage, color: color));
  }

  return languages;
}
