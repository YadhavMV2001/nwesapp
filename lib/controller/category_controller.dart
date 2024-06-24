import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:nwesapp/model/news_model.dart';
import 'package:http/http.dart' as http;

class CategoryController with ChangeNotifier {
  late News newsModel;
  bool isLoading = false;
  List<String> categoryList = [
    "Business",
    "Entertainment",
    "General",
    "Helth",
    "Science",
    "Sports",
    "Technology"
  ];

  String category = "Business";

  onTap({required int index}) {
    category = categoryList[index].toLowerCase();
    fetchData();
    notifyListeners();
  }

  fetchData() async {
    isLoading = true;
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=c135e7fc22674294b578af24840cf55b");

    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodeData = {};
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
    } else {
      print("Api Failed");
    }
    newsModel = News.fromJson(decodeData);
    isLoading = false;
    notifyListeners();
  }
}
