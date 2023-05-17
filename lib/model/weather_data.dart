import 'package:windy/model/weather_data_current.dart';
import 'package:windy/model/weather_data_hourly.dart';

class WeatherData{
  final WeaterDataCurrent? current;
  final WeatherDataHourly? hourly;

  WeatherData([ this.current, this.hourly]);

  //function to fetch these
WeaterDataCurrent getCurrentWeather()=> current!;
  WeatherDataHourly getHourlyWeather()=> hourly!;



}