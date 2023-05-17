import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:windy/controller/global_controller.dart';
import 'package:windy/widgets/current_weather.dart';
import 'package:windy/widgets/header.dart';

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
          globalController.checkLoading().isTrue? const Center(
            child: CircularProgressIndicator(),
          ): Center(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                 SizedBox(height: 10.w),
                 const HeaderWidget(),
                //Current temp
                CurrentWeather(weaterDataCurrent: globalController.getData().getCurrentWeather()),
              ],
            ),
          )),
      ),
    );
  }
}
