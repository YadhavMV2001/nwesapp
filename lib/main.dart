// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nwesapp/controller/bottom_navigation_controller.dart';
import 'package:nwesapp/controller/category_controller.dart';
import 'package:nwesapp/controller/home_screen_controller.dart';
import 'package:nwesapp/controller/search_screen_controller.dart';
import 'package:nwesapp/controller/splash_controller.dart';
import 'package:nwesapp/view/Main_screen.dart';

import 'package:nwesapp/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<SplashScreenProvider>(
          builder: (context, splashScreenProvider, Widget) {
            return splashScreenProvider.isLoading
                ? SplashScreen()
                : MainScreeen();
          },
        ),
      ),
    );
  }
}
