import 'package:flutter/material.dart';

class WeatherModel {
  DateTime? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var data2 = data;
    var jsonData = data2["forecast"]["forecastday"][0]['day'];
    print(jsonData);

    // date= data["location"]["localtime"];
    //  temp= jsonData["avgtemp_c"];
    //    maxTemp= jsonData["maxtemp_c"];
    //    minTemp= jsonData["mintemp_c"];
    //    weatherStateName= jsonData["condition"]["text"];
    return WeatherModel(
        date: DateTime.parse(data["location"]["localtime"]),
        temp: jsonData["avgtemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        weatherStateName: jsonData["condition"]["text"]);
  }

  @override
  String toString() {
    return 'temp = $temp  maxTemp= $maxTemp';
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'images/rainy.png';
    } else if (weatherStateName == 'Thunder Storm') {
      return 'images/thunderstorm.png';
    } else {
      return 'images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunder Storm') {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }
}
