import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../repositories/rides_repository.dart';
import '../../../utils/animations_util.dart' show AnimationUtils;
import '../../states/ride_preferences_state.dart';
import 'rides_selection_view_model.dart';
import 'rides_selection_content.dart';
import 'widgets/ride_preference_modal.dart';

class RidesSelectionScreen extends StatefulWidget {
  const RidesSelectionScreen({super.key});

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  late RideSelectionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    final ridePreferencesState = context.read<RidePreferencesState>();
    final ridesRepository = context.read<RidesRepository>();
    _viewModel = RideSelectionViewModel(ridePreferencesState, ridesRepository);
  }

  void onBackTap() {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(Ride ride) {
    // TODO
  }

  void onPreferencePressed() async {
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(
              initialPreference: _viewModel.selectedPreference!,
            ),
          ),
        );

    if (newPreference != null) {
      _viewModel.updatePreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) => RideSelectionContent(
        viewModel: _viewModel,
        onBackPressed: onBackTap,
        onFilterPressed: onFilterPressed,
        onPreferencePressed: onPreferencePressed,
        onRideSelected: onRideSelected,
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
