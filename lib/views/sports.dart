import 'package:flutter/material.dart';
import 'package:news_app_con/controller/sports_fetch.dart';
import 'package:news_app_con/model/sports_data.dart';
import 'package:news_app_con/views/widgets/news_container.dart';

class Sports extends StatefulWidget {
  const Sports({super.key});

  @override
  State<Sports> createState() => _ExploreState();
}

class _ExploreState extends State<Sports> {
  late SportsData nationalArticle;
  bool isLoading = true;
  getNews() async {
    nationalArticle = await SportsFetch.fetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : PageView.builder(
              onPageChanged: (index) {
                getNews();
                isLoading = false;
              },
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return NewsContainer(
                  imageUrl: nationalArticle.imgUrl,
                  title: nationalArticle.newsHead,
                  description: nationalArticle.newsDesc,
                  newscnt: nationalArticle.newsCnt,
                  newsUrl: nationalArticle.newsUrl,
                );
              }),
    );
  }
}
