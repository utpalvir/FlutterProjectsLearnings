import 'package:clima_weather/screens/location_screen.dart';
import 'package:clima_weather/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:clima_weather/services/location.dart';
import 'package:clima_weather/services/networking.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.high,
  distanceFilter: 100,
);

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    print('Deactivate Called');
  }

  void getLocation() async {
    WeatherModel weather = WeatherModel();
    var locationWeather = await weather.getWeatherDataTest();
    print(locationWeather);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: locationWeather,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '15';
    double? myMarginAsDouble;
    getLocation();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white, size: 250.0),
      ),
    );
  }
}
