import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:windy/model/weather_data_daily.dart';
import 'package:windy/utils/custom_colors.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
   const DailyDataForecast({Key? key, required this.weatherDataDaily}) : super(key: key);

   //string manipulation
  String getDay(final day){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day *1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

   Widget dailyList(){
     return SizedBox(
       height: 300.h,
       child: ListView.builder(
         scrollDirection: Axis.vertical,
         itemCount:weatherDataDaily.daily.length >7? 7 :weatherDataDaily.daily.length ,
           itemBuilder: (context, index) {
             return Column(
               children: [
                 Container(
                   height: 60.h,
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Text(getDay(weatherDataDaily.daily[index].dt),
               style: TextStyle(
                   fontSize: 13.sp,
                   fontWeight: FontWeight.normal,
                   height: 1.sp, fontFamily: "Poppins",
                   color:CustomColors.textColorBlack
               ),),),
                  SizedBox(
                    width: 50.w,
                    height: 50.w,
                    // child: Image.asset(
                    //     "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png")),
                    child: Lottie.asset("assets/animations/${weatherDataDaily.daily[index].weather![0].icon}.json")),
                 Text(' ${weatherDataDaily.daily[index].temp!.max}° / ${weatherDataDaily.daily[index].temp!.min}° ',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                          height: 1.sp, fontFamily: "Poppins",
                          color:CustomColors.textColorBlack
                      ),),


                ],

              )
                   ,
               ),
                 Container(
                   height: 1.5,
                   color: CustomColors.dividerLine,
                 )

               ],
             );
           },),
     );
   }


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 380.h,
      margin: EdgeInsets.all(15.w),
      padding:  EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5.w, bottom: 8.w),
            alignment: Alignment.topLeft,
            child:  Text("Next Days",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.sp, fontFamily: "Poppins",
                  color:CustomColors.textColorBlack
              ),),

          ),
          dailyList(),
        ],
      ),
    );
  }
}
