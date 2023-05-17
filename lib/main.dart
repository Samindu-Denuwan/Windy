import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:windy/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 780),
        builder: (context, child) => const GetMaterialApp(
          home:  HomeScreen(),
          title: "Weather",
          debugShowCheckedModeBanner: false,

        ));
  }
}
