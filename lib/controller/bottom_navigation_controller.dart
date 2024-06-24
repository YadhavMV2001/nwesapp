// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nwesapp/view/bottomNav/category_screen.dart';
import 'package:nwesapp/view/bottomNav/home_screen.dart';
import 'package:nwesapp/view/bottomNav/search_Screen.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;
  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [HomeScreen(), CategoryScreen(), SearchScreeen()];
}
