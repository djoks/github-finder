import 'package:flutter/material.dart';
import 'package:ghfinder/widgets/shimmers/shimmer_repository_list_item.dart';

class RepositoryListShimmer extends StatelessWidget {
  const RepositoryListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const ShimmerRepositoryListItem(),
      ),
    );
  }
}
