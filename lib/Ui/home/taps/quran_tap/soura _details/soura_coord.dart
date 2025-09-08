import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/quran_resources.dart';
import 'package:islami_app/utils/app_style.dart';

class SouraCoord extends StatelessWidget {
  int number;
  String text;
  bool check;

  SouraCoord({required this.number, required this.text, this.check = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        children: [
          Text(
            text,
            style: AppStyle.bold20gold,
          ),
          Text(
            check ? QuranResources.ayaNumberList[number] : "${number + 1}",
            style: AppStyle.bold16gold,
          ),
        ],
      ),
    );
  }
}
