import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repositories/location_repository.dart';
import 'repositories/rides_repository.dart';
import 'repositories/ride_preference_repository.dart';
import 'ui/states/ride_preferences_state.dart';
import 'ui/theme/theme.dart';
import 'ui/screens/home/home_screen.dart';

class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blaTheme,
      home: Scaffold(body: HomeScreen()),
    );
  }
}

Widget createApp({
  required LocationRepository locationRepository,
  required RidesRepository ridesRepository,
  required RidePreferenceRepository ridePreferenceRepository,
}) {
  return MultiProvider(
    providers: [
      Provider<LocationRepository>(create: (_) => locationRepository),
      Provider<RidesRepository>(create: (_) => ridesRepository),
      Provider<RidePreferenceRepository>(
        create: (_) => ridePreferenceRepository,
      ),
      ChangeNotifierProvider(
        create: (_) => RidePreferencesState(ridePreferenceRepository),
      ),
    ],
    child: const BlaBlaApp(),
  );
}
