class UserDetails {
  final int? id;
  final String? login;
  final String? name;
  final String? bio;
  final int? followers;
  final String? avatarUrl;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool? siteAdmin;
  final String? company;
  final String? blog;
  final String? location;
  final String? email;
  final bool? hireable;
  final String? twitterUsername;
  final int? publicRepos;
  final int? publicGists;
  final int? following;
  final String? createdAt;
  final String? updatedAt;

  UserDetails({
    this.id,
    this.login,
    this.name,
    this.bio,
    this.followers,
    this.avatarUrl,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  UserDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        login = json['login'],
        name = json['name'] ?? json['login'],
        bio = json['bio'],
        followers = json['followers'],
        avatarUrl = json['avatar_url'],
        url = json['url'],
        htmlUrl = json['html_url'],
        followersUrl = json['followers_url'],
        followingUrl = json['following_url'],
        gistsUrl = json['gists_url'],
        starredUrl = json['starred_url'],
        subscriptionsUrl = json['subscriptions_url'],
        organizationsUrl = json['organizations_url'],
        reposUrl = json['repos_url'],
        eventsUrl = json['events_url'],
        receivedEventsUrl = json['received_events_url'],
        type = json['type'],
        siteAdmin = json['site_admin'],
        company = json['company'],
        blog = json['blog'],
        location = json['location'],
        email = json['email'],
        hireable = json['hireable'],
        twitterUsername = json['twitter_username'],
        publicRepos = json['public_repos'],
        publicGists = json['public_gists'],
        following = json['following'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];
}
