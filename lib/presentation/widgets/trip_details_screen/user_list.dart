import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackme/presentation/providers/user_provider.dart';
import 'package:trackme/presentation/widgets/user_list_widget.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key, required this.userState});

  final UserState userState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: UserListWidget(
            users: userState.users,
            isLoading: userState.isLoading,
            error: userState.error,
            onRetry: () => context.read<UserNotifier>().getUsers(),
          ),
        ),
      ),
    );
  }
}
