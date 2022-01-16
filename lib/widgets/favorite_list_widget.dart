import 'package:flutter/material.dart';
import 'package:flutter_testovoe/models/model.dart';
import 'package:flutter_testovoe/services/api_services.dart';
import 'package:flutter_testovoe/widgets/news_card.dart';
import 'package:flutter_testovoe/widgets/top_news_widget.dart';

class FavoriteListWidget extends StatelessWidget {
  const FavoriteListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopNewsWidget(),
          const Expanded(child: FavoriteList()),
        ],
      ),
    );
  }
}

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  final ApiService httpService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.fetchNews(),
      builder: (BuildContext context, AsyncSnapshot<List<Model>> snapshot) {
        if (snapshot.hasData) {
          List<Model>? news = snapshot.data;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: news?.length,
            itemBuilder: (context, index) => NewsCard(news: news![index]),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
