import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ghfinder/widgets/app_icon.dart';

class ShimmerStar extends StatelessWidget {
  final double size;

  const ShimmerStar({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: AppIcon('assets/images/star.png', size: size),
    );
  }
}
