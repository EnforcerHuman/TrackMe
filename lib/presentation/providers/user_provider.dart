import 'package:flutter/material.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_users_usecase.dart';

// State object representing the users list, loading flag and an optional error.
class UserState {
  // Whether a fetch is in progress.
  final bool isLoading;

  // Optional error message when a fetch fails.
  final String? error;

  // Current list of users.
  final List<UserEntity> users;

  const UserState({this.isLoading = false, this.error, this.users = const []});

  // Returns a copy of this state with provided fields replaced.
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

// ChangeNotifier that manages user-related state and exposes it to the UI.
class UserNotifier extends ChangeNotifier {
  // Use case used to fetch users.
  final GetUsersUseCase _useCase;

  // Internal mutable state.
  UserState _state = const UserState();

  // Constructs the notifier with the required use case.
  UserNotifier(this._useCase);

  // Public getter to expose the current immutable state.
  UserState get state => _state;

  // Fetches users for the given page, updates loading/error/users state,
  // and notifies listeners. Exceptions are converted to an error message.
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

  // Clears any existing error message and notifies listeners.
  void clearError() {
    _state = _state.copyWith(error: null);
    notifyListeners();
  }
}
