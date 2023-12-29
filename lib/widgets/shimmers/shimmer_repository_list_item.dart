import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRepositoryListItem extends StatelessWidget {
  const ShimmerRepositoryListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
        ),
        title: Container(
          height: 10.0,
          color: Colors.white,
        ),
        subtitle: Container(
          height: 10.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
