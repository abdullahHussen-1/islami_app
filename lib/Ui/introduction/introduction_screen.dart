import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_style.dart';

class IntroScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
            titleWidget: Image.asset(
              AppAssets.titleIntro,
              height: sizeHeight * 0.18,
              width: sizeWidth * 0.67,
            ),
            bodyWidget: Column(
              children: [
                Image.asset(
                  AppAssets.welcomeIntro,
                  height: sizeHeight * 0.36,
                  width: sizeWidth * 0.86,
                ),
                SizedBox(
                  height: sizeHeight * 0.08,
                ),
                Text(
                  "Welcome To Islmi App",
                  style: AppStyle.bold24gold,
                )
              ],
            )),
        PageViewModel(
            titleWidget: Image.asset(
              AppAssets.titleIntro,
              height: sizeHeight * 0.18,
              width: sizeWidth * 0.67,
            ),
            bodyWidget: Column(
              children: [
                Image.asset(
                  AppAssets.masjidIntro,
                  height: sizeHeight * 0.34,
                  width: sizeWidth * 0.86,
                ),
                SizedBox(
                  height: sizeHeight * 0.03,
                ),
                Text(
                  "Welcome To Islami",
                  style: AppStyle.bold24gold,
                ),
                SizedBox(
                  height: sizeHeight * 0.04,
                ),
                Text(
                  "We Are Very Excited To Have You In Our",
                  style: AppStyle.bold16gold,
                ),
                Text(
                  "Community",
                  style: AppStyle.bold20gold,
                )
              ],
            )),
        PageViewModel(
            titleWidget: Image.asset(
              AppAssets.titleIntro,
              height: sizeHeight * 0.18,
              width: sizeWidth * 0.67,
            ),
            bodyWidget: Column(
              children: [
                Image.asset(
                  AppAssets.quranIntro,
                  height: sizeHeight * 0.36,
                  width: sizeWidth * 0.86,
                ),
                SizedBox(
                  height: sizeHeight * 0.03,
                ),
                Text(
                  "Reading the Quran",
                  style: AppStyle.bold24gold,
                ),
                SizedBox(
                  height: sizeHeight * 0.05,
                ),
                Text(
                  "Read, and your Lord is the Most Generous",
                  style: AppStyle.bold16gold,
                ),
              ],
            )),
        PageViewModel(
            titleWidget: Image.asset(
              AppAssets.titleIntro,
              height: sizeHeight * 0.18,
              width: sizeWidth * 0.67,
            ),
            bodyWidget: Column(
              children: [
                Image.asset(
                  AppAssets.bearishIntro,
                  height: sizeHeight * 0.36,
                  width: sizeWidth * 0.86,
                ),
                SizedBox(
                  height: sizeHeight * 0.03,
                ),
                Text(
                  "Bearish",
                  style: AppStyle.bold24gold,
                ),
                SizedBox(
                  height: sizeHeight * 0.04,
                ),
                Text(
                  "Praise the name of your Lord, the Most",
                  style: AppStyle.bold16gold,
                ),
                Text(
                  "High",
                  style: AppStyle.bold16gold,
                )
              ],
            )),
        PageViewModel(
            titleWidget: Image.asset(
              AppAssets.titleIntro,
              height: sizeHeight * 0.18,
              width: sizeWidth * 0.67,
            ),
            bodyWidget: Column(
              children: [
                Image.asset(
                  AppAssets.radioIntro,
                  height: sizeHeight * 0.36,
                  width: sizeWidth * 0.86,
                ),
                SizedBox(
                  height: sizeHeight * 0.03,
                ),
                Text(
                  "Holy Quran Radio",
                  style: AppStyle.bold24gold,
                ),
                SizedBox(
                  height: sizeHeight * 0.04,
                ),
                Text(
                  "You can listen to the Holy Quran Radio through the application for free and easily",
                  style: AppStyle.bold16gold,
                ),
              ],
            )),
      ],
      dotsDecorator: DotsDecorator(
        size: Size.square(5),
        activeSize: Size(20, 10),
        activeColor: AppColors.goldColor,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      next: Text("Next", style: AppStyle.bold16gold),
      back: Text(
        "Back",
        style: AppStyle.bold16gold,
      ),
      done: Text("Finish", style: AppStyle.bold16gold),
      onDone: () {
        Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
      },
      showBackButton: true,
    );
  }
}
