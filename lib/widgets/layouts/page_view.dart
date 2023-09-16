import 'package:flutter/material.dart';
import 'package:github_finder/widgets/custom_app_bar.dart';

class AppPageView extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? customAction;

  const AppPageView(
      {super.key, required this.title, required this.body, this.customAction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        customAction: customAction,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: body,
      ),
    );
  }
}
