import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

final locationProvider = StateNotifierProvider<LocationNotifier, String>((ref) {
  return LocationNotifier();
});

class LocationNotifier extends StateNotifier<String> {
  LocationNotifier() : super('Loading...') {
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      state = 'Location services are disabled.';
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        state = 'Location permissions are denied';
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      state = 'Location permissions are permanently denied, we cannot request permissions.';
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    _getAddressFromLatLng(position);
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        state = placemark.subLocality ?? placemark.locality ?? 'Unknown location';
      } else {
        state = 'No address available';
      }
    } catch (e) {
      state = 'Failed to get address';
    }
  }
}
