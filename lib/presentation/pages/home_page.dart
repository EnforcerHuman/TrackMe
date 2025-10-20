import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trackme/presentation/widgets/location_error.dart';
import '../providers/location_provider.dart';
import '../widgets/location_display_widget.dart';
import '../widgets/tracking_buttons_widget.dart';
import 'trip_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locationState = context.watch<LocationNotifier>().state;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final shouldExit = await _showExitConfirmation();
          if (shouldExit && mounted) {
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'TrackMe',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Location Display
                    LocationDisplayWidget(
                      startLocation: locationState.startLocation,
                      endLocation: locationState.currentLocation,
                      totalDistance: locationState.totalDistance,
                      isTracking: locationState.isTracking,
                    ),

                    const SizedBox(height: 40),

                    // Tracking Buttons
                    TrackingButtonsWidget(
                      isTracking: locationState.isTracking,
                      isLoading: locationState.isLoading,
                      onStart:
                          () =>
                              context.read<LocationNotifier>().startTracking(),
                      onStop:
                          () => context.read<LocationNotifier>().stopTracking(),
                    ),

                    const SizedBox(height: 40),

                    // Continue Button (only show when not tracking and has data)
                    if (!locationState.isTracking &&
                        locationState.startLocation != null &&
                        locationState.currentLocation != null)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _navigateToTripDetails(),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                    // Error Display
                    if (locationState.error != null)
                      LocationError(locationState: locationState),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _showExitConfirmation() async {
    return await showDialog<bool>(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Exit App'),
                content: const Text('Are you sure you want to exit the app?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Exit'),
                  ),
                ],
              ),
        ) ??
        false;
  }

  void _navigateToTripDetails() {
    final locationState = context.read<LocationNotifier>().state;

    if (locationState.startLocation != null &&
        locationState.currentLocation != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder:
              (context) => TripDetailsPage(
                startLocation: locationState.startLocation!,
                endLocation: locationState.currentLocation!,
                totalDistance: locationState.totalDistance,
              ),
        ),
      );
    }
  }
}
