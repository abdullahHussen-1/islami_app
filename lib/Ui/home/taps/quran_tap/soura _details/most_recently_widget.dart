import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class MostRecentlyWidget extends StatelessWidget {
  int inde;

  MostRecentlyWidget({this.inde = -1});

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return inde == -1
        ? SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Most Recently",
                style: AppStyle.bold16white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: SizedBox(
                  height: sizeHeight * 0.18,
                  child: ListView.separated(
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          height: sizeHeight * 0.18,
                          width: sizeWidth * 0.75,
                          decoration: BoxDecoration(
                              color: AppColors.goldColor,
                              borderRadius: BorderRadius.circular(23)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    QuranResources
                                        .englishQuranSurahsList[inde + 1],
                                    style: AppStyle.bold24black,
                                  ),
                                  Text(
                                    QuranResources
                                        .arabicQuranSurasList[inde + 1],
                                    style: AppStyle.bold24black,
                                  ),
                                  Text(
                                    "${QuranResources.ayaNumberList[inde + 1]} Verses",
                                    style: AppStyle.bold14black,
                                  )
                                ],
                              ),
                              Image.asset(AppAssets.imgRecent)
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: sizeWidth * 0.03,
                          ),
                      itemCount: 5),
                ),
              ),
            ],
          );
  }
}
