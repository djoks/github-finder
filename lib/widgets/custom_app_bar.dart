import 'package:flutter/material.dart';
import 'package:github_finder/enums/route.dart';
import 'package:github_finder/providers/page_provider.dart';
import 'package:github_finder/widgets/app_icon.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? customAction;

  const CustomAppBar({super.key, this.title, this.customAction});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context);
    final currentRoute = pageProvider.pageName;
    final isFirstPage = (currentRoute == AppRoute.home ||
        currentRoute == AppRoute.analytics ||
        currentRoute == AppRoute.settings);

    return AppBar(
      title: Container(
          margin: const EdgeInsets.only(left: 8),
          child: isFirstPage ? Text(title ?? 'Home') : null),
      centerTitle: false,
      leading: isFirstPage
          ? null
          : InkWell(
              onTap: () {
                pageProvider.goBack();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16.0),
                child: const AppIcon('assets/images/back.png', size: 36),
              ),
            ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: Row(children: [
            if (customAction != null)
              customAction!
            else if (isFirstPage)
              IconButton(
                icon:
                    const AppIcon('assets/images/notifications.png', size: 24),
                onPressed: () {},
              ),
          ]),
        )
      ],
    );
  }
}
