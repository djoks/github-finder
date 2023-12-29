import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBadge extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerBadge({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        width: width,
        height: height,
        child: const Center(
          child: SizedBox(child: null),
        ),
      ),
    );
  }
}
