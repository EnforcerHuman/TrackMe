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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Trip Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
              Color(0xFFf093fb),
              Color(0xFFf5576c),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Trip Summary - Limited to 40% of screen height
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: TripSummaryWidget(
                    startLocation: widget.startLocation,
                    endLocation: widget.endLocation,
                    totalDistance: widget.totalDistance,
                  ),
                ),
              ),

              // Users Section Header - Compact
              Container(
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
                      child: const Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Users',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Discover people around you',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Users List - Main content taking remaining space
              Expanded(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
