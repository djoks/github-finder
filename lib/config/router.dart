import 'package:flutter/material.dart';
import 'package:github_finder/models/repository.dart';
import 'package:github_finder/models/user_details.dart';
import 'package:github_finder/pages/app_page.dart';
import 'package:github_finder/pages/repository_page.dart';
import 'package:github_finder/pages/user_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const AppPage());
      case '/analytics':
        return MaterialPageRoute(builder: (context) => const AppPage());
      case '/settings':
        return MaterialPageRoute(builder: (context) => const AppPage());
      case '/user':
        final UserDetails args = settings.arguments as UserDetails;
        return MaterialPageRoute(
            builder: (context) => UserPage(userDetails: args));
      case '/repository':
        final Repository args = settings.arguments as Repository;
        return MaterialPageRoute(
            builder: (context) => RepositoryPage(repository: args));
      default:
        return MaterialPageRoute(builder: (context) => const AppPage());
    }
  }
}
