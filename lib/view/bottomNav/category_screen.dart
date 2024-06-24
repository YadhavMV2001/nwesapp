// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nwesapp/controller/category_controller.dart';
import 'package:nwesapp/utils/text_theme.dart';
import 'package:nwesapp/view/widgets/card_widget.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  void fetchData(BuildContext context) async {
    Provider.of<CategoryController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);

    return Consumer<CategoryController>(
      builder: (context, Provider, child) {
        return DefaultTabController(
          initialIndex: 0,
          length: Provider.categoryList.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Categorys",
                style: NewsText.textMain,
              ),
              bottom: TabBar(
                isScrollable: true,
                tabs: List.generate(
                  Provider.categoryList.length,
                  (index) => Tab(
                    text: Provider.categoryList[index],
                  ),
                ),
                onTap: (value) {
                  Provider.onTap(index: value);
                },
              ),
            ),
            body: Provider.isLoading == true
                ? Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: LottieBuilder.asset(
                          "assets/animations/Animation - 1718960345688.json"),
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) => CardWidget(
                        title:
                            Provider.newsModel.articles?[index].title.toString() ??
                                "",
                        description: Provider
                                .newsModel.articles?[index].description
                                .toString() ??
                            "",
                        date: Provider.newsModel.articles?[index].publishedAt,
                        imageUrl: Provider.newsModel.articles?[index].urlToImage
                                .toString() ??
                            "",
                        contant: Provider.newsModel.articles?[index].content
                                .toString() ??
                            "",
                        sourceName:
                            Provider.newsModel.articles?[index].source?.name.toString() ?? "",
                        url: Provider.newsModel.articles?[index].url.toString() ?? ""),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: Provider.newsModel.articles?.length ?? 0),
          ),
        );
      },
    );
  }
}
