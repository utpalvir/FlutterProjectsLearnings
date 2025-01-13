import 'package:clima_weather/screens/city_screen.dart';
import 'package:clima_weather/services/weather.dart';
import 'package:flutter/material.dart';
import '/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temp;
  int? conditionCode;
  String? cityName;
  String? localTime;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
    print(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        cityName = 'Unknown';
        conditionCode = 0;
        localTime = null;
        return;
      }
      temp = weatherData['current']['temp_c']?.toInt();
      cityName = weatherData['location']['name'];
      conditionCode = weatherData['current']['condition']['code'];
      localTime = weatherData['location']['localtime'];
    });
  }

  WeatherModel weather = WeatherModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Color.fromRGBO(
                    255, 255, 255, 0.8), // Specify RGB with opacity explicitly
                BlendMode.dstATop,
              )),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getWeatherDataTest();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      print(' TypedName $typedName');
                      if (typedName != null) {
                        var response = await weather.getCityWeather(typedName);

                        updateUI(response);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '${weather.getWeatherIcon(conditionCode)}',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Center(
                  child: Text(
                '$localTime',
                style: kLocalTimeStyle,
              )),
              Padding(
                padding: EdgeInsets.only(right: 15.0, bottom: 15.0),
                child: Text(
                  "${weather.getMessage(temp)} $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
