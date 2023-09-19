import 'package:flutter/material.dart';
import 'package:github_finder/widgets/custom_app_bar.dart';

class AppPageView extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? customAction;
  final bool? isHome;

  const AppPageView(
      {super.key,
      this.title,
      required this.body,
      this.customAction,
      this.isHome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          title: title, customAction: customAction, isHome: isHome),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: body,
      ),
    );
  }
}
