import 'package:flutter/material.dart';
import 'package:github_finder/models/release.dart';
import 'package:github_finder/utils/format_date.dart';

class ReleaseListItem extends StatelessWidget {
  final Release release;

  const ReleaseListItem({super.key, required this.release});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(release.name, style: Theme.of(context).textTheme.bodyMedium),
      const SizedBox(
        height: 5,
      ),
      Text('Updated: ${formatDate(release.publishedAt, "MMM dd, yyyy")}')
    ]);
  }
}
