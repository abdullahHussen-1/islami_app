import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/home_screen.dart';
import 'package:islami_app/utils/app_routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRoute,
      routes: {
        AppRoutes.homeRoute: (context) => HomeScreen(),
      },
    );
  }
}
