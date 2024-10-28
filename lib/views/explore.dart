import 'package:flutter/material.dart';
import 'package:news_app_con/controller/fetch_news.dart';
import 'package:news_app_con/model/news_article.dart';
import 'package:news_app_con/views/widgets/news_container.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  late NewsArticle newsArticle;
  bool isLoading = true;
  getNews() async {
    newsArticle = await FetchNews.fetchNews();
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
                  imageUrl: newsArticle.imgUrl,
                  title: newsArticle.newsHead,
                  description: newsArticle.newsDesc,
                  newscnt: newsArticle.newsCnt,
                  newsUrl: newsArticle.newsUrl,
                );
              }),
    );
  }
}
