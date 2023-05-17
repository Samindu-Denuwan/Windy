import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:windy/api/fetch_weather.dart';
import 'package:windy/model/weather_data.dart';


class GlobalController extends GetxController{
  //create various values
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  //instace for them
RxBool checkLoading() => _isLoading;
RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;
  WeatherData getData(){
    return weatherData.value;
  }

  @override
  void onInit() {
   if(_isLoading.isTrue){
     getLocation();
   }
    super.onInit();
  }

  getLocation()async{
    bool isServiceEnabled;
    LocationPermission locationPermission;

 isServiceEnabled =await Geolocator.isLocationServiceEnabled();
 //return if service is not available
    if(!isServiceEnabled){
      return Future.error("Location not Enabled");
    }

    //status of permission
   locationPermission =  await Geolocator.checkPermission();
    if(locationPermission == LocationPermission.deniedForever){
      return Future.error("Location Permission are Denied Forever");
    }else if(locationPermission == LocationPermission.denied){
      //request new permission
     locationPermission = await Geolocator.requestPermission();

     if(locationPermission == LocationPermission.denied){
       return Future.error("Location Permission is Denied");
     }
    }

    //getting current position of user
    return await Geolocator.getCurrentPosition(
        desiredAccuracy:LocationAccuracy.high ).then((value) {
      //update our latitude and longitude
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      //calling our weather Api
      return FetchWeatherApi().
      processData(value.latitude, value.longitude).then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });

    });

  }


}