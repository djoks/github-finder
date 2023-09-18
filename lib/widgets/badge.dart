import 'package:flutter/material.dart';

class AppBadge extends StatelessWidget {
  final String label;
  final Color color;

  const AppBadge({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
        ),
      ),
    );
  }
}
