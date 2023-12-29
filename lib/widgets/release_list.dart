import 'package:flutter/material.dart';
import 'package:ghfinder/models/release.dart';
import 'package:ghfinder/widgets/release_list_item.dart';

class ReleaseList extends StatelessWidget {
  final List<Release>? releases;

  const ReleaseList({super.key, required this.releases});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (releases != null && releases!.isNotEmpty)
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: releases?.length,
              itemBuilder: (context, index) {
                return ReleaseListItem(release: releases![index]);
              },
            ),
          )
        else
          const Text('No releases to display.'),
      ],
    );
  }
}
