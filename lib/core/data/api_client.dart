import 'package:chop_gang/core/data/api.dart';
import 'package:chop_gang/core/data/api_interceptor.dart';
import 'package:chop_gang/core/data/error/api_exception.dart';
import 'package:dio/dio.dart';

class ApiClient {
  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: Api.headers,
      ),
    );

    _dio.interceptors.add(ApiInterceptor());
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  late final Dio _dio;

  // GET REQUEST - Specified Response<dynamic>
  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST REQUEST - Specified Response<dynamic>
  Future<Response<dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // PUT REQUEST - Specified Response<dynamic>
  Future<Response<dynamic>> put(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    try {
      return await _dio.put(path, data: data, options: options);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Delete REQUEST - Specified Response<dynamic>
  Future<Response<dynamic>> delete(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    try {
      return await _dio.delete(path, data: data, options: options);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearToken() {
    _dio.options.headers.remove('Authorization');
  }

  Exception _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException('Connection timeout');
      case DioExceptionType.badResponse:
        // Cast to String to fix 'dynamic' assignment error
        final message = error.response?.data is Map
            ? (error.response?.data['message']?.toString() ?? 'Server error')
            : 'Server error';
        return ServerException(
          message,
          statusCode: error.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return NetworkException('Request was cancelled');
      // Added missing enum cases to fix "Invalid use of default"
      case DioExceptionType.badCertificate:
        return NetworkException('Invalid certificate');
      case DioExceptionType.connectionError:
        return NetworkException('No internet connection');
      case DioExceptionType.unknown:
        return Exception('Unexpected error occurred: ${error.message}');
    }
  }
}
