import 'package:flutter/material.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Start Button
        _buildButton(
          context: context,
          label: 'Start',
          icon: Icons.play_arrow,
          color: Colors.green,
          onPressed: isTracking || isLoading ? null : onStart,
          isLoading: isLoading && !isTracking,
        ),

        // Stop Button
        _buildButton(
          context: context,
          label: 'Stop',
          icon: Icons.stop,
          color: Colors.red,
          onPressed: !isTracking || isLoading ? null : onStop,
          isLoading: isLoading && isTracking,
        ),
      ],
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback? onPressed,
    required bool isLoading,
  }) {
    return SizedBox(
      width: 120,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        child:
            isLoading
                ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}

