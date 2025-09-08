import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/time/time_details/time_resources.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class Time extends StatelessWidget {
  int index;

  Time({required this.index});

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: sizeWidth * 0.26,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [AppColors.blackColor, AppColors.bronze2Color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Column(
        children: [
          SizedBox(
            height: 6,
          ),
          Text(
            TimeResources.alfardName[index],
            style: AppStyle.bold16white,
          ),
          Text(
            TimeResources.timeList[index],
            style: AppStyle.bold32white,
          ),
          Text(
            TimeResources.timePeriods[index],
            style: AppStyle.bold16white,
          ),
        ],
      ),
    );
  }
}
