import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ghfinder/models/language.dart';
import 'package:ghfinder/models/repository.dart';
import 'package:ghfinder/models/user.dart';
import 'package:ghfinder/models/user_details.dart';
import 'package:ghfinder/pages/user_page.dart';
import 'package:ghfinder/providers/home_provider.dart';
import 'package:ghfinder/providers/repository_provider.dart';
import 'package:ghfinder/widgets/ellipsis.dart';
import 'package:ghfinder/widgets/language_list.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
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
    String? userLogin = widget.user.login;

    String displayLogin = userLogin ?? 'Unknown';

    return FutureBuilder<UserDetails>(
      future: homeProvider.fetchUserDetails(displayLogin),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text('');
        if (!snapshot.hasData) return const Text('');
        return _buildUserCard(snapshot.data!);
      },
    );
  }

  Widget _buildUserCard(UserDetails userDetails) {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: UserPage(userDetails: userDetails),
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
    String? userLogin = widget.user.login;

    String displayLogin = userLogin ?? 'Unknown';

    return FutureBuilder<Repository?>(
      future: homeProvider.fetchUserRecentRepository(displayLogin),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text('');
        if (!snapshot.hasData) return const Text('No languages available');
        return _buildLanguagesList(snapshot.data!);
      },
    );
  }

  Widget _buildLanguagesList(Repository repository) {
    String? repoName = repository.name;

    String displayRepoName = repoName ?? 'Unknown';

    return FutureBuilder<List<Language>>(
      future: repositoryProvider.fetchLanguages(
        owner: widget.user.login ?? '',
        repository: displayRepoName,
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
