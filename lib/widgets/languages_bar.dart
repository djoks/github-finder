import 'package:flutter/material.dart';
import 'package:github_finder/models/language.dart';
import 'package:github_finder/utils/hex_to_color.dart';

class LanguagesBar extends StatelessWidget {
  final List<Language> languages;

  const LanguagesBar({super.key, required this.languages});

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
            return Expanded(
              flex: (language.percentage * 10).toInt(),
              child: Container(
                decoration: BoxDecoration(color: hexToColor(language.color!)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
