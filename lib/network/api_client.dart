abstract class ApiClient {
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });

  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });
}