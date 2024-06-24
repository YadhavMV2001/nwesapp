// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nwesapp/controller/home_screen_controller.dart';
import 'package:nwesapp/utils/text_theme.dart';
import 'package:provider/provider.dart';

class NewsViewWidget extends StatelessWidget {
  const NewsViewWidget(
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
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: NewsText.textMain,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(imageUrl))),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "$sourceName | ${DateFormat("dd/MM/yyy").format(date!).toString()}"),
              SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: NewsText.subText,
              ),
              InkWell(
                  onTap: () {
                    Provider.of<HomeScreenController>(context, listen: false)
                        .launchURL(url);
                  },
                  child: Text(
                    "Read more...",
                    style: NewsText.subText,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
