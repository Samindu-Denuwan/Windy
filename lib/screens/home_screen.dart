import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:windy/controller/global_controller.dart';
import 'package:windy/utils/custom_colors.dart';
import 'package:windy/widgets/comfort_level.dart';
import 'package:windy/widgets/current_weather.dart';
import 'package:windy/widgets/daily_data_forecast.dart';
import 'package:windy/widgets/header.dart';
import 'package:windy/widgets/hourly_weather_widget.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Obx(() =>
          globalController.checkLoading().isTrue?  Center(
            child: Lottie.asset("assets/animations/splash.json"),
          ): Center(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                 SizedBox(height: 10.w),
                 const HeaderWidget(),
                //Current temp
                CurrentWeather(weaterDataCurrent: globalController.getData().getCurrentWeather()),
                SizedBox(height: 15.w),
                HourlyWeather(weatherDataHourly: globalController.getData().getHourlyWeather()),
                SizedBox(height: 15.w),
                 DailyDataForecast(weatherDataDaily: globalController.getData().getDailyWeather()),
                SizedBox(height: 8.w),
                Container(
                  height: 1,
                  color: CustomColors.dividerLine,
                ),
                SizedBox(height: 10.w),
                ComfortLevel(weatherDataCurrent: globalController.getData().getCurrentWeather()),

              ]
              ,
            ),
          )),
      ),
    );
  }
}
