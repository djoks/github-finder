import 'package:flutter/material.dart';
import 'package:ghfinder/widgets/shimmers/shimmer_block.dart';
import 'package:ghfinder/widgets/shimmers/shimmer_repository_list_item.dart';

class ShimmerRepositoryList extends StatelessWidget {
  const ShimmerRepositoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: const ShimmerBlock(width: 200, height: 14),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => const ShimmerRepositoryListItem(),
          ),
        ),
      ],
    );
  }
}
