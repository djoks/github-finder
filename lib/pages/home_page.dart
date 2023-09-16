import 'package:flutter/material.dart';
import 'package:github_finder/widgets/app_icon.dart';
import 'package:github_finder/widgets/layouts/page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView(
        title: 'Home',
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Container(
                      margin: const EdgeInsets.only(left: 12, right: 12),
                      child:
                          const AppIcon('assets/images/search.png', size: 24)),
                  prefixIconConstraints:
                      BoxConstraints.tight(const Size(55, 55)),
                  hintText: 'Search for users or repositories'),
            ),
            // Tabs
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: TabBar(
                        indicatorColor: Theme.of(context).primaryColor,
                        labelStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        unselectedLabelStyle:
                            const TextStyle(fontWeight: FontWeight.normal),
                        isScrollable: true,
                        tabs: const [
                          Tab(text: 'Users'),
                          Tab(text: 'Repositories'),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          Center(child: Text('Content for Tab 1')),
                          Center(child: Text('Content for Tab 2')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
