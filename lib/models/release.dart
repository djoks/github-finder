class Release {
  final String url;
  final String assetsUrl;
  final String uploadUrl;
  final String htmlUrl;
  final int id;
  final String nodeId;
  final String tagName;
  final String targetCommitish;
  final String name;
  final bool draft;
  final bool prerelease;
  final String createdAt;
  final String publishedAt;
  final List<dynamic> assets;
  final String tarballUrl;
  final String zipballUrl;
  final String body;
  final Map<String, dynamic> author;
  final Map<String, dynamic> reactions;

  Release({
    this.url = '',
    this.assetsUrl = '',
    this.uploadUrl = '',
    this.htmlUrl = '',
    required this.id,
    this.nodeId = '',
    this.tagName = '',
    this.targetCommitish = '',
    required this.name,
    this.draft = false,
    this.prerelease = false,
    this.createdAt = '',
    this.publishedAt = '',
    this.assets = const [],
    this.tarballUrl = '',
    this.zipballUrl = '',
    this.body = '',
    this.author = const {},
    this.reactions = const {},
  });

  factory Release.fromJson(Map<String, dynamic> json) {
    return Release(
      url: json['url'] ?? '',
      assetsUrl: json['assets_url'] ?? '',
      uploadUrl: json['upload_url'] ?? '',
      htmlUrl: json['html_url'] ?? '',
      id: json['id'],
      nodeId: json['node_id'] ?? '',
      tagName: json['tag_name'] ?? '',
      targetCommitish: json['target_commitish'] ?? '',
      name: json['name'],
      draft: json['draft'] ?? false,
      prerelease: json['prerelease'] ?? false,
      createdAt: json['created_at'] ?? '',
      publishedAt: json['published_at'] ?? '',
      assets: json['assets'] ?? [],
      tarballUrl: json['tarball_url'] ?? '',
      zipballUrl: json['zipball_url'] ?? '',
      body: json['body'] ?? '',
      author: json['author'] ?? {},
      reactions: json['reactions'] ?? {},
    );
  }
}
