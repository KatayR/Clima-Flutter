import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weathery/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  initState() {
    readyTheData();
    super.initState();
  }

  void readyTheData() async {
    await Geolocator.requestPermission();
    var weatherData = await WeatherModel().getweatherData();
    if (mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 120,
        ),
      ),
    );
  }
}
