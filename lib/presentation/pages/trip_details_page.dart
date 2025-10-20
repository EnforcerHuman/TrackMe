import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackme/presentation/widgets/trip_details_screen/trip_details_body.dart';
import '../../domain/entities/location_entity.dart';
import '../providers/user_provider.dart';

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
      body: TripDetailsBody(widget: widget, userState: userState),
    );
  }
}
