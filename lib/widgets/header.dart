import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:windy/controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}


class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLatitude().value, globalController.getLongitude().value);
    super.initState();
  }
  getAddress(lat, lon)async {
   List<Placemark> placemark =  await placemarkFromCoordinates(lat, lon);
   Placemark place = placemark[0];
   setState(() {
     city = place.locality!;

   });
  }



  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          margin: EdgeInsets.only(left:20.w , right: 20.w),
          alignment: Alignment.topLeft,
          child: Text(city,
          style: TextStyle(
            fontSize: 35.sp,
            fontFamily: "Poppins",
            height: 2.sp,
            fontWeight: FontWeight.w500

          ),),
        ),
        Container(
          margin: EdgeInsets.only(left:20.w , right: 20.w, bottom: 20.w),
          alignment: Alignment.topLeft,
          child: Text(date,
            style: TextStyle(
                fontSize: 14.sp,
              height: 1.sp, fontFamily: "Poppins",
              color: Colors.grey[700]
            ),),
        )
      ],
    );
  }
}


