import 'package:github_finder/models/language.dart';
import 'package:github_finder/models/release.dart';
import 'package:github_finder/models/repository.dart';
import 'package:github_finder/services/http_service.dart';
import 'package:github_finder/utils/parse_languages.dart';
import 'package:logger/logger.dart';

class RepositoryService {
  final HttpService httpService;
  var logger = Logger();

  RepositoryService(this.httpService);

  Future<List<Repository>> getRepositories(String query) async {
    final response = await httpService.get(
      url: '/search/repositories',
      queryParameters: {'q': query},
    );
    final List<dynamic>? items = response.data['items'];
    if (items == null) {
      return [];
    }
    return items.map((e) => Repository.fromJson(e)).toList();
  }

  Future<List<Language>> getLanguages({
    required String owner,
    required String repository,
    String? defaultColor,
  }) async {
    final response =
        await httpService.get(url: '/repos/$owner/$repository/languages');
    final Map<String, int>? items =
        response.data != null ? Map<String, int>.from(response.data) : null;
    if (items == null) {
      return [];
    }
    return await parseLanguages(items, defaultColor: defaultColor);
  }

  Future<List<Release>> getReleases({
    required String owner,
    required String repository,
  }) async {
    final response =
        await httpService.get(url: '/repos/$owner/$repository/releases');
    final List<dynamic>? items = response.data;
    if (items == null || items.isEmpty) {
      return [];
    }
    return items.map((e) => Release.fromJson(e)).toList();
  }
}
