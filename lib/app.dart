import 'package:github_finder/providers/page_provider.dart';
import 'package:github_finder/providers/theme_provider.dart';
import 'package:github_finder/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:github_finder/widgets/layouts/bottom_tab_view.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider()),
        ChangeNotifierProvider<PageProvider>(
            create: (context) => PageProvider())
      ],
      child: Consumer2<ThemeProvider, PageProvider>(
          builder: (context, themeProvider, pageProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'GitHub Finder',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            home: BottomTabView(
              currentRoute: pageProvider.pageName,
              onTabTapped: (route) {
                pageProvider.changePage(route);
              },
            ));
      }),
    );
  }
}
