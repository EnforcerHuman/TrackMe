import 'package:flutter/material.dart';
import '../../domain/entities/location_entity.dart';

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
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isTracking ? Icons.my_location : Icons.location_on,
                  color: isTracking ? Colors.green : Colors.blue,
                ),
                const SizedBox(width: 8),
                Text(
                  isTracking ? 'Tracking Active' : 'Trip Details',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),

            if (startLocation != null) ...[
              _buildLocationRow(
                'Start Location',
                '${startLocation!.latitude.toStringAsFixed(6)}, ${startLocation!.longitude.toStringAsFixed(6)}',
                Icons.play_arrow,
                Colors.green,
              ),
              const SizedBox(height: 8),
            ],

            if (endLocation != null) ...[
              _buildLocationRow(
                'End Location',
                '${endLocation!.latitude.toStringAsFixed(6)}, ${endLocation!.longitude.toStringAsFixed(6)}',
                Icons.stop,
                Colors.red,
              ),
              const SizedBox(height: 8),
            ],

            if (totalDistance > 0) ...[
              _buildLocationRow(
                'Total Distance',
                '${totalDistance.toStringAsFixed(2)} km',
                Icons.straighten,
                Colors.blue,
              ),
            ],

            if (startLocation == null && endLocation == null) ...[
              const Text(
                'No location data available.\nTap "Start" to begin tracking.',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

