import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/quran_resources.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/soura%20_details/soura_content.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/soura%20_details/soura_coord.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class SouraDetails extends StatefulWidget {
  @override
  State<SouraDetails> createState() => _SouraDetailsState();
}

class _SouraDetailsState extends State<SouraDetails> {
  List<String> verses = [];
  bool clickAgenda = true;
  String verses2 = "";

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSurahsList[index],
          style: AppStyle.bold20gold,
        ),
        actions: [
          IconButton(
              onPressed: () {
                clickAgenda = true;
                loadSuraFile(index);
                setState(() {});
              },
              icon: Icon(
                Icons.view_agenda,
                color: clickAgenda ? AppColors.whiteColor : AppColors.goldColor,
              )),
          IconButton(
              onPressed: () {
                clickAgenda = false;

                loadSuraFile(index);
                setState(() {});
              },
              icon: Icon(
                Icons.view_module,
                color:
                    !clickAgenda ? AppColors.whiteColor : AppColors.goldColor,
              ))
        ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SouraCoord(number: index, text: "آيَاتُهَا"),
                    Text(
                      QuranResources.arabicQuranSurasList[index],
                      style: AppStyle.bold24gold,
                    ),
                    SouraCoord(
                      number: index,
                      text: "تَرْتِيبُهَا",
                      check: false,
                    )
                  ],
                ),
                verses.isEmpty
                    ? CircularProgressIndicator(
                        color: AppColors.goldColor,
                      )
                    : Expanded(
                        child: clickAgenda
                            ? ListView.separated(
                                itemBuilder: (context, index) {
                                  return SouraContent(
                                    text: verses[index],
                                    index: index,
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 10,
                                    ),
                                itemCount: verses.length)
                            : SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: sizeWidth * 0.05),
                                  child: Text(
                                    verses2,
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

  Future<void> loadSuraFile(int index) async {
    String fileContent =
        await rootBundle.loadString("assets/files/Quran/${index + 1}.txt");
    List<String> suraContent = fileContent.split('\n');
    if (!clickAgenda) {
      for (int i = 0; i < suraContent.length; i++) {
        suraContent[i] += '[${i + 1}]';
      }
      verses2 = suraContent.join();
    }
    verses = suraContent;

    setState(() {});
  }
}
