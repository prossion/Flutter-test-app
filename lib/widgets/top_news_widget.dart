import 'package:flutter/material.dart';
import 'package:flutter_testovoe/constant.dart';
import 'package:flutter_testovoe/models/model.dart';
import 'package:flutter_testovoe/services/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

class TopNewsWidget extends StatelessWidget {
  TopNewsWidget({Key? key}) : super(key: key);
  final ApiService httpService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Model>>(
      future: httpService.fetchNews(),
      builder: (BuildContext context, AsyncSnapshot<List<Model>> snapshot) {
        if (snapshot.hasData) {
          List<Model>? news = snapshot.data;
          return SizedBox(
            height: 230,
            width: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: news!.length,
              padding: const EdgeInsets.only(left: 2, right: 2),
              itemBuilder: (context, index) => TopWidgets(news: news[index]),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class TopWidgets extends StatelessWidget {
  final Model news;
  const TopWidgets({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return news.top == '1'
        ? Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: 380,
              height: 360,
              child: Stack(
                children: [
                  Image.network(
                    news.image != null
                        ? news.image
                        : 'http://188.40.167.45:3001/img/test3.jpg',
                    //empty photo from the first post
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            color: Colors.white,
                          ),
                          height: 30,
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.favorite_outlined),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Top',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          news.title,
                          style: kTitleTopTextStyle,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              child: Text(
                                news.clickUrl,
                                style: kUrlTextStyle,
                              ),
                              onTap: () => launch('https://lampalampa.net'),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('-', style: kTimeTextStyle),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(news.time, style: kTimeTextStyle),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : const SizedBox(
            height: 1,
          );
  }
}
