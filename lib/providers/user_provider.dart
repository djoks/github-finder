import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github_finder/models/language.dart';
import 'package:github_finder/models/repository.dart';
import 'package:github_finder/models/user.dart';
import 'package:github_finder/services/http_service.dart';
import 'package:github_finder/services/repository_service.dart';
import 'package:github_finder/services/user_service.dart';
import 'package:logger/logger.dart';

class UserProvider with ChangeNotifier {
  final HttpService httpService;
  final UserService userService;
  final RepositoryService repositoryService;
  var logger = Logger();

  String currentQuery = '';
  int? recordCount = 0;
  List<User>? repositories;
  bool isLoading = false;

  UserProvider(this.httpService)
      : userService = UserService(httpService),
        repositoryService = RepositoryService(httpService);

  Future<List<Repository>> fetchUserRepositories(String login) async {
    return userService.getUserRepositories(login);
  }

  Future<List<Language>> fetchRepoLanguages(
      {required String owner,
      required String repository,
      String? defaultColor}) async {
    return repositoryService.getLanguages(
        owner: owner, repository: repository, defaultColor: defaultColor);
  }
}
