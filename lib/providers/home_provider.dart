import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ghfinder/models/repository.dart';
import 'package:ghfinder/models/user.dart';
import 'package:ghfinder/models/user_details.dart';
import 'package:ghfinder/services/http_service.dart';
import 'package:ghfinder/services/repository_service.dart';
import 'package:ghfinder/services/user_service.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class HomeProvider with ChangeNotifier {
  final HttpService httpService;
  final UserService userService;
  final RepositoryService repositoryService;
  var logger = Logger();

  String currentQuery = '';
  List<User>? users;
  List<Repository>? repositories;
  bool isSearching = false;
  bool isLoading = false;

  final StreamController<String> _streamController = StreamController<String>();
  final TextEditingController searchController = TextEditingController();

  HomeProvider(this.httpService)
      : userService = UserService(httpService),
        repositoryService = RepositoryService(httpService) {
    _streamController.stream
        .debounceTime(const Duration(milliseconds: 500))
        .listen((query) {
      if (query == '') {
        isSearching = false;
      } else {
        isSearching = true;
      }
      notifyListeners();
      fetchRepositories(query);
      fetchUsers(query);
    });

    searchController.addListener(() {
      _streamController.add(searchController.text);
    });
  }

  Future<void> fetchUsers(String query) async {
    try {
      currentQuery = query;
      isLoading = true;
      notifyListeners();

      users = await userService.getUsers(query);
    } catch (e) {
      logger.e("Error fetching users", error: e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchRepositories(String query) async {
    try {
      currentQuery = query;
      isLoading = true;
      notifyListeners();

      repositories = await repositoryService.getRepositories(query);
    } catch (e) {
      logger.e("Error fetching repositories", error: e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<UserDetails> fetchUserDetails(String login) async {
    return userService.getUserDetails(login);
  }

  Future<Repository?>? fetchUserRecentRepository(String login) async {
    return userService.getUserRecentRepository(login);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
