import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparentColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.blackColor,
          backgroundColor: AppColors.goldColor,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blackBgColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.goldColor,
        ),
      ));
}
