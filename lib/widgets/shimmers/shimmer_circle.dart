import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCircle extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerCircle({super.key, this.width = 100.0, this.height = 100.0});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: null));
  }
}
