import 'package:flutter/material.dart';
import 'package:ghfinder/utils/is_dark_mode.dart';
import 'package:ghfinder/widgets/tab_icons.dart';
import 'package:ghfinder/widgets/tabs/home_tab.dart';
import 'package:ghfinder/widgets/tabs/settings_tab.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

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
      backgroundColor:
          isDarkMode(context) ? const Color(0xFF282828) : Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
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
        activeColorPrimary: isDarkMode(context) ? Colors.white : activeColor,
        inactiveColorPrimary: inActiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(TabIcons.analytics),
        title: ("Analytics"),
        activeColorPrimary: isDarkMode(context) ? Colors.white : activeColor,
        inactiveColorPrimary: inActiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(TabIcons.settings),
        title: ("Settings"),
        activeColorPrimary: isDarkMode(context) ? Colors.white : activeColor,
        inactiveColorPrimary: inActiveColor,
      ),
    ];
  }
}
