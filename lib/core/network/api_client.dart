import 'package:dio/dio.dart';
import '../constants/app_constants.dart';

class ApiClient {
  static final Dio _dio = Dio();

  static void initialize() {
    _dio.options.baseUrl = AppConstants.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);

    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true, error: true),
    );
  }

  static Dio get instance => _dio;
}

