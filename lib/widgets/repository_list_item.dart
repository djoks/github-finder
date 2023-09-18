import 'package:flutter/material.dart';
import 'package:github_finder/models/language.dart';
import 'package:github_finder/models/repository.dart';
import 'package:github_finder/providers/user_provider.dart';
import 'package:github_finder/utils/format_date.dart';
import 'package:github_finder/widgets/app_icon.dart';
import 'package:github_finder/widgets/ellipsis.dart';
import 'package:github_finder/widgets/language_list.dart';
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
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/repository',
          arguments: widget.repository),
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
              _buildRepositoryHeader(),
              const SizedBox(height: 5),
              Ellipsis(
                  text: widget.repository.description ??
                      'No description available.'),
              const SizedBox(height: 5),
              _buildLanguagesFuture(),
              const SizedBox(height: 10),
              Text(
                  'Updated: ${formatDate(widget.repository.updatedAt!, "MM/dd/yyyy")}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRepositoryHeader() {
    return Row(
      children: [
        Text(
          widget.repository.name,
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
        repository: widget.repository.name,
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
