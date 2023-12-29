import 'package:flutter/material.dart';
import 'package:ghfinder/models/repository.dart';
import 'package:ghfinder/widgets/repository_list_item.dart';

class RepositoryList extends StatelessWidget {
  final String query;
  final int? recordCount;
  final List<Repository>? repositories;

  const RepositoryList(
      {super.key,
      required this.query,
      required this.recordCount,
      required this.repositories});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (recordCount! > 0)
            Container(
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      const TextSpan(text: 'Showing '),
                      TextSpan(
                        text: '$recordCount results ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: 'of '),
                      TextSpan(
                        text: query,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ))
          else
            const SizedBox(
              height: 15,
            ),
          if (repositories != null && repositories!.isNotEmpty)
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: repositories?.length,
                itemBuilder: (context, index) {
                  return RepositoryListItem(repository: repositories![index]);
                },
              ),
            )
          else
            const Text('No repositories to display.'),
        ],
      ),
    );
  }
}
