import 'package:flutter/material.dart';
import 'package:trackme/presentation/pages/trip_details_page.dart';
import 'package:trackme/presentation/providers/user_provider.dart';
import 'package:trackme/presentation/widgets/trip_details_screen/trip_summary_details.dart';
import 'package:trackme/presentation/widgets/trip_details_screen/user_data_details.dart';
import 'package:trackme/presentation/widgets/trip_details_screen/user_list.dart';

class TripDetailsBody extends StatelessWidget {
  const TripDetailsBody({
    super.key,
    required this.widget,
    required this.userState,
  });

  final TripDetailsPage widget;
  final UserState userState;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            TripSummaryDetails(widget: widget),

            // Users Section Header - Compact
            UserDataDetails(),

            // Users List - Main content taking remaining space
            UsersList(userState: userState),
          ],
        ),
      ),
    );
  }
}
