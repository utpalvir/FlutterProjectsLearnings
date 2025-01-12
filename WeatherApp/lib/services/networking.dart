import 'package:clima_weather/services/location.dart';
import 'package:http/http.dart' as http;

const apiKey = '3cda2724651a4d7790e24426251201';

const apiUrl =
    'https://api.weatherapi.com/v1/current.json?key=';


3cda2724651a4d7790e24426251201&q=London&aqi=yes'
class WeatherAPICall {
  String ? apiURL;
  String ? apiKey;

  double? latitude;

  double? longitude;


  WeatherAPICall({
      required this.apiKey , required this.apiURL , this.latitude , this.longitude}
      );

  Future<http.Response> getWeatherData() {
    final weatherData = http.get(Uri.parse('$apiURL$apiKey&q=$latitude,$longitude&aqi=yes'));
    return weatherData;
  }


}
