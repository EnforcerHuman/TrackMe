import '../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../datasources/user_remote_datasource.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers({int page = 1});
}

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<UserEntity>> getUsers({int page = 1}) async {
    try {
      final models = await _remoteDataSource.getUsers(page: page);
      return models
          .map(
            (model) => UserEntity(
              id: model.id,
              name: model.name,
              email: model.email,
              gender: model.gender,
              status: model.status,
            ),
          )
          .toList();
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }
      throw NetworkFailure('Failed to get users: $e');
    }
  }
}
