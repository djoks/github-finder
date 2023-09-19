import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:github_finder/providers/theme_provider.dart';

class AppIcon extends StatelessWidget {
  final String assetPath;
  final double? size;
  final Color? color;
  final bool? active;

  const AppIcon(this.assetPath,
      {super.key, this.size, this.color, this.active});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    Color? iconColor;

    if (active != null) {
      iconColor = active! ? Theme.of(context).primaryColor : null;
    } else {
      iconColor = isDarkMode ? Colors.white : color;
    }

    return Center(
      child: Image.asset(
        assetPath,
        width: size,
        height: size,
        color: iconColor,
      ),
    );
  }
}
