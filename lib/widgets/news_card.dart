import 'package:flutter/material.dart';
import 'package:flutter_testovoe/constant.dart';
import 'package:flutter_testovoe/models/model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final Model news;
  const NewsCard({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        // ignore: prefer_if_null_operators
        Image.network(news.image != null
            ? news.image
            : 'https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found-300x169.jpg'),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
          child: Column(
            children: [
              Text(news.title, style: kTitleTextStyle),
              const SizedBox(height: 10),
              Row(
                children: [
                  InkWell(
                    child: Text(
                      news.clickUrl,
                      style: kUrlTextStyle,
                    ),
                    onTap: () => launch('https://lampalampa.net'),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    news.time,
                    style: kTimeTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
