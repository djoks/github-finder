import 'package:flutter/material.dart';
import 'package:github_finder/models/language.dart';
import 'package:github_finder/utils/hex_to_color.dart';

class LanguagesBar extends StatelessWidget {
  final List<Language> languages;

  const LanguagesBar({Key? key, required this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: languages.map((language) {
            double? percentage = language.percentage;
            String? color = language.color;

            int flexValue = percentage != null ? (percentage * 10).toInt() : 0;
            Color displayColor =
                color != null ? hexToColor(color) : Colors.grey;

            return Expanded(
              flex: flexValue,
              child: Container(
                decoration: BoxDecoration(color: displayColor),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
