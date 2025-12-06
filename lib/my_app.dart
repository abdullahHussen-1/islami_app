import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/home_screen.dart';
import 'package:islami_app/Ui/home/taps/hadeth/hadeth_details/hadeth_details.dart';
import 'package:islami_app/Ui/home/taps/quran_tap/soura%20_details/soura%20_details%20_screen.dart';
import 'package:islami_app/Ui/home/taps/time/azkar_details/azkar_details.dart';
import 'package:islami_app/Ui/introduction/introduction_screen.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_theme.dart';

import 'Ui/home/taps/radio/reciters_item.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.introductionRoute,
      routes: {
        AppRoutes.introductionRoute: (context) => IntroScreen(),
        AppRoutes.homeRoute: (context) => HomeScreen(),
        AppRoutes.souraDetailsRoute: (context) => SouraDetails(),
        AppRoutes.hadethDetailsRoute: (context) => HadethDetails(),
        AppRoutes.azkarDetailsRoute: (context) => AzkarDetails(),
        AppRoutes.recitersItemRoute: (context) => RecitersItem(),
      },
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
