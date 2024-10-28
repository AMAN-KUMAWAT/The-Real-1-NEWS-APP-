import 'package:flutter/material.dart';
import 'package:news_app_con/controller/politics_fetch.dart';
import 'package:news_app_con/model/politics_data.dart';
import 'package:news_app_con/views/widgets/news_container.dart';

class PoliticsView extends StatefulWidget {
  const PoliticsView({super.key});

  @override
  State<PoliticsView> createState() => _ExploreState();
}

class _ExploreState extends State<PoliticsView> {
  late PoliticsData nationalArticle;
  bool isLoading = true;
  getNews() async {
    nationalArticle = await PoliticsFetch.fetchNews();
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
