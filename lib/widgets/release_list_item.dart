import 'package:flutter/material.dart';
import 'package:github_finder/models/release.dart';
import 'package:github_finder/utils/format_date.dart';

class ReleaseListItem extends StatelessWidget {
  final Release release;

  const ReleaseListItem({Key? key, required this.release}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? name = release.name;
    String? publishedAt = release.publishedAt;

    String displayName = name ?? 'Not available';
    String displayDate = publishedAt != null
        ? formatDate(publishedAt, "MMM dd, yyyy")
        : 'Unknown date';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        Text('Updated: $displayDate'),
      ],
    );
  }
}
