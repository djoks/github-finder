import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ghfinder/widgets/shimmers/shimmer_badge.dart';

class ShimmerBadgeList extends StatelessWidget {
  const ShimmerBadgeList({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final itemCount = random.nextInt(3) + 1;

    return SizedBox(
        height: 30,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3, //itemCount,
          itemBuilder: (context, index) =>
              const ShimmerBadge(width: 95, height: 18),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 8);
          },
        ));
  }
}
