// ignore_for_file: avoid_print, prefer_const_declarations

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nwesapp/model/news_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController with ChangeNotifier {
  late News newsModel;
  bool isLoading = false;
  var baseUrl = "https://newsapi.org";

  fetchData() async {
    isLoading = true;
    final url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=c135e7fc22674294b578af24840cf55b";
    final response = await http.get(Uri.parse(url));
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

// To share news
  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print("Error Sharing$e");
    }
  }

// function to launch a URL

  void launchURL(String url) async {
    final Uri url1 = Uri.parse(url);
    try {
      if (!await launchUrl(url1, mode: LaunchMode.inAppWebView)) {
        await launchUrl(url1, mode: LaunchMode.inAppWebView);
      } else {
        throw 'Could not Launch $url';
      }
    } catch (e) {
      print("Error Launching $e");
    }
  }
}
