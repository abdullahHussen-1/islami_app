import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth_data.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_style.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  HadethData? hadethData;

  @override
  void initState() {
    super.initState();
    readHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.hadethDetailsRoute,
            arguments: hadethData);
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.goldColor,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AppAssets.hadithBackGroundLeftRight,
                width: sizeWidth,
                fit: BoxFit.fill,
              ),
              Image.asset(
                AppAssets.hadithBackGround,
                height: sizeWidth * 0.60,
                width: sizeWidth * 0.57,
              ),
              hadethData == null
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.blackColor,
                    ))
                  : Padding(
                      padding: EdgeInsets.only(
                          bottom: sizeHeight * 0.1,
                          left: sizeWidth * 0.05,
                          right: sizeWidth * 0.04),
                      child: Column(
                        children: [
                          SizedBox(
                            height: sizeHeight * 0.04,
                          ),
                          Center(
                            child: Text(
                              hadethData?.title ?? "",
                              style: AppStyle.bold24black,
                            ),
                          ),
                          SizedBox(
                            height: sizeHeight * 0.03,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                hadethData?.content ?? "",
                                textAlign: TextAlign.center,
                                style: AppStyle.bold16black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> readHadethFile() async {
    String fileContent = await rootBundle
        .loadString('assets/files/Hadeeth/h${widget.index + 1}.txt');
    String titleHadeth = fileContent.substring(0, fileContent.indexOf('\n'));

    String content = fileContent.substring(fileContent.indexOf('\n') + 1);
    hadethData = HadethData(
        title: titleHadeth, content: content, index: widget.index + 1);
    setState(() {});
  }
}

///  shared_preferences: ^2.2.2
