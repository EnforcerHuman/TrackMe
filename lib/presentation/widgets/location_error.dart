import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackme/presentation/providers/location_provider.dart';

class LocationError extends StatelessWidget {
  final LocationState locationState;
  const LocationError({super.key, required this.locationState});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.error, color: Colors.red.shade600),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              locationState.error!,
              style: TextStyle(color: Colors.red.shade700),
            ),
          ),
          IconButton(
            onPressed: () => context.read<LocationNotifier>().clearError(),
            icon: const Icon(Icons.close),
            color: Colors.red.shade600,
          ),
        ],
      ),
    );
  }
}
