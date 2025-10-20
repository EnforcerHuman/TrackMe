import 'package:flutter/material.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_users_usecase.dart';

class UserState {
  final bool isLoading;
  final String? error;
  final List<UserEntity> users;

  const UserState({this.isLoading = false, this.error, this.users = const []});

  UserState copyWith({
    bool? isLoading,
    String? error,
    List<UserEntity>? users,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      users: users ?? this.users,
    );
  }
}

class UserNotifier extends ChangeNotifier {
  final GetUsersUseCase _useCase;
  UserState _state = const UserState();

  UserNotifier(this._useCase);

  UserState get state => _state;

  Future<void> getUsers({int page = 1}) async {
    try {
      _state = _state.copyWith(isLoading: true, error: null);
      notifyListeners();

      final users = await _useCase(page: page);

      _state = _state.copyWith(isLoading: false, users: users, error: null);
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        error: e is Failure ? e.message : 'Failed to get users: $e',
      );
      notifyListeners();
    }
  }

  void clearError() {
    _state = _state.copyWith(error: null);
    notifyListeners();
  }
}
