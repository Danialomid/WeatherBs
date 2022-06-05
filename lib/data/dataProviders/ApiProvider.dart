
import 'package:dio/dio.dart';

class ApiProvider{
  // var lat = 35.6944;
  // var lon = 51.4215;


  Future<dynamic> sendRequestCurrentWeather(cityname) async {
    var apiKey = 'ff3dc1b7abb61e297479eec257ec60e8';

      var response = await Dio().get(
          "https://api.openweathermap.org/data/2.5/weather",
          queryParameters: {'q': cityname, 'appid': apiKey, 'units': 'metric'});

      // lat = response.data["coord"]["lat"];
      // lon = response.data["coord"]["lon"];

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to current weather");
    }
  }

  Future<dynamic> sendRequest7DaysForcast(lat,lon) async {
    var apiKey = 'ff3dc1b7abb61e297479eec257ec60e8';


    var response = await Dio().get(
          "https://api.openweathermap.org/data/2.5/onecall",
          queryParameters: {
            'lat': lat,
            'lon': lon,
            'exclude': 'minutely,hourly',
            'appid': apiKey,
            'units': 'metric'
          });

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to current weather");
    }
  }
}