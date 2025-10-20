import 'package:flutter/material.dart';
import '../../domain/entities/location_entity.dart';

class TripSummaryWidget extends StatelessWidget {
  final LocationEntity startLocation;
  final LocationEntity endLocation;
  final double totalDistance;

  const TripSummaryWidget({
    super.key,
    required this.startLocation,
    required this.endLocation,
    required this.totalDistance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Card(
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
                    Icons.route,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Trip Summary',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _buildLocationRow(
                'Start Location',
                '${startLocation.latitude.toStringAsFixed(6)}, ${startLocation.longitude.toStringAsFixed(6)}',
                Icons.play_arrow,
                Colors.green,
              ),
              const SizedBox(height: 12),

              _buildLocationRow(
                'End Location',
                '${endLocation.latitude.toStringAsFixed(6)}, ${endLocation.longitude.toStringAsFixed(6)}',
                Icons.stop,
                Colors.red,
              ),
              const SizedBox(height: 12),

              _buildLocationRow(
                'Total Distance',
                '${totalDistance.toStringAsFixed(2)} km',
                Icons.straighten,
                Colors.blue,
              ),
            ],
          ),
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
        const SizedBox(width: 12),
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
              const SizedBox(height: 2),
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

