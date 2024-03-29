import 'dart:convert';
import 'package:windy/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:windy/model/weather_data_current.dart';
import 'package:windy/model/weather_data_hourly.dart';
import 'package:windy/utils/api_url.dart';

class FetchWeatherApi{
  WeatherData? weatherData;

  //process data from response to json
  Future<WeatherData> processData(lat, lon) async{
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeaterDataCurrent.fromJson(jsonString), WeatherDataHourly.fromJson(jsonString));
    return weatherData!;
  }

}

