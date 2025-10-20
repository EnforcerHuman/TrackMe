import 'package:flutter/material.dart';
import 'glass_widgets.dart';

class TrackingButtonsWidget extends StatelessWidget {
  final bool isTracking;
  final bool isLoading;
  final VoidCallback onStart;
  final VoidCallback onStop;

  const TrackingButtonsWidget({
    super.key,
    required this.isTracking,
    required this.isLoading,
    required this.onStart,
    required this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isTracking)
          GlassButton(
            text: isLoading ? 'Starting...' : 'Start Tracking',
            icon: Icons.play_arrow,
            isLoading: isLoading,
            onPressed: isLoading ? null : onStart,
            gradientStart: Colors.green,
            gradientEnd: Colors.green.shade400,
            width: double.infinity,
            height: 60,
          ),
        if (isTracking)
          GlassButton(
            text: isLoading ? 'Stopping...' : 'Stop Tracking',
            icon: Icons.stop,
            isLoading: isLoading,
            onPressed: isLoading ? null : onStop,
            gradientStart: Colors.red,
            gradientEnd: Colors.red.shade400,
            width: double.infinity,
            height: 60,
          ),
        const SizedBox(height: 16),
        if (isTracking)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange.withOpacity(0.2),
                  Colors.red.withOpacity(0.2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.orange.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Recording in progress...',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
