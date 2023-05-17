import 'package:windy/model/weather_data_current.dart';

class WeatherData{
  final WeaterDataCurrent? current;

  WeatherData([this.current]);

  //function to fetch these
WeaterDataCurrent getCurrentWeather()=> current!;



}