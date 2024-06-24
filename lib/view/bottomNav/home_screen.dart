// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:nwesapp/controller/home_screen_controller.dart';
import 'package:nwesapp/utils/color_theme.dart';
import 'package:nwesapp/utils/text_theme.dart';
import 'package:nwesapp/view/bottomNav/search_Screen.dart';
import 'package:nwesapp/view/widgets/card_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void fetchData(BuildContext context) {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 143, 163, 223),
        title: Text(
          "News Today 📰",
          style: NewsText.textMain,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreeen(),
                    ));
              },
              icon: Icon(
                Icons.search,
                size: 35,
                color: ColorThemesss.mainColor,
              ))
        ],
      ),
      body: Consumer<HomeScreenController>(
        builder: (context, Provider, child) {
          return Provider.isLoading == true
              ? Center(
                  child: LottieBuilder.asset(
                      "assets/animations/Animation - 1718790816466.json"),
                )
              : ListView.separated(
                  itemBuilder: (context, index) => CardWidget(
                        contant: Provider.newsModel.articles?[index].content
                                .toString() ??
                            "",
                        description: Provider
                                .newsModel.articles?[index].description
                                .toString() ??
                            "",
                        date: Provider.newsModel.articles?[index].publishedAt,
                        imageUrl: Provider.newsModel.articles?[index].urlToImage
                                .toString() ??
                            "",
                        sourceName: Provider
                                .newsModel.articles?[index].source?.name
                                .toString() ??
                            "",
                        title: Provider.newsModel.articles?[index].title
                                .toString() ??
                            "",
                        url: Provider.newsModel.articles?[index].url
                                .toString() ??
                            "",
                      ),
                  separatorBuilder: (context, index) => Divider(
                        height: 20,
                      ),
                  itemCount: Provider.newsModel.articles?.length ?? 0);
        },
      ),
    );
  }
}
