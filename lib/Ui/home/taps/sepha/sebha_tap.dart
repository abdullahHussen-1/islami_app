import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/sepha/sepha_details/sepha_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_style.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  double turns = 0;
  int index = 0;
  int clickSebha = 0;
  bool checkDuea = false;

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: sizeHeight * 0.02,
          ),
          Center(
            child: Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: AppStyle.bold36white,
            ),
          ),
          SizedBox(
            height: sizeHeight * 0.02,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedRotation(
                turns: turns,
                duration: Duration(seconds: 1),
                child: Image.asset(
                  AppAssets.sebhaBg,
                  height: sizeHeight * 0.49,
                  width: sizeWidth * 0.88,
                ),
              ),
              GestureDetector(
                onTap: () {
                  turns += 0.03;
                  clickSebha++;
                  checkDuea = false;
                  if (clickSebha == 34) {
                    turns = 0;
                    clickSebha = 0;
                    checkDuea = false;
                    if (index < SephaResources.sephaList.length - 1) {
                      index++;
                    } else {
                      index = 0;
                      checkDuea = true;
                    }
                  }

                  setState(() {});
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: sizeHeight * 0.10,
                    ),
                    Text(
                      SephaResources.sephaList[index],
                      style: AppStyle.bold36white,
                    ),
                    Text(
                      "$clickSebha",
                      style: AppStyle.bold36white,
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
              child: checkDuea
                  ? Text(
                      "لا إله إلا الله وحده لا شريك له، له الملك وله الحمد، وهو على كل شيء قدير",
                      textDirection: TextDirection.rtl,
                      style: AppStyle.bold20gold,
                    )
                  : Text(
                      "",
                    ))
        ],
      ),
    );
  }
}

/*Container(
            margin: EdgeInsets.symmetric(vertical: sizeHeight * 0.02),
            alignment: Alignment.bottomCenter,
            height: sizeHeight * 0.49,
            width: sizeWidth * 0.88,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppAssets.sebhaBg))),
            child: Column(
              children: [
                Text(
                  "سبحان الله",
                  style: AppStyle.bold36white,
                ),
                Text(
                  "30",
                  style: AppStyle.bold36white,
                )
              ],
            ),
          )*/
