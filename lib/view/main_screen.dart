// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nwesapp/controller/bottom_navigation_controller.dart';
import 'package:nwesapp/utils/color_theme.dart';
import 'package:provider/provider.dart';

class MainScreeen extends StatelessWidget {
  const MainScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorThemesss.mainColor,
        currentIndex: Provider.of<BottomNavController>(context).selectedIndex,
        onTap:
            Provider.of<BottomNavController>(context, listen: false).onItemTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
        ],
      ),
    );
  }
}
