import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ghfinder/config/app.dart';

class HttpService {
  Duration connectTimeout = const Duration(seconds: 50);
  Duration receiveTimeout = const Duration(seconds: 30);
  late BaseOptions baseOptions;
  late Dio dio;

  Map<String, dynamic> getHeaders() {
    String? token = AppConfig.apiToken;
    return {
      HttpHeaders.acceptHeader: "application/vnd.github+json",
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
  }

  HttpService() {
    baseOptions = BaseOptions(
      baseUrl: AppConfig.apiUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: getHeaders(),
      validateStatus: (status) {
        return status! <= 500;
      },
    );

    dio = Dio(baseOptions);
  }

  Future get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return dio.get(url, queryParameters: queryParameters);
    } on DioException catch (e) {
      return e.response;
    }
  }

  Future<Response?> post({required String url, dynamic data}) async {
    try {
      return await dio.post(url, data: data);
    } on DioException catch (e) {
      return e.response;
    }
  }

  Future<Response?> patch({required String url, dynamic data}) async {
    try {
      return await dio.patch(url, data: data);
    } on DioException catch (e) {
      return e.response;
    }
  }
}
