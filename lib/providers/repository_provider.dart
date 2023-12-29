import 'package:flutter/material.dart';
import 'package:ghfinder/models/language.dart';
import 'package:ghfinder/models/release.dart';
import 'package:ghfinder/models/repository.dart';
import 'package:ghfinder/services/http_service.dart';
import 'package:ghfinder/services/repository_service.dart';

class RepositoryProvider with ChangeNotifier {
  final HttpService httpService;
  final RepositoryService repositoryService;

  String currentQuery = '';
  int? recordCount = 0;
  List<Repository>? repositories;
  bool isLoading = false;

  RepositoryProvider(this.httpService)
      : repositoryService = RepositoryService(httpService);

  Future<List<Language>> fetchLanguages(
      {required String owner,
      required String repository,
      String? defaultColor}) async {
    return repositoryService.getLanguages(
        owner: owner, repository: repository, defaultColor: defaultColor);
  }

  Future<List<Release>> fetchReleases(
      {required String owner, required String repository}) async {
    return repositoryService.getReleases(owner: owner, repository: repository);
  }
}
