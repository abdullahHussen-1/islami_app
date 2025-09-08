import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/sura_item.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class QuranTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: AppStyle.bold16white,
              cursorColor: AppColors.goldColor,
              decoration: InputDecoration(
                hintText: "Sura Name",
                hintStyle: AppStyle.bold16white,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: Image.asset(AppAssets.textPrefix),
                ),
                enabledBorder: OutlineInputBorderText(),
                focusedBorder: OutlineInputBorderText(),
              ),
            ),
            SizedBox(
              height: sizeHeight * 0.02,
            ),
            Text(
              "Most Recently",
              style: AppStyle.bold16white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: SizedBox(
                height: sizeHeight * 0.17,
                child: ListView.separated(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        height: sizeHeight * 0.16,
                        width: sizeWidth * 0.65,
                        decoration: BoxDecoration(
                            color: AppColors.goldColor,
                            borderRadius: BorderRadius.circular(23)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Al-Anbiya",
                                  style: AppStyle.bold24black,
                                ),
                                Text(
                                  "الأنبياء",
                                  style: AppStyle.bold24black,
                                ),
                                Text(
                                  "112 Verses",
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
                    itemCount: 30),
              ),
            ),
            Text(
              "Suras List",
              style: AppStyle.bold16white,
            ),
            SizedBox(
              height: sizeHeight * 0.02,
            ),
            Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return SuraItem(
                        numberSura: index,
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          color: AppColors.whiteColor,
                          indent: sizeWidth * 0.1,
                          endIndent: sizeWidth * 0.1,
                        ),
                    itemCount: 114))
          ],
        ),
      ),
    );
  }

  OutlineInputBorder OutlineInputBorderText() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.goldColor, width: 1));
  }
}
