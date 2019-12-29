import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '265c27f1819e714e8297ccb54c8ad155';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
//    getData();
  }

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    lat = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

//    double temperature = decodedData['main']['temp'];
//    int condition = decodedData['weather'][0]['id'];
//    String city = decodedData ['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
