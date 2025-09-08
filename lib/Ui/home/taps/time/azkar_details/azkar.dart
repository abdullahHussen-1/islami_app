import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/time/azkar_details/azkar_resources.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class Azkar extends StatelessWidget {
  int index;

  Azkar({required this.index});

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      height: sizeHeight * 0.27,
      width: sizeWidth * 0.42,
      decoration: BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: AppColors.goldColor)),
      child: Column(
        children: [
          Image.asset(
            AzkarResources.azkarList[index].image,
            height: sizeHeight * 0.18,
            width: sizeWidth * 0.42,
          ),
          Text(
            AzkarResources.azkarList[index].zkar,
            style: AppStyle.bold20white,
          )
        ],
      ),
    );
  }
}
