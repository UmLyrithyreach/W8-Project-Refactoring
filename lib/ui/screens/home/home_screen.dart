import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../utils/animations_util.dart';
import '../../states/ride_preferences_state.dart';
import '../home/home_view_model.dart';
import '../home/home_content.dart';
import '../rides_selection/rides_selection_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    final ridePreferencesState = context.read<RidePreferencesState>();
    _viewModel = HomeViewModel(ridePreferencesState);
  }

  void onRidePrefSelected(RidePreference selectedPreference) async {
    _viewModel.selectPreference(selectedPreference);
    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) => HomeContent(
        viewModel: _viewModel,
        onRidePrefSelected: onRidePrefSelected,
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
