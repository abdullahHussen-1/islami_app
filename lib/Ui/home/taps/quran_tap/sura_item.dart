import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_style.dart';

class SuraItem extends StatelessWidget {
  int numberSura;

  SuraItem({
    required this.numberSura,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.souraDetailsRoute,
            arguments: numberSura);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.suraNumber),
              Text(
                "${numberSura + 1}",
                style: AppStyle.bold20white,
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranResources.englishQuranSurahsList[numberSura],
                style: AppStyle.bold20white,
              ),
              Text(
                "${QuranResources.ayaNumberList[numberSura]} Verses",
                style: AppStyle.bold14white,
              )
            ],
          ),
          Spacer(),
          Text(
            QuranResources.arabicQuranSurasList[numberSura],
            style: AppStyle.bold20white,
          ),
        ],
      ),
    );
  }
}
