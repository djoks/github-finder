import 'package:flutter/material.dart';
import 'package:github_finder/providers/theme_provider.dart';
import 'package:github_finder/widgets/layouts/bottom_tab_view.dart';
import 'package:github_finder/widgets/layouts/page_view.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  SettingsTabState createState() => SettingsTabState();
}

class SettingsTabState extends State<SettingsTab> {
  late final ThemeProvider themeProvider;

  @override
  void initState() {
    super.initState();
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return AppPageView(
      title: 'Settings',
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RadioListTile(
                  title: const Text('Light Mode'),
                  value: ThemeMode.light,
                  groupValue: themeProvider.themeMode,
                  onChanged: (ThemeMode? value) {
                    setState(() {
                      themeProvider.themeMode = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Dark Mode'),
                  value: ThemeMode.dark,
                  groupValue: themeProvider.themeMode,
                  onChanged: (ThemeMode? value) {
                    setState(() {
                      themeProvider.themeMode = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('System Default'),
                  value: ThemeMode.system,
                  groupValue: themeProvider.themeMode,
                  onChanged: (ThemeMode? value) {
                    setState(() {
                      themeProvider.themeMode = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
