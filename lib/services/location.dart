import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
      return position;
    } catch (e) {
      print('error');
    }
  }
}
//
// double temp = jsonDecode(data)['main']['temp'];
// int condition = jsonDecode(data)['weather'][0]['id'];
// String name = jsonDecode(data)['name'];
