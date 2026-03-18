import '../data/dummy_data.dart';
import '../model/ride/ride.dart';
import '../model/ride_pref/ride_pref.dart';
import 'rides_repository.dart';

class MockRidesRepository implements RidesRepository {
  @override
  List<Ride> getRidesFor(RidePreference preferences) {
    return fakeRides
        .where(
          (ride) =>
              ride.departureLocation == preferences.departure &&
              ride.arrivalLocation == preferences.arrival &&
              ride.availableSeats >= preferences.requestedSeats,
        )
        .toList();
  }
}
