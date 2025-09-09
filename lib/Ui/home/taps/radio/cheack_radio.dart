import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class CheckRadio extends StatelessWidget {
  String text;
  bool click;

  CheckRadio({required this.text, required this.click});

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: sizeHeight * 0.04,
      width: sizeWidth * 0.43,
      decoration: BoxDecoration(
          color: click ? AppColors.goldColor : AppColors.transparentColor,
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        text,
        style: click ? AppStyle.bold16black : AppStyle.bold16white,
      ),
    );
  }
}
