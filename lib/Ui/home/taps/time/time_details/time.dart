import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/time/time_details/time_resources.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class Time extends StatelessWidget {
  int index;
  String timings;

  Time({required this.index, required this.timings});

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      width: sizeWidth * 0.30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [AppColors.blackColor, AppColors.bronze2Color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Column(
        children: [
          SizedBox(
            height: sizeHeight * 0.02,
          ),
          Text(
            TimeResources.alfardName[index],
            style: AppStyle.bold16white,
          ),
          SizedBox(
            height: sizeHeight * 0.02,
          ),
          Text(
            timings,
            style: AppStyle.bold32white,
          ),
        ],
      ),
    );
  }
}
