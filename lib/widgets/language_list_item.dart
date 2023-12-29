import 'package:flutter/material.dart';
import 'package:ghfinder/models/language.dart';
import 'package:ghfinder/utils/hex_to_color.dart';

class LanguageListItem extends StatelessWidget {
  final Language language;
  final bool? showPercentage;

  const LanguageListItem(
      {super.key, required this.language, this.showPercentage});

  @override
  Widget build(BuildContext context) {
    String languageText = language.language ?? 'Unknown';
    double? percentage = language.percentage;
    String? color = language.color;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: color != null
            ? hexToColor(color).withOpacity(0.2)
            : Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          showPercentage == true && percentage != null
              ? '$languageText ${percentage.toStringAsFixed(2)}%'
              : languageText,
          style: TextStyle(
            color: color != null ? hexToColor(color) : Colors.grey,
          ),
        ),
      ),
    );
  }
}
