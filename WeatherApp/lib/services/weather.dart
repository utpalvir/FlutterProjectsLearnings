import 'package:permission_handler/permission_handler.dart';
import 'package:clima_weather/services/location.dart';
import 'package:clima_weather/services/networking.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = '3cda2724651a4d7790e24426251201';

const apiURL = 'https://api.weatherapi.com/v1/current.json?key=';

class WeatherModel {
  double? latitude;
  double? longitude;
  String? cityName;

  WeatherModel({this.latitude, this.longitude, this.cityName});

  Future<dynamic> getWeatherDataTest() async {
    Location location = Location();

    await location.getCurrentLocation();
    final double? latitude = location.latitude;
    final double? longitude = location.longitude;

    WeatherAPICall weather = WeatherAPICall(
        apiKey: apiKey,
        apiURL: apiURL,
        latitude: latitude,
        longitude: longitude,
        cityName: cityName);
    var response = await weather.getWeatherData();
    return response;
  }

  Future<dynamic> getCityWeather(cityName) async {
    dynamic response;
    response = await http.get(Uri.parse('$apiURL$apiKey&q=$cityName&aqi=yes'));
    return jsonDecode(response.body);
  }

  String getWeatherIcon(int? condition) {
    if (condition == null) return '🤷‍';
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int? temp) {
    if (temp == null) {
      return 'Nothing to Show!';
    }
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
