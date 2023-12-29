import 'package:flutter/material.dart';
import 'package:ghfinder/widgets/shimmers/shimmer_badge_list.dart';
import 'package:ghfinder/widgets/shimmers/shimmer_block.dart';
import 'package:ghfinder/widgets/shimmers/shimmer_star.dart';

class ShimmerRepositoryListItem extends StatelessWidget {
  const ShimmerRepositoryListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRepositoryHeader(),
            const SizedBox(height: 5),
            const ShimmerBlock(width: 250, height: 14),
            const SizedBox(height: 5),
            _buildLanguagesFuture(),
            const SizedBox(height: 10),
            const ShimmerBlock(width: 175, height: 14),
          ],
        ),
      ),
    );
  }

  Widget _buildRepositoryHeader() {
    return const Row(
      children: [
        ShimmerBlock(width: 100, height: 14),
        Spacer(),
        ShimmerStar(size: 14),
        SizedBox(width: 5),
        ShimmerBlock(width: 50, height: 14),
      ],
    );
  }

  Widget _buildLanguagesFuture() {
    return const ShimmerBadgeList();
  }
}
