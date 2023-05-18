import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:windy/model/weather_data_current.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:windy/utils/custom_colors.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.w, bottom: 20.w),
          child: Center(
            child: Text(
              "Comfort Level",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.sp,
                  fontFamily: "Poppins",
                  color: CustomColors.textColorBlack),
            ),
          ),
        ),
        SizedBox(
          height: 180.w,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                    max: 100,
                    min: 0,
                    initialValue:
                        weatherDataCurrent.current.humidity!.toDouble(),
                    appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                        handlerSize: 0,
                        trackWidth: 12.w,
                        progressBarWidth: 12.w,

                      ),
                      infoProperties: InfoProperties(
                          bottomLabelText: "Humidity",
                          bottomLabelStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              height: 1.5.sp,
                              fontFamily: "Poppins",
                              color: CustomColors.textColorBlack)),
                      animationEnabled: true,
                      size: 140.w,
                      customColors: CustomSliderColors(
                          hideShadow: true,
                          trackColor:
                              CustomColors.firstGradientColor.withAlpha(100),
                          progressBarColors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor
                          ]),
                    )),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Feels Like ",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            height: 1.sp, fontFamily: "Poppins",
                            color: CustomColors.textColorBlack
                        ),
                      ),
                      TextSpan(
                        text: " ${weatherDataCurrent.current.feels_like}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            height: 1.sp, fontFamily: "Poppins",
                            color: CustomColors.textColorBlack
                        ),
                      ),
                    ]
                  )
                  ),
                  Container(
                    width: 1,
                    height: 25.h,
                    margin: EdgeInsets.only(left: 40.w, right: 40.w),
                    color:  CustomColors.dividerLine,
                  ),
                  RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: "UV Index ",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              height: 1.sp, fontFamily: "Poppins",
                              color: CustomColors.textColorBlack
                          ),
                        ),
                        TextSpan(
                          text: " ${weatherDataCurrent.current.uvi}",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              height: 1.sp, fontFamily: "Poppins",
                              color: CustomColors.textColorBlack
                          ),
                        ),
                      ]
                  )
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
