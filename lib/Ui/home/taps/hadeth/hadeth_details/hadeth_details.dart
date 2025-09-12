import 'package:flutter/material.dart';
import 'package:islami_app/model/hadeth_data.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class HadethDetails extends StatefulWidget {
  @override
  State<HadethDetails> createState() => _HadethDetails();
}

class _HadethDetails extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    HadethData hadethData =
        ModalRoute.of(context)!.settings.arguments as HadethData;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hadith ${hadethData.index}",
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
                Text(
                  hadethData.title,
                  style: AppStyle.bold24gold,
                ),
                SizedBox(
                  height: sizeHeight * 0.04,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
                      child: Text(
                        hadethData.content,
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
