import 'package:github_finder/enums/route.dart';
import 'package:flutter/widgets.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoute> {
  @override
  Future<AppRoute> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return AppRoute.home;
    }
    // Handle '/analytics'
    if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'analytics') {
      return AppRoute.analytics;
    }
    // Handle '/settings'
    if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'settings') {
      return AppRoute.settings;
    }
    // Handle '/user/{user}'
    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'user') {
      return AppRoute.user;
    }
    // Handle '/repository/{user}/{repo}'
    if (uri.pathSegments.length == 3 && uri.pathSegments[0] == 'repository') {
      return AppRoute.repository;
    }

    return AppRoute.home;
  }

  @override
  RouteInformation restoreRouteInformation(AppRoute configuration) {
    switch (configuration) {
      case AppRoute.home:
        return RouteInformation(uri: Uri.parse('/'));
      case AppRoute.user:
        return RouteInformation(uri: Uri.parse('/user/{user}'));
      case AppRoute.repository:
        return RouteInformation(uri: Uri.parse('/repository/{user}/{repo}'));
      case AppRoute.analytics:
        return RouteInformation(uri: Uri.parse('/analytics'));
      case AppRoute.settings:
        return RouteInformation(uri: Uri.parse('/settings'));
    }
  }
}
