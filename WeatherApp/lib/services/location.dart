import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.high,
  distanceFilter: 100,
);

class Location {
  double? latitude;
  double? longitude;

  LocationSettings getLocationSettings() {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    return locationSettings;
  }

  Future<PermissionStatus> getPermissionStatus() async {
    PermissionStatus status1 = await Permission.location.request();
    return status1;
  }

  Future<void> getCurrentLocation() async {
    try {
      getPermissionStatus();
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: getLocationSettings());
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCurrentPosition() async {
    await getPermissionStatus();
  }
}
