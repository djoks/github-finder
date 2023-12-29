import 'package:flutter/material.dart';
import 'package:ghfinder/widgets/app_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? customAction;
  final bool? isHome;

  const CustomAppBar({super.key, this.title, this.customAction, this.isHome});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
          margin: const EdgeInsets.only(left: 8),
          child: isHome == true
              ? Text(
                  title ?? 'Home',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              : null),
      centerTitle: false,
      leading: isHome == true
          ? null
          : InkWell(
              onTap: () {
                Navigator.pop(context);
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
              Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: customAction!)
            else if (isHome == true)
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
