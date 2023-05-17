import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:windy/model/weather_data_current.dart';
import 'package:windy/utils/custom_colors.dart';

class CurrentWeather extends StatelessWidget {
  final WeaterDataCurrent weaterDataCurrent;

  const CurrentWeather({Key? key, required this.weaterDataCurrent})
      : super(key: key);

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weaterDataCurrent.current.weather![0].icon}.png",
          width: 100.w,
          height: 100.w,
        ),
        Container(
          height: 50.w,
          width: 1.w,
          color: CustomColors.dividerLine,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: "${weaterDataCurrent.current.temp!.toInt()}°",
            style: TextStyle(
                fontSize: 68.sp,
                height: 1.sp,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                color: CustomColors.textColorBlack),
          ),
              TextSpan(
                text: "${weaterDataCurrent.current.weather![0].description}",
                style: TextStyle(
                    fontSize: 14.sp,
                    height: 1.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              )
        ]))
      ],
    );
  }

  Widget CurrentWeatherMoreDetailsWidget() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //temp area
        temperatureAreaWidget(),

        // more details
        CurrentWeatherMoreDetailsWidget(),
      ],
    );
  }
}
