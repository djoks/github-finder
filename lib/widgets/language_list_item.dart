import 'package:flutter/material.dart';
import 'package:github_finder/models/language.dart';
import 'package:github_finder/utils/hex_to_color.dart';

class LanguageListItem extends StatelessWidget {
  final Language language;
  final bool? showPercentage;

  const LanguageListItem(
      {super.key, required this.language, this.showPercentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: language.color != null
            ? hexToColor(language.color!).withOpacity(0.2)
            : Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          showPercentage == true
              ? '${language.language} ${language.percentage}%'
              : language.language,
          style: TextStyle(
            color: language.color != null
                ? hexToColor(language.color!)
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
