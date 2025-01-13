import 'package:clima_weather/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';

const apiKey = '3cda2724651a4d7790e24426251201';

const apiUrl = 'https://api.weatherapi.com/v1/current.json?key=';

class WeatherAPICall {
  String? apiURL;
  String? apiKey;

  double? latitude;

  double? longitude;

  String? cityName;

  WeatherAPICall(
      {required this.apiKey,
      required this.apiURL,
      this.latitude,
      this.longitude,
      this.cityName});

  Future<Map<String, dynamic>> getWeatherData() async {
    http.Response response;

    if (cityName == null && latitude != null && longitude != null) {
      response = await http
          .get(Uri.parse('$apiURL$apiKey&q=$latitude,$longitude&aqi=yes'));
    } else if (cityName != null) {
      response =
          await http.get(Uri.parse('$apiURL$apiKey&q=$cityName&aqi=yes'));
    } else {
      throw Exception(
          "Insufficient data: Provide either cityName or latitude and longitude.");
    }

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Return decoded JSON data
    } else {
      throw Exception(
          "Failed to load weather data: ${response.statusCode} - ${response.reasonPhrase}");
    }
  }
}
