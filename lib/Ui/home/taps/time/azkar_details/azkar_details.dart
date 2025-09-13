import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/time/azkar_details/azkar_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class AzkarDetails extends StatefulWidget {
  @override
  State<AzkarDetails> createState() => _AzkarDetails();
}

class _AzkarDetails extends State<AzkarDetails> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AzkarResources.azkarList[index].zkar,
          style: AppStyle.bold20gold,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.blackBgColor,
            child: Image.asset(
              AppAssets.detailsBg,
              width: sizeWidth,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Column(
              children: [
                /*Center(
                  child: Text(
                    "",
                    style: AppStyle.bold24gold,
                  ),
                ),*/
                SizedBox(
                  height: sizeHeight * 0.04,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
                      child: Text(
                        AzkarResources.azkarList[index].content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: AppStyle.bold20gold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: sizeHeight * 0.12,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
