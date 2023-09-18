import 'package:flutter/material.dart';
import 'package:github_finder/models/language.dart';
import 'package:github_finder/widgets/language_list_item.dart';

class LanguageList extends StatelessWidget {
  final List<Language> languages;
  final bool? showPercentages;

  const LanguageList(
      {super.key, required this.languages, this.showPercentages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: languages.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8);
        },
        itemBuilder: (context, index) {
          return LanguageListItem(
              language: languages[index],
              showPercentage: showPercentages == true);
        },
      ),
    );
  }
}
