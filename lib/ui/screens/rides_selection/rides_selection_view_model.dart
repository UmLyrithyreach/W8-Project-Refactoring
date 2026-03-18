import 'package:flutter/material.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../repositories/rides_repository.dart';
import '../../states/ride_preferences_state.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferencesState _state;
  final RidesRepository _ridesRepository;

  RideSelectionViewModel(this._state, this._ridesRepository) {
    _state.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  RidePreference? get selectedPreference => _state.currentPreference;

  List<Ride> get matchingRides {
    if (selectedPreference == null) return [];
    return _ridesRepository.getRidesFor(selectedPreference!);
  }

  void updatePreference(RidePreference preference) {
    _state.selectPreference(preference);
  }

  @override
  void dispose() {
    _state.removeListener(_onStateChanged);
    super.dispose();
  }
}
