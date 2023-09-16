import 'package:github_finder/enums/route.dart';
import 'package:github_finder/providers/page_provider.dart';
import 'package:github_finder/pages/home_page.dart';
import 'package:github_finder/pages/repository_page.dart';
import 'package:github_finder/pages/user_page.dart';
import 'package:flutter/material.dart';

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate({required PageProvider notifier})
      : navigatorKey = GlobalKey<NavigatorState>() {
    notifier.addListener(() {
      setNewRoutePath(notifier.pageName);
    });
  }

  AppRoute? _currentRoute = AppRoute.home;

  @override
  AppRoute? get currentConfiguration => _currentRoute;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_currentRoute == AppRoute.home)
          const MaterialPage(child: HomePage()),
        if (_currentRoute == AppRoute.user)
          const MaterialPage(child: UserPage()),
        if (_currentRoute == AppRoute.repository)
          const MaterialPage(child: RepositoryPage()),
        if (_currentRoute == AppRoute.analytics)
          const MaterialPage(child: HomePage()),
        if (_currentRoute == AppRoute.settings)
          const MaterialPage(child: HomePage()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        // Update the list of pages
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {
    _currentRoute = configuration;
    notifyListeners();
  }
}
