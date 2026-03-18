import '../model/ride_pref/ride_pref.dart';
import 'ride_preference_repository.dart';

class MockRidePreferenceRepository implements RidePreferenceRepository {
  final List<RidePreference> _history = [];

  @override
  List<RidePreference> getHistory() {
    return List.from(_history);
  }

  @override
  void addToHistory(RidePreference preference) {
    _history.add(preference);
  }
}
