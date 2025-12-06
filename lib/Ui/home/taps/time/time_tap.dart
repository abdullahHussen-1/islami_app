import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/time/azkar_details/azkar.dart';
import 'package:islami_app/Ui/home/taps/time/azkar_details/azkar_resources.dart';
import 'package:islami_app/Ui/home/taps/time/time_details/time.dart';
import 'package:islami_app/Ui/home/taps/time/time_details/time_resources.dart';
import 'package:islami_app/api/apiManager.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_style.dart';

class TimeTap extends StatefulWidget {
  @override
  State<TimeTap> createState() => _TimeTapState();
}

class _TimeTapState extends State<TimeTap> {
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
            child: FutureBuilder(
              future: ApiManager.getTime(city: 'Sohag'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.whiteColor,
                      color: AppColors.blackColor,
                    ),
                  );
                  //todo error from client
                } else if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Something went wrong.",
                        style: AppStyle.bold20black,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.whiteColor,
                        ),
                        onPressed: () {
                          ApiManager.getTime(city: 'Sohag');
                          setState(() {});
                        },
                        child: Text(
                          "Try Again",
                          style: AppStyle.bold14black,
                        ),
                      ),
                    ],
                  );
                  //todo server=>response=>success,error
                } else if (snapshot.data?.status == 'RESOURCE_NOT_FOUND') {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeWidth * 0.04,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Something went wrong data error.",
                          style: AppStyle.bold20black,
                        ),
                        SizedBox(height: sizeHeight * 0.02),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.whiteColor,
                          ),
                          onPressed: () {
                            ApiManager.getTime(city: 'sohag');
                            setState(() {});
                          },
                          child: Text(
                            "Try Again",
                            style: AppStyle.bold14black,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                var time = snapshot.data!.data!;
                List<String> parts = time.date!.readable.toString().split(" ");
                List<String> partsHijri =
                    time.date!.hijri!.month!.en.toString().split(" ");
                var timeList = time.timings!.toList();
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "  ${parts[0]} ${parts[1]},\n  ${parts[2]}",
                          style: AppStyle.bold16white,
                        ),
                        Text(
                          "Pray Time",
                          style: AppStyle.bold20black71,
                        ),
                        Text(
                          partsHijri.length == 1
                              ? "${time.date!.hijri!.day} ${time.date!.hijri!.month!.en},\n${time.date!.hijri!.year}"
                              : "${time.date!.hijri!.day} ${partsHijri.first.substring(0, 1)} ${partsHijri[1].substring(0, 5)},\n${time.date!.hijri!.year}",
                          style: AppStyle.bold16white,
                        )
                      ],
                    ),
                    Text(
                      time.date!.hijri!.weekday!.en.toString(),
                      style: AppStyle.bold20black,
                    ),
                    CarouselSlider.builder(
                      itemCount: TimeResources.alfardName.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Time(
                        index: itemIndex,
                        timings: timeList[itemIndex],
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
                          getNextPrayer(timeList),
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
                );
              },
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
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.azkarDetailsRoute,
                        arguments: index);
                  },
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

  String getNextPrayer(List<String> times) {
    DateTime now = DateTime.now();

    List<DateTime> prayerDateTimes = times.map((t) {
      final parts = t.split(":");
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);
      return DateTime(now.year, now.month, now.day, hour, minute);
    }).toList();

    for (var prayer in prayerDateTimes) {
      if (prayer.isAfter(now)) {
        return "${prayer.hour.toString().padLeft(2, '0')}:${prayer.minute.toString().padLeft(2, '0')}";
      }
    }

    final tomorrow = prayerDateTimes.first.add(Duration(days: 1));
    return "${tomorrow.hour.toString().padLeft(2, '0')}:${tomorrow.minute.toString().padLeft(2, '0')}";
  }
}
