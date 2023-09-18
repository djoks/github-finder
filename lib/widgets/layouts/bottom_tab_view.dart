import 'package:flutter/material.dart';
import 'package:github_finder/pages/home_page.dart';
import 'package:github_finder/pages/settings_page.dart';
import 'package:github_finder/widgets/app_icon.dart';
import 'package:github_finder/widgets/custom_app_bar.dart';

class BottomTabView extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget? customAction;

  const BottomTabView(
      {super.key, required this.title, required this.body, this.customAction});

  @override
  BottomTabViewState createState() => BottomTabViewState();
}

class BottomTabViewState extends State<BottomTabView> {
  late List<Widget> pages;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pages = const [
      HomePage(),
      HomePage(),
      SettingsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: widget.title,
        customAction: widget.customAction,
        isHome: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: pages[currentIndex],
      ),
      bottomNavigationBar: Container(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: AppIcon(
                  'assets/images/home.png',
                  size: 24,
                  active: currentIndex == 0,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: AppIcon(
                  'assets/images/analytics.png',
                  size: 24,
                  active: currentIndex == 1,
                ),
                label: 'Analytics',
              ),
              BottomNavigationBarItem(
                icon: AppIcon(
                  'assets/images/settings.png',
                  size: 24,
                  active: currentIndex == 2,
                ),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
