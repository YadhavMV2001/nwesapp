// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:nwesapp/controller/search_screen_controller.dart';
import 'package:nwesapp/utils/color_theme.dart';
import 'package:nwesapp/view/widgets/card_widget.dart';
import 'package:provider/provider.dart';

class SearchScreeen extends StatelessWidget {
  const SearchScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    SearchScreenController provider =
        Provider.of<SearchScreenController>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 45,
                    width: MediaQuery.sizeOf(context).width * 2 / 3,
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: ColorThemesss.mainColor)),
                          labelText: "Search here",
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorThemesss.mainColor),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.blue,
                            backgroundColor: ColorThemesss.mainColor),
                        onPressed: () {
                          provider.searchData(
                              searchText: textController.text.toLowerCase());
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Text(
                          "Search",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
              Expanded(
                  child: Provider.of<SearchScreenController>(context).isLoading ==
                          true
                      ? Center(
                          child: LottieBuilder.asset(
                              "assets/animations/Animation - 1718960345688.json"),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) => CardWidget(
                              title: provider.newsModel?.articles?[index].title
                                      .toString() ??
                                  "",
                              description: provider
                                      .newsModel?.articles?[index].description
                                      .toString() ??
                                  "",
                              date: provider
                                  .newsModel?.articles?[index].publishedAt,
                              imageUrl:
                                  provider.newsModel?.articles?[index].urlToImage.toString() ?? "",
                              contant: provider.newsModel?.articles?[index].content.toString() ?? "",
                              sourceName: provider.newsModel?.articles?[index].source.toString() ?? "",
                              url: provider.newsModel?.articles?[index].url.toString() ?? ""),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: provider.newsModel?.articles?.length ?? 0))
            ],
          ),
        ),
      ),
    );
  }
}
