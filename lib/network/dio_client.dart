import 'package:accurate_test/network/api_client.dart';
import 'package:accurate_test/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient implements ApiClient {
  final Dio dio;

  DioClient({
    required this.dio,
  }) {
    dio
      ..options.baseUrl = Constant.BASE_URL
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30);

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
    }
    dio.options.headers['Content-Type'] = 'application/json';
  }

  @override
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    final response = await dio.get(
      path,
      queryParameters: queryParameters,
      data: data,
    );

    return response.data as T;
  }

  @override
  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    final response = await dio.post(
      path,
      queryParameters: queryParameters,
      data: data,
    );

    return response.data as T;
  }
}
