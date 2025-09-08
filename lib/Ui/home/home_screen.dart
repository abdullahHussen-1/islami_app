import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/hadeth/hadeth_tap.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/quran.dart';
import 'package:islami_app/Ui/home/taps/radio/radio_tap.dart';
import 'package:islami_app/Ui/home/taps/sepha/sebha_tap.dart';
import 'package:islami_app/Ui/home/taps/time/time_tap.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> imageBackGround = [
    AppAssets.backGround,
    AppAssets.backgroundHadith,
    AppAssets.backgroundSabha,
    AppAssets.backgroundRadio,
    AppAssets.backgroundTime,
  ];
  List<Widget> taps = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap()
  ];

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          imageBackGround[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: sizeHeight * 0.02,
              ),
              Image.asset(
                AppAssets.titleIntro,
                width: sizeWidth * 0.69,
                height: sizeHeight * 0.15,
              ),
              Expanded(child: taps[selectedIndex]),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: buttonNavigationBarContainer(
                        index: 0, iconName: AppAssets.iconQuran),
                    label: "Quran"),
                BottomNavigationBarItem(
                    icon: buttonNavigationBarContainer(
                        index: 1, iconName: AppAssets.iconHadeth),
                    label: "Hadeth"),
                BottomNavigationBarItem(
                    icon: buttonNavigationBarContainer(
                        index: 2, iconName: AppAssets.iconSebha),
                    label: "Sebha"),
                BottomNavigationBarItem(
                    icon: buttonNavigationBarContainer(
                        index: 3, iconName: AppAssets.iconRadio),
                    label: "Radio"),
                BottomNavigationBarItem(
                    icon: buttonNavigationBarContainer(
                        index: 4, iconName: AppAssets.iconTime),
                    label: "Time"),
              ]),
        )
      ],
    );
  }

  Widget buttonNavigationBarContainer(
      {required int index, required String iconName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 19, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackBgColor),
            child: ImageIcon(AssetImage(iconName)))
        : ImageIcon(AssetImage(iconName));
  }
}
