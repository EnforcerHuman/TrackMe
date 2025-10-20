import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/location_entity.dart';
import '../providers/user_provider.dart';
import '../widgets/user_list_widget.dart';
import '../widgets/trip_summary_widget.dart';

class TripDetailsPage extends StatefulWidget {
  final LocationEntity startLocation;
  final LocationEntity endLocation;
  final double totalDistance;

  const TripDetailsPage({
    super.key,
    required this.startLocation,
    required this.endLocation,
    required this.totalDistance,
  });

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  @override
  void initState() {
    super.initState();
    // Load users when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserNotifier>().getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserNotifier>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Trip Summary
          TripSummaryWidget(
            startLocation: widget.startLocation,
            endLocation: widget.endLocation,
            totalDistance: widget.totalDistance,
          ),

          const Divider(),

          // Users List
          Expanded(
            child: UserListWidget(
              users: userState.users,
              isLoading: userState.isLoading,
              error: userState.error,
              onRetry: () => context.read<UserNotifier>().getUsers(),
            ),
          ),
        ],
      ),
    );
  }
}
