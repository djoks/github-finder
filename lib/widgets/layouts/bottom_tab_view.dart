import 'package:flutter/material.dart';
import 'package:github_finder/config/router/route_parser.dart';
import 'package:github_finder/config/router/router_delegate.dart';
import 'package:github_finder/enums/route.dart';
import 'package:github_finder/providers/page_provider.dart';
import 'package:github_finder/widgets/app_icon.dart';
import 'package:provider/provider.dart';

class BottomTabView extends StatelessWidget {
  final AppRoute currentRoute;
  final ValueChanged<AppRoute> onTabTapped;

  const BottomTabView(
      {super.key, required this.currentRoute, required this.onTabTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Router(
        routeInformationParser: AppRouteInformationParser(),
        routerDelegate:
            AppRouterDelegate(notifier: Provider.of<PageProvider>(context)),
      ),
      bottomNavigationBar: (currentRoute == AppRoute.home ||
              currentRoute == AppRoute.analytics ||
              currentRoute == AppRoute.settings)
          ? Container(
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
                  currentIndex: AppRoute.values.indexOf(currentRoute),
                  onTap: (index) => onTabTapped(AppRoute.values[index]),
                  items: [
                    BottomNavigationBarItem(
                      icon: AppIcon(
                        'assets/images/home.png',
                        size: 24,
                        active: currentRoute == AppRoute.home,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: AppIcon(
                        'assets/images/analytics.png',
                        size: 24,
                        active: currentRoute == AppRoute.analytics,
                      ),
                      label: 'Analytics',
                    ),
                    BottomNavigationBarItem(
                      icon: AppIcon(
                        'assets/images/settings.png',
                        size: 24,
                        active: currentRoute == AppRoute.settings,
                      ),
                      label: 'Settings',
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
