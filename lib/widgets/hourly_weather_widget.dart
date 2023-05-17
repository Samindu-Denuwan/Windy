import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:windy/controller/global_controller.dart';
import 'package:windy/model/weather_data_hourly.dart';
import 'package:windy/utils/custom_colors.dart';

class HourlyWeather extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyWeather({Key? key, required this.weatherDataHourly}) : super(key: key);

  //card index
  RxInt cardIndex = GlobalController().getIndex();

  Widget hourlyList(){
    return Container(
      height: 160.h,
      padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12 ? 12 : weatherDataHourly.hourly.length,
          itemBuilder: (context, index) {
            return Obx(() => GestureDetector(
              onTap: (){
                cardIndex.value = index;
              },
              child: Container(
                width: 80.w,
                margin: EdgeInsets.only(left: 15.w, right: 5.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.5,0),
                          blurRadius: 30,
                          spreadRadius: 1,
                          color: CustomColors.dividerLine.withAlpha(150)
                      )
                    ],
                    gradient: cardIndex.value == index? const LinearGradient(colors:[
                      CustomColors.firstGradientColor,CustomColors.secondGradientColor]): null
                ),
                child: HourlyDetails(
                  temp: weatherDataHourly.hourly[index].temp!,
                  timeStamp: weatherDataHourly.hourly[index].dt!,
                  weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!,
                  cardIndex: index,
                  currentIndex: cardIndex.toInt(),
                ),
              ),
            ));
          },),

    );
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Text(
            "Today", style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        height: 1.sp, fontFamily: "Poppins",
        color: Colors.grey[700]
    ),
      textAlign: TextAlign.center,)
          ),
        hourlyList(),

      ],
    );
  }
}


//hourly details class
class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  String weatherIcon;
  int cardIndex;
  int currentIndex;

  String getTime(final timeStamp){
   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(dateTime);
    return x;

  }

  HourlyDetails({Key? key, required this.timeStamp,
    required this.temp,required this.weatherIcon,
    required this.cardIndex,required this.currentIndex,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Container(
           margin: EdgeInsets.only(top: 10.w),
           child: Text(getTime(timeStamp),
             style: TextStyle(
                 fontSize: 14.sp,
                 fontWeight: FontWeight.w400,
                 height: 1.sp, fontFamily: "Poppins",
                 color: cardIndex == currentIndex? Colors.white: CustomColors.textColorBlack
             ),
           ),
         ),
         Container(
           margin: EdgeInsets.only(top: 5.w),
           width: 40.w,
           height: 40.w,
           child: Image.asset("assets/weather/$weatherIcon.png"),

         ),
         Container(
           margin: EdgeInsets.only(bottom: 10.w),
           child: Text('$temp°',
             style: TextStyle(
                 fontSize: cardIndex == currentIndex?16.sp : 14.sp,
                 fontWeight: FontWeight.w400,
                 height: 1.sp, fontFamily: "Poppins",
                 color: cardIndex == currentIndex? Colors.white: CustomColors.textColorBlack
             ),),
         ),
       ],
    );
  }
}

