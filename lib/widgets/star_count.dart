import 'package:flutter/material.dart';
import 'package:github_finder/widgets/app_icon.dart';

class StarCount extends StatelessWidget {
  final int count;

  const StarCount(this.count, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const AppIcon(
        'assets/images/star.png',
        size: 18,
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        count.toString(),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ]);
  }
}
