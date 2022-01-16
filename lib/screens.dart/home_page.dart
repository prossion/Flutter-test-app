import 'package:flutter/material.dart';
import 'package:flutter_testovoe/widgets/favorite_list_widget.dart';
import 'package:flutter_testovoe/widgets/stories_list.dart';
import 'package:flutter_testovoe/widgets/video_list.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'FAVOURITES'),
  Tab(text: 'VIDEO'),
  Tab(text: 'STORIES'),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: tabs,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          FavoriteListWidget(),
          VideoList(),
          StoriesList(),
        ],
      ),
    );
  }
}
