import '../entities/user_entity.dart';
import '../../data/repositories/user_repository_impl.dart';

class GetUsersUseCase {
  final UserRepositoryImpl _repository;

  GetUsersUseCase(this._repository);

  Future<List<UserEntity>> call({int page = 1}) async {
    return await _repository.getUsers(page: page);
  }
}
