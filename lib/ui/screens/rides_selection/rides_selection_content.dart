import 'package:flutter/material.dart';
import '../../../model/ride/ride.dart';
import '../../theme/theme.dart';
import 'rides_selection_view_model.dart';
import 'widgets/rides_selection_header.dart';
import 'widgets/rides_selection_tile.dart';

class RideSelectionContent extends StatelessWidget {
  final RideSelectionViewModel viewModel;
  final VoidCallback onBackPressed;
  final VoidCallback onFilterPressed;
  final VoidCallback onPreferencePressed;
  final Function(Ride) onRideSelected;

  const RideSelectionContent({
    required this.viewModel,
    required this.onBackPressed,
    required this.onFilterPressed,
    required this.onPreferencePressed,
    required this.onRideSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: viewModel.selectedPreference!,
              onBackPressed: onBackPressed,
              onFilterPressed: onFilterPressed,
              onPreferencePressed: onPreferencePressed,
            ),
            SizedBox(height: 100),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: viewModel.matchingRides[index],
                  onPressed: () =>
                      onRideSelected(viewModel.matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
