import 'package:flutter/material.dart';
import 'package:github_finder/pages/home_page.dart';
import 'package:github_finder/pages/settings_page.dart';
import 'package:github_finder/widgets/app_icon.dart';
import 'package:github_finder/widgets/custom_app_bar.dart';
import 'package:github_finder/widgets/tab_icons.dart';
import 'package:github_finder/widgets/tabs/home_tab.dart';
import 'package:github_finder/widgets/tabs/settings_tab.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  AppPageState createState() => AppPageState();
}

class AppPageState extends State<AppPage> {
  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: tabController,
      screens: buildTabs(),
      items: buildNavBarItems(context),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(0, -1.0),
          )
        ],
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }

  List<Widget> buildTabs() {
    return [const HomeTab(), Container(child: null), const SettingsTab()];
  }

  List<PersistentBottomNavBarItem> buildNavBarItems(BuildContext context) {
    Color activeColor = Theme.of(context).primaryColor;
    Color inActiveColor = const Color(0xFF90A59E);

    return [
      PersistentBottomNavBarItem(
        icon: const Icon(TabIcons.home),
        title: ("Home"),
        activeColorPrimary: activeColor,
        inactiveColorPrimary: inActiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(TabIcons.analytics),
        title: ("Analytics"),
        activeColorPrimary: activeColor,
        inactiveColorPrimary: inActiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(TabIcons.settings),
        title: ("Settings"),
        activeColorPrimary: activeColor,
        inactiveColorPrimary: inActiveColor,
      ),
    ];
  }
}
