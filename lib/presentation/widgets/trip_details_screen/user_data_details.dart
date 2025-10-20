import 'package:flutter/material.dart';
import 'package:trackme/presentation/pages/trip_details_page.dart';
import 'package:trackme/presentation/widgets/trip_details_screen/user_data_title.dart';

class UserDataDetails extends StatelessWidget {
  const UserDataDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(Icons.people, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          // shows user Data title widget
          UserDataTitle(),
        ],
      ),
    );
  }
}
