import 'package:flutter/material.dart';
import 'package:news_app_con/controller/entertainment_fetch.dart';
import 'package:news_app_con/model/enter.dart';
import 'package:news_app_con/views/widgets/news_container.dart';

class EntertainmentView extends StatefulWidget {
  const EntertainmentView({super.key});

  @override
  State<EntertainmentView> createState() => _ExploreState();
}

class _ExploreState extends State<EntertainmentView> {
  late Enter nationalArticle;
  bool isLoading = true;
  getNews() async {
    nationalArticle = await EntertainmentFetch.fetchNews();
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
