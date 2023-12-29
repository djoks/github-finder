import 'package:flutter/material.dart';
import 'package:ghfinder/providers/home_provider.dart';
import 'package:ghfinder/utils/is_dark_mode.dart';
import 'package:ghfinder/widgets/app_icon.dart';
import 'package:ghfinder/widgets/page_view.dart';
import 'package:ghfinder/widgets/repository_list.dart';
import 'package:ghfinder/widgets/shimmers/shimmer_repository_list.dart';
import 'package:ghfinder/widgets/shimmers/shimmer_user_list.dart';
import 'package:ghfinder/widgets/user_list.dart';
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
            Expanded(child: _buildTabView()),
          ],
        ),
        isHome: true);
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
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: TabBar(
              indicatorColor: isDarkMode(context)
                  ? Colors.white
                  : Theme.of(context).primaryColor,
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
          Expanded(
            child: Consumer<HomeProvider>(
              builder: (context, provider, child) {
                return homeProvider.currentQuery.isEmpty
                    ? _buildEmptySearchView()
                    : _buildTabBarView();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptySearchView() {
    // return const ShimmerUserList();
    return Column(
      children: [
        const SizedBox(height: 25),
        Text('What are you looking for?',
            style: Theme.of(context).textTheme.bodyLarge),
        Container(
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 25),
          margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          decoration: BoxDecoration(
            color: isDarkMode(context) ? const Color(0xFF282828) : Colors.white,
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
            color: isDarkMode(context) ? const Color(0xFF282828) : Colors.white,
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
          if (homeProvider.users == null || homeProvider.users!.isEmpty)
            _buildNoResultsView()
          else
            homeProvider.isLoadingUsers
                ? const ShimmerUserList()
                : UserList(
                    query: homeProvider.currentQuery,
                    recordCount: homeProvider.users?.length ?? 0,
                    users: homeProvider.users,
                  ),
          if (homeProvider.repositories == null ||
              homeProvider.repositories!.isEmpty)
            _buildNoResultsView()
          else
            homeProvider.isLoadingRepositories
                ? const ShimmerRepositoryList()
                : RepositoryList(
                    query: homeProvider.currentQuery,
                    recordCount: homeProvider.repositories?.length ?? 0,
                    repositories: homeProvider.repositories,
                  ),
        ],
      ),
    );
  }
}
