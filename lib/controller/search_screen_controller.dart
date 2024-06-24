// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nwesapp/model/news_model.dart';

class SearchScreenController with ChangeNotifier {
  News? newsModel;
  bool isLoading = false;

  Future<void> searchData({required String searchText}) async {
    isLoading = true;

    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchText&sortBy=publishedAt&apiKey=c135e7fc22674294b578af24840cf55b");
    try {
      final response = await http.get(url, headers: {
        "Content-type": "Application/json",
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodeData = jsonDecode(response.body);
        newsModel = News.fromJson(decodeData);
      } else {
        print("Api Failed");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
