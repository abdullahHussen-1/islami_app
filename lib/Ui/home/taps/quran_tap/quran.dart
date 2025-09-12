import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/quran_resources.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/soura%20_details/most_recently_widget.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/sura_item.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class QuranTap extends StatefulWidget {
  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  List<int> filterList = List.generate(
    114,
    (index) => index,
  );

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
              onChanged: (newText) {
                searchByNewText(newText);
              },
            ),
            SizedBox(
              height: sizeHeight * 0.02,
            ),
            MostRecentlyWidget(),
            Text(
              "Suras List",
              style: AppStyle.bold16white,
            ),
            SizedBox(
              height: sizeHeight * 0.02,
            ),
            Expanded(
                child: filterList.isEmpty
                    ? Center(
                        child: Text(
                          "NOT FOUND SURA",
                          style: AppStyle.bold24gold,
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return SuraItem(
                            numberSura: filterList[index],
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                              color: AppColors.whiteColor,
                              indent: sizeWidth * 0.1,
                              endIndent: sizeWidth * 0.1,
                            ),
                        itemCount: filterList.length))
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

  void searchByNewText(String newText) {
    List<int> search = [];
    for (int i = 0; i < QuranResources.englishQuranSurahsList.length; i++) {
      if (QuranResources.englishQuranSurahsList[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        search.add(i);
      } else if (QuranResources.arabicQuranSurasList[i].contains(newText)) {
        search.add(i);
      }
    }
    filterList = search;

    setState(() {});
  }
}
