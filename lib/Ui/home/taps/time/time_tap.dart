import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/time/azkar_details/azkar.dart';
import 'package:islami_app/Ui/home/taps/time/azkar_details/azkar_resources.dart';
import 'package:islami_app/Ui/home/taps/time/time_details/time.dart';
import 'package:islami_app/Ui/home/taps/time/time_details/time_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class TimeTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: sizeWidth * 0.90,
            height: sizeHeight * 0.38,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AppAssets.timeBackground,
                    ),
                    fit: BoxFit.fill),
                color: AppColors.bronzeColor,
                borderRadius: BorderRadius.circular(32)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "08 Sept,\n2025",
                      style: AppStyle.bold16white,
                    ),
                    Text(
                      "Pray Time",
                      style: AppStyle.bold20black71,
                    ),
                    Text(
                      "15 Rabi1,\n1447",
                      style: AppStyle.bold16white,
                    )
                  ],
                ),
                Text(
                  "Monday",
                  style: AppStyle.bold20black,
                ),
                CarouselSlider.builder(
                  itemCount: TimeResources.alfardName.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Time(
                    index: itemIndex,
                  ),
                  options: CarouselOptions(
                    height: sizeHeight * 0.18,
                    viewportFraction: 0.4,
                    initialPage: 3,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.15,
                    onPageChanged: (index, reason) {},
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Spacer(),
                    Text(
                      "Next Pray - ",
                      style: AppStyle.bold20black71,
                    ),
                    Text(
                      TimeResources.timeList[3],
                      style: AppStyle.bold20black,
                    ),
                    SizedBox(
                      width: sizeWidth * 0.1,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.volume_off,
                          color: AppColors.blackColor,
                          size: 30,
                        ))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: sizeHeight * 0.02, horizontal: sizeWidth * 0.04),
            child: Text(
              "Azkar",
              style: AppStyle.bold16white,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: AzkarResources.azkarList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Azkar(
                    index: index,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
