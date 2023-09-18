import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_finder/models/language.dart';
import 'package:github_finder/models/repository.dart';
import 'package:github_finder/models/user.dart';
import 'package:github_finder/models/user_details.dart';
import 'package:github_finder/providers/home_provider.dart';
import 'package:github_finder/providers/repository_provider.dart';
import 'package:github_finder/widgets/ellipsis.dart';
import 'package:github_finder/widgets/language_list.dart';
import 'package:provider/provider.dart';

class UserListItem extends StatefulWidget {
  final User user;

  const UserListItem({Key? key, required this.user}) : super(key: key);

  @override
  UserListItemState createState() => UserListItemState();
}

class UserListItemState extends State<UserListItem> {
  late final HomeProvider homeProvider;
  late final RepositoryProvider repositoryProvider;

  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    repositoryProvider =
        Provider.of<RepositoryProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserDetails>(
      future: homeProvider.fetchUserDetails(widget.user.login),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text('');
        if (!snapshot.hasData) return const Text('');
        return _buildUserCard(snapshot.data!);
      },
    );
  }

  Widget _buildUserCard(UserDetails userDetails) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, '/user', arguments: userDetails),
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
              _buildUserHeader(userDetails),
              const SizedBox(height: 5),
              Ellipsis(text: userDetails.bio ?? 'No bio available.'),
              const SizedBox(height: 10),
              _buildLanguagesFuture(),
              const SizedBox(height: 10),
              Text(userDetails.location ?? 'No Location available'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserHeader(UserDetails userDetails) {
    return Row(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: userDetails.avatarUrl ?? '',
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          userDetails.name ?? 'Not available',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text('${userDetails.followers} followers'),
      ],
    );
  }

  Widget _buildLanguagesFuture() {
    return FutureBuilder<Repository?>(
      future: homeProvider.fetchUserRecentRepository(widget.user.login),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text('');
        if (!snapshot.hasData) return const Text('No languages available');
        return _buildLanguagesList(snapshot.data!);
      },
    );
  }

  Widget _buildLanguagesList(Repository repository) {
    return FutureBuilder<List<Language>>(
      future: repositoryProvider.fetchLanguages(
        owner: widget.user.login,
        repository: repository.name,
        defaultColor: '#2EA4CA',
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text('');
        if (!snapshot.hasData) return const Text('No languages available');
        return LanguageList(languages: snapshot.data!);
      },
    );
  }
}
