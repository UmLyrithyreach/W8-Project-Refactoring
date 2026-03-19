import 'package:flutter/material.dart';
import 'main_common.dart';
import 'repositories/mock_location_repository.dart';
import 'repositories/mock_rides_repository.dart';
import 'repositories/mock_ride_preference_repository.dart';

void main() {
  final app = createApp(
    locationRepository: MockLocationRepository(),
    ridesRepository: MockRidesRepository(),
    ridePreferenceRepository: MockRidePreferenceRepository(),
  );
  runApp(app);
}
