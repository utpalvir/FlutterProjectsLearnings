import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:clima_weather/services/location.dart';

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
    Location location = Location();

    await location.getCurrentLocation();
    final double? latitude = location.latitude;
    final double? longitude = location.longitude;
    print(latitude);
    print(longitude);
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '15';
    double? myMarginAsDouble;
    getLocation();
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsDouble ?? 30.0),
        color: Colors.red[200],
      ),
    );
  }
}
