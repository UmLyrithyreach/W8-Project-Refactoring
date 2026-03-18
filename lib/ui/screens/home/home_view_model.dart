import 'package:flutter/material.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../states/ride_preferences_state.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferencesState _state;

  HomeViewModel(this._state) {
    _state.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    notifyListeners();
  }

  RidePreference? get currentPreference => _state.currentPreference;

  List<RidePreference> get history => _state.history;

  void selectPreference(RidePreference preference) {
    _state.selectPreference(preference);
  }

  @override
  void dispose() {
    _state.removeListener(_onStateChanged);
    super.dispose();
  }
}
