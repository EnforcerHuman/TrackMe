import 'package:dio/dio.dart';
import '../../core/network/api_client.dart';
import '../../core/constants/app_constants.dart';
import '../../core/errors/failures.dart';
import '../models/user_model.dart';

/// Abstract interface for remote user data operations
abstract class UserRemoteDataSource {
  /// Fetches users from remote API with pagination support
  Future<List<UserModel>> getUsers({int page = 1});
}

/// Implementation of remote user data source using Dio HTTP client
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  // Use singleton Dio instance for consistent configuration
  final Dio _dio = ApiClient.instance;

  @override
  Future<List<UserModel>> getUsers({int page = 1}) async {
    try {
      // Make GET request to users endpoint with pagination
      final response = await _dio.get(
        '${AppConstants.usersEndpoint}?page=$page',
      );

      // Check if request was successful
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        // Convert JSON data to UserModel objects
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw const NetworkFailure('Failed to fetch users');
      }
    } on DioException catch (e) {
      // Handle specific Dio exceptions with appropriate error messages
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkFailure('Connection timeout');
      } else if (e.type == DioExceptionType.connectionError) {
        throw const NetworkFailure('No internet connection');
      } else {
        throw NetworkFailure('Network error: ${e.message}');
      }
    } catch (e) {
      // Handle any other unexpected errors
      throw NetworkFailure('Unexpected error: $e');
    }
  }
}
