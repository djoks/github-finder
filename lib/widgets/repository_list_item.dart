import 'package:flutter/material.dart';
import 'package:ghfinder/models/language.dart';
import 'package:ghfinder/models/repository.dart';
import 'package:ghfinder/pages/repository_page.dart';
import 'package:ghfinder/providers/user_provider.dart';
import 'package:ghfinder/utils/format_date.dart';
import 'package:ghfinder/widgets/app_icon.dart';
import 'package:ghfinder/widgets/ellipsis.dart';
import 'package:ghfinder/widgets/language_list.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class RepositoryListItem extends StatefulWidget {
  final Repository repository;

  const RepositoryListItem({Key? key, required this.repository})
      : super(key: key);

  @override
  RepositoryListItemState createState() => RepositoryListItemState();
}

class RepositoryListItemState extends State<RepositoryListItem> {
  late final UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    String? repoName = widget.repository.name;
    String? updatedAt = widget.repository.updatedAt;

    String displayName = repoName ?? 'Not available';
    String displayDate = updatedAt != null
        ? formatDate(updatedAt, "MM/dd/yyyy")
        : 'Unknown date';

    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: RepositoryPage(repository: widget.repository),
          withNavBar: false,
        );
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRepositoryHeader(displayName),
              const SizedBox(height: 5),
              Ellipsis(
                  text: widget.repository.description ??
                      'No description available.'),
              const SizedBox(height: 5),
              _buildLanguagesFuture(),
              const SizedBox(height: 10),
              Text('Updated: $displayDate'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRepositoryHeader(String displayName) {
    return Row(
      children: [
        Text(
          displayName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const AppIcon('assets/images/star.png', size: 14),
        const SizedBox(width: 5),
        Text(widget.repository.stargazersCount?.toString() ?? '0'),
      ],
    );
  }

  Widget _buildLanguagesFuture() {
    return FutureBuilder<List<Language>>(
      future: userProvider.fetchRepoLanguages(
        owner: widget.repository.owner?.login ?? '',
        repository: widget.repository.name ?? '',
        defaultColor: '#22A87B',
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text('');
        if (!snapshot.hasData) return const Text('');
        return LanguageList(languages: snapshot.data!);
      },
    );
  }
}
