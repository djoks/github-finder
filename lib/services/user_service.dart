import 'package:ghfinder/models/repository.dart';
import 'package:ghfinder/models/user.dart';
import 'package:ghfinder/models/user_details.dart';
import 'package:ghfinder/services/http_service.dart';

class UserService {
  final HttpService httpService;

  UserService(this.httpService);

  Future<List<User>> getUsers(String query) async {
    final response = await httpService.get(
      url: '/search/users',
      queryParameters: {'q': query},
    );
    final List<dynamic>? items = response.data['items'];
    if (items == null) {
      return [];
    }
    return items.map((e) => User.fromJson(e)).toList();
  }

  Future<UserDetails> getUserDetails(String login) async {
    final response = await httpService.get(url: '/users/$login');
    final data = response.data;
    return UserDetails.fromJson(data);
  }

  Future<List<Repository>> getUserRepositories(String username) async {
    final response = await httpService.get(url: '/users/$username/repos');
    final List<dynamic>? items = response.data;
    if (items == null) {
      return [];
    }
    return items.map((e) => Repository.fromJson(e)).toList();
  }

  Future<Repository?> getUserRecentRepository(String username) async {
    final response = await httpService.get(url: '/users/$username/repos');
    final List<dynamic>? items = response.data;
    if (items == null || items.isEmpty) {
      return null;
    }
    return Repository.fromJson(items[0]);
  }
}
