import 'package:flutter/material.dart';
import 'package:ghfinder/widgets/shimmers/shimmer_badge_list.dart';
import 'package:ghfinder/widgets/shimmers/shimmer_block.dart';
import 'package:ghfinder/widgets/shimmers/shimmer_circle.dart';

class ShimmerUserListItem extends StatelessWidget {
  const ShimmerUserListItem({super.key});

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
    // make a full circle container

    return const Row(
      children: [
        ShimmerCircle(
          width: 25,
          height: 25,
        ),
        SizedBox(width: 10),
        ShimmerBlock(width: 100, height: 14),
        Spacer(),
        ShimmerBlock(width: 25, height: 14),
        SizedBox(width: 5),
        ShimmerBlock(width: 50, height: 14),
      ],
    );
  }

  Widget _buildLanguagesFuture() {
    return const ShimmerBadgeList();
  }
}
