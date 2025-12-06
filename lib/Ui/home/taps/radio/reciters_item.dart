import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/radio/list_radio.dart';
import 'package:islami_app/model/reciters_item_data.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_style.dart';

class RecitersItem extends StatelessWidget {
  RecitersItem({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;

    RecitersItemData reciters =
        ModalRoute.of(context)!.settings.arguments as RecitersItemData;

    return Stack(
      children: [
        Image.asset(
          AppAssets.backgroundRadio,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.transparentColor,
            title: Text(
              "الشيخ ${reciters.name} ",
              style: AppStyle.bold20gold,
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: sizeHeight * 0.01,
              ),
              Image.asset(
                AppAssets.titleIntro,
                width: sizeWidth * 0.69,
                height: sizeHeight * 0.15,
              ),
              Expanded(
                  child: ListView.separated(
                      padding:
                          EdgeInsets.symmetric(horizontal: sizeWidth * 0.02),
                      itemBuilder: (context, index) {
                        ///todo"https://server6.mp3quran.net/akdr/002.mp3"

                        return ListRadio(
                          index: index,
                          checkText: true,
                          recitersItem: true,
                          urlSourceReciters:
                              "${reciters.moshafReciters!.server}${(index + 1).toString().padLeft(3, '0')}.mp3",
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: sizeHeight * 0.02,
                          ),
                      itemCount: reciters.moshafReciters!.surahTotal ?? 0))
            ],
          ),
        )
      ],
    );
  }
}
