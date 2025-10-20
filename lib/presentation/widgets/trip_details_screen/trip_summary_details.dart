import 'package:flutter/material.dart';
import 'package:trackme/presentation/pages/trip_details_page.dart';
import 'package:trackme/presentation/widgets/trip_summary_widget.dart';

class TripSummaryDetails extends StatelessWidget {
  const TripSummaryDetails({super.key, required this.widget});

  final TripDetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: TripSummaryWidget(
          startLocation: widget.startLocation,
          endLocation: widget.endLocation,
          totalDistance: widget.totalDistance,
        ),
      ),
    );
  }
}
