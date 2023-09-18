class User {
  final int id;
  final String login;
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
  final double? score;

  User({
    required this.id,
    required this.login,
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
    this.score,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        login = json['login'],
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
        score = json['score']?.toDouble();
}
