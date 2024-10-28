// ignore: file_names
import 'package:flutter/material.dart';
import 'package:news_app_con/controller/internaional_data.dart';
import 'package:news_app_con/model/international.dart';
import 'package:news_app_con/views/widgets/news_container.dart';

class Inter extends StatefulWidget {
  const Inter({super.key});

  @override
  State<Inter> createState() => _ExploreState();
}

class _ExploreState extends State<Inter> {
  late International newsArticle;
  bool isLoading = true;
  getNews() async {
    newsArticle = await InternationalData.fetchNews();
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
