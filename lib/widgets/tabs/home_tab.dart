import 'package:flutter/material.dart';
import 'package:github_finder/pages/settings_page.dart';
import 'package:github_finder/providers/home_provider.dart';
import 'package:github_finder/widgets/app_icon.dart';
import 'package:github_finder/widgets/layouts/bottom_tab_view.dart';
import 'package:github_finder/widgets/layouts/page_view.dart';
import 'package:github_finder/widgets/repository_list.dart';
import 'package:github_finder/widgets/user_list.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  HomeTabState createState() => HomeTabState();
}

class HomeTabState extends State<HomeTab> {
  late final HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return AppPageView(
      title: 'Home',
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildSearchField(),
          _buildTabView(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    final focusNode = FocusNode();

    return TextField(
      focusNode: focusNode,
      textInputAction: TextInputAction.done,
      onEditingComplete: () => focusNode.unfocus(),
      autofocus: false,
      controller: homeProvider.searchController,
      decoration: InputDecoration(
        prefixIcon: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: const AppIcon('assets/images/search.png', size: 24),
        ),
        prefixIconConstraints: BoxConstraints.tight(const Size(55, 55)),
        hintText: 'Search for users or repositories',
      ),
    );
  }

  Widget _buildTabView() {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.normal),
                isScrollable: true,
                tabs: const [
                  Tab(text: 'Users'),
                  Tab(text: 'Repositories'),
                ],
              ),
            ),
            Consumer<HomeProvider>(
              builder: (context, provider, child) {
                return homeProvider.currentQuery.isEmpty
                    ? _buildEmptySearchView()
                    : _buildTabBarView();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptySearchView() {
    return Column(
      children: [
        const SizedBox(height: 25),
        Text('What are you looking for?',
            style: Theme.of(context).textTheme.bodyLarge),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 25),
          margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const AppIcon('assets/images/no-search-query.png', size: 250),
        ),
      ],
    );
  }

  Widget _buildNoResultsView() {
    return Column(
      children: [
        const SizedBox(height: 25),
        Text('Cannot find any search result for abc',
            style: Theme.of(context).textTheme.bodyLarge),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 25),
          margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const AppIcon('assets/images/no-results.png', size: 250),
        ),
      ],
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          if (homeProvider.users!.isEmpty)
            _buildNoResultsView()
          else
            UserList(
              query: homeProvider.currentQuery,
              recordCount: homeProvider.users?.length ?? 0,
              users: homeProvider.users,
            ),
          if (homeProvider.repositories!.isEmpty)
            _buildNoResultsView()
          else
            RepositoryList(
              query: homeProvider.currentQuery,
              recordCount: homeProvider.repositories?.length ?? 0,
              repositories: homeProvider.repositories,
            ),
        ],
      ),
    );
  }
}
