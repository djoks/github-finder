import 'package:github_finder/config/router.dart';
import 'package:github_finder/providers/home_provider.dart';
import 'package:github_finder/providers/repository_provider.dart';
import 'package:github_finder/providers/theme_provider.dart';
import 'package:github_finder/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:github_finder/providers/user_provider.dart';
import 'package:github_finder/services/http_service.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider()),
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider(HttpService())),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider(HttpService())),
        ChangeNotifierProvider<RepositoryProvider>(
            create: (context) => RepositoryProvider(HttpService()))
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GitHub Finder',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          initialRoute: '/',
          onGenerateRoute: AppRouter.generateRoute,
        );
      }),
    );
  }
}
