import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  var location = ''.obs;
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
    // timeLimit: Duration(seconds: 4),
  );
  Future<void> getCurrentLocation() async {
    try {
      // Check permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }

      // Get position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
        desiredAccuracy: LocationAccuracy.high,
      );

      // Reverse geocoding
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];

      location.value =
          '${place.street}, ${place.subAdministrativeArea}, ${place.postalCode?? ''}, ${place.country}';
    } catch (e) {
      location.value = 'Location unavailable';
    }
  }
}
