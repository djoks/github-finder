import 'package:flutter/material.dart';
import 'package:github_finder/models/language.dart';
import 'package:github_finder/models/release.dart';
import 'package:github_finder/models/repository.dart';
import 'package:github_finder/providers/repository_provider.dart';
import 'package:github_finder/widgets/badge.dart';
import 'package:github_finder/widgets/language_list.dart';
import 'package:github_finder/widgets/languages_bar.dart';
import 'package:github_finder/widgets/page_view.dart';
import 'package:github_finder/widgets/release_list.dart';
import 'package:github_finder/widgets/star_count.dart';
import 'package:provider/provider.dart';

class RepositoryPage extends StatefulWidget {
  final Repository repository;

  const RepositoryPage({Key? key, required this.repository}) : super(key: key);

  @override
  RepositoryPageState createState() => RepositoryPageState();
}

class RepositoryPageState extends State<RepositoryPage> {
  late final RepositoryProvider repositoryProvider;

  @override
  void initState() {
    super.initState();
    repositoryProvider =
        Provider.of<RepositoryProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return AppPageView(
      customAction: StarCount(widget.repository.stargazersCount ?? 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderRow(),
          _buildTabView(),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      key: const Key('HeaderRow'),
      children: [
        Text(
          widget.repository.private! ? 'Private' : 'Public',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        AppBadge(
          label: widget.repository.private! ? 'Private' : 'Public',
          color: widget.repository.private!
              ? Colors.red
              : Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  Widget _buildTabView() {
    return Expanded(
      child: DefaultTabController(
        length: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.normal),
              isScrollable: true,
              tabs: const [Tab(text: 'About')],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text('Description',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 10),
                      Text(widget.repository.description!,
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 10),
                      _buildLanguagesFuture(),
                      const SizedBox(height: 25),
                      Text('Releases',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 10),
                      _buildReleasesFuture(),
                      const SizedBox(height: 25),
                      Text('Languages',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 15),
                      _buildLanguagesBarFuture(),
                      const SizedBox(height: 10),
                      _buildLanguagesListFuture(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguagesFuture() {
    return FutureBuilder(
      future: repositoryProvider.fetchLanguages(
        owner: widget.repository.owner?.login ?? '',
        repository: widget.repository.name ?? '',
        defaultColor: '#22A87B',
      ),
      builder: (context, AsyncSnapshot<List<Language>> snapshot) {
        if (snapshot.hasError) return const Text('');
        if (!snapshot.hasData) return const Text('');
        return LanguageList(languages: snapshot.data!);
      },
    );
  }

  Widget _buildReleasesFuture() {
    return FutureBuilder(
      future: repositoryProvider.fetchReleases(
        owner: widget.repository.owner?.login ?? '',
        repository: widget.repository.name ?? '',
      ),
      builder: (context, AsyncSnapshot<List<Release>> snapshot) {
        if (snapshot.hasError) return const Text('');
        if (!snapshot.hasData) return const Text('No releases available');
        return ReleaseList(releases: snapshot.data!);
      },
    );
  }

  Widget _buildLanguagesBarFuture() {
    return FutureBuilder(
      future: repositoryProvider.fetchLanguages(
        owner: widget.repository.owner?.login ?? '',
        repository: widget.repository.name ?? '',
      ),
      builder: (context, AsyncSnapshot<List<Language>> snapshot) {
        if (snapshot.hasError) return const Text('');
        if (!snapshot.hasData) return const Text('No language data available');
        return LanguagesBar(languages: snapshot.data!);
      },
    );
  }

  Widget _buildLanguagesListFuture() {
    return FutureBuilder(
      future: repositoryProvider.fetchLanguages(
        owner: widget.repository.owner?.login ?? '',
        repository: widget.repository.name ?? '',
      ),
      builder: (context, AsyncSnapshot<List<Language>> snapshot) {
        if (snapshot.hasError) return const Text('');
        if (!snapshot.hasData) return const Text('No languages available');
        return LanguageList(
          languages: snapshot.data!,
          showPercentages: true,
        );
      },
    );
  }
}
