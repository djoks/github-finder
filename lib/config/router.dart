import 'package:flutter/material.dart';
import 'package:github_finder/models/repository.dart';
import 'package:github_finder/models/user_details.dart';
import 'package:github_finder/pages/home_page.dart';
import 'package:github_finder/pages/repository_page.dart';
import 'package:github_finder/pages/settings_page.dart';
import 'package:github_finder/pages/user_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/analytics':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/settings':
        return MaterialPageRoute(builder: (context) => const SettingsPage());
      case '/user':
        final UserDetails args = settings.arguments as UserDetails;
        return MaterialPageRoute(
            builder: (context) => UserPage(userDetails: args));
      case '/repository':
        final Repository args = settings.arguments as Repository;
        return MaterialPageRoute(
            builder: (context) => RepositoryPage(repository: args));
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
