import 'package:flutter/material.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../repositories/ride_preference_repository.dart';

class RidePreferencesState extends ChangeNotifier {
  final RidePreferenceRepository _repository;

  RidePreference? _currentPreference;
  List<RidePreference> _history = [];

  final int maxAllowedSeats = 8;

  RidePreferencesState(this._repository) {
    _history = _repository.getHistory();
  }

  RidePreference? get currentPreference => _currentPreference;

  List<RidePreference> get history => _history;

  void selectPreference(RidePreference preference) {
    if (preference != _currentPreference) {
      _currentPreference = preference;
      _repository.addToHistory(preference);
      _history = _repository.getHistory();
      notifyListeners();
    }
  }
}
