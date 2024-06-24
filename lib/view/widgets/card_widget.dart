// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nwesapp/controller/home_screen_controller.dart';
import 'package:nwesapp/utils/text_theme.dart';
import 'package:nwesapp/view/widgets/news_view_widget.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      required this.imageUrl,
      required this.contant,
      required this.sourceName,
      required this.url});

  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String contant;
  final String sourceName;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsViewWidget(
                          title: title,
                          description: description,
                          date: date,
                          imageUrl: imageUrl,
                          contant: contant,
                          sourceName: sourceName,
                          url: url),
                    ));
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: NewsText.subText,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          '$sourceName | ${DateFormat('dd/MM/yyyy').format(date!).toString()}'),
                      IconButton(
                        onPressed: () {
                          String newsToShare =
                              "$title  \n  $description \n  $url";
                          Provider.of<HomeScreenController>(context,
                                  listen: false)
                              .shareText(textToShare: newsToShare);
                        },
                        icon: Icon(Icons.share),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
