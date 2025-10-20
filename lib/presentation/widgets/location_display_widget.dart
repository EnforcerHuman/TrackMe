import 'package:flutter/material.dart';
import '../../domain/entities/location_entity.dart';
import 'glass_widgets.dart';

class LocationDisplayWidget extends StatelessWidget {
  final LocationEntity? startLocation;
  final LocationEntity? endLocation;
  final double totalDistance;
  final bool isTracking;

  const LocationDisplayWidget({
    super.key,
    this.startLocation,
    this.endLocation,
    required this.totalDistance,
    required this.isTracking,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final isSmallScreen = screenWidth < 360;
    final isMediumScreen = screenWidth >= 360 && screenWidth < 600;

    // Responsive dimensions
    final iconSize =
        isSmallScreen
            ? 20.0
            : isMediumScreen
            ? 22.0
            : 24.0;
    final titleFontSize =
        isSmallScreen
            ? 16.0
            : isMediumScreen
            ? 18.0
            : 20.0;
    final subtitleFontSize =
        isSmallScreen
            ? 12.0
            : isMediumScreen
            ? 13.0
            : 14.0;
    final statusFontSize =
        isSmallScreen
            ? 10.0
            : isMediumScreen
            ? 11.0
            : 12.0;
    final containerPadding =
        isSmallScreen
            ? 8.0
            : isMediumScreen
            ? 10.0
            : 12.0;
    final spacing =
        isSmallScreen
            ? 12.0
            : isMediumScreen
            ? 16.0
            : 20.0;
    final verticalSpacing =
        isSmallScreen
            ? 16.0
            : isMediumScreen
            ? 20.0
            : 24.0;

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(containerPadding),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:
                        isTracking
                            ? [Colors.green, Colors.green.shade400]
                            : [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: (isTracking ? Colors.green : Colors.blue)
                          .withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  isTracking ? Icons.my_location : Icons.location_on,
                  color: Colors.white,
                  size: iconSize,
                ),
              ),
              SizedBox(width: spacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isTracking ? 'Tracking Active' : 'Trip Details',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isTracking
                          ? 'Recording your route in real-time'
                          : 'Ready to start your journey',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: subtitleFontSize,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 8 : 12,
                  vertical: isSmallScreen ? 4 : 6,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:
                        isTracking
                            ? [Colors.green, Colors.green.shade400]
                            : [Colors.grey, Colors.grey.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: (isTracking ? Colors.green : Colors.grey)
                          .withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  isTracking ? 'LIVE' : 'READY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: statusFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: verticalSpacing),

          if (startLocation != null) ...[
            _buildGlassLocationRow(
              'Start Location',
              '${startLocation!.latitude.toStringAsFixed(6)}, ${startLocation!.longitude.toStringAsFixed(6)}',
              Icons.play_arrow,
              [Colors.green, Colors.green.shade400],
              context,
            ),
            SizedBox(height: spacing),
          ],

          if (endLocation != null) ...[
            _buildGlassLocationRow(
              'Current Location',
              '${endLocation!.latitude.toStringAsFixed(6)}, ${endLocation!.longitude.toStringAsFixed(6)}',
              Icons.location_on,
              [Colors.blue, Colors.blue.shade400],
              context,
            ),
            SizedBox(height: spacing),
          ],

          if (isTracking || totalDistance > 0) ...[
            Container(
              padding: EdgeInsets.all(
                isSmallScreen
                    ? 16
                    : isMediumScreen
                    ? 18
                    : 20,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(
                      isSmallScreen
                          ? 8
                          : isMediumScreen
                          ? 10
                          : 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.straighten,
                      color: Colors.white,
                      size: iconSize,
                    ),
                  ),
                  SizedBox(width: spacing),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Distance',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: subtitleFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${totalDistance.toStringAsFixed(2)} km',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                isSmallScreen
                                    ? 20
                                    : isMediumScreen
                                    ? 22
                                    : 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

          if (startLocation == null && endLocation == null) ...[
            Container(
              padding: EdgeInsets.all(
                isSmallScreen
                    ? 16
                    : isMediumScreen
                    ? 18
                    : 20,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.withOpacity(0.1),
                    Colors.grey.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.location_searching,
                    color: Colors.white.withOpacity(0.6),
                    size:
                        isSmallScreen
                            ? 40
                            : isMediumScreen
                            ? 44
                            : 48,
                  ),
                  SizedBox(
                    height:
                        isSmallScreen
                            ? 8
                            : isMediumScreen
                            ? 10
                            : 12,
                  ),
                  Text(
                    'No location data available',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize:
                          isSmallScreen
                              ? 14
                              : isMediumScreen
                              ? 15
                              : 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tap "Start" to begin tracking your journey',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize:
                          isSmallScreen
                              ? 12
                              : isMediumScreen
                              ? 13
                              : 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildGlassLocationRow(
    String label,
    String value,
    IconData icon,
    List<Color> gradientColors,
    BuildContext context,
  ) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final isSmallScreen = screenWidth < 360;
    final isMediumScreen = screenWidth >= 360 && screenWidth < 600;

    // Responsive dimensions for location rows
    final rowPadding =
        isSmallScreen
            ? 12.0
            : isMediumScreen
            ? 14.0
            : 16.0;
    final iconPadding =
        isSmallScreen
            ? 6.0
            : isMediumScreen
            ? 7.0
            : 8.0;
    final iconSize =
        isSmallScreen
            ? 16.0
            : isMediumScreen
            ? 18.0
            : 20.0;
    final labelFontSize =
        isSmallScreen
            ? 10.0
            : isMediumScreen
            ? 11.0
            : 12.0;
    final valueFontSize =
        isSmallScreen
            ? 12.0
            : isMediumScreen
            ? 13.0
            : 14.0;
    final spacing =
        isSmallScreen
            ? 8.0
            : isMediumScreen
            ? 10.0
            : 12.0;

    return Container(
      padding: EdgeInsets.all(rowPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradientColors.first.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(iconPadding),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: iconSize),
          ),
          SizedBox(width: spacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: labelFontSize,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: valueFontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
