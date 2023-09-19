import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_finder/models/repository.dart';
import 'package:github_finder/models/user_details.dart';
import 'package:github_finder/providers/user_provider.dart';
import 'package:github_finder/widgets/app_icon.dart';
import 'package:github_finder/widgets/page_view.dart';
import 'package:github_finder/widgets/repository_list.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  final UserDetails userDetails;

  const UserPage({Key? key, required this.userDetails}) : super(key: key);

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  late final UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return AppPageView(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileImage(),
          _buildProfileDetails(),
          _buildTabView(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: widget.userDetails.avatarUrl ?? '',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          widget.userDetails.name!,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Text(
          widget.userDetails.bio ?? 'No bio available.',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        _buildFollowersAndFollowing(),
        const SizedBox(height: 5),
        _buildLocation(),
      ],
    );
  }

  Widget _buildFollowersAndFollowing() {
    return Row(
      children: [
        const AppIcon('assets/images/followers.png', size: 18),
        const SizedBox(width: 5),
        Text('${widget.userDetails.followers} followers'),
        const SizedBox(width: 5),
        const Text('•'),
        const SizedBox(width: 5),
        Text('${widget.userDetails.following} following'),
      ],
    );
  }

  Widget _buildLocation() {
    return Row(
      children: [
        const AppIcon('assets/images/location.png', size: 18),
        const SizedBox(width: 5),
        Text(widget.userDetails.location ?? 'No location available'),
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
              tabs: const [Tab(text: 'Repositories')],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildRepositoriesFuture(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRepositoriesFuture() {
    return FutureBuilder<List<Repository>>(
      future: userProvider.fetchUserRepositories(widget.userDetails.login!),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text('');
        if (!snapshot.hasData) return const Text('');
        return RepositoryList(
          query: userProvider.currentQuery,
          recordCount: userProvider.recordCount,
          repositories: snapshot.data!,
        );
      },
    );
  }
}
