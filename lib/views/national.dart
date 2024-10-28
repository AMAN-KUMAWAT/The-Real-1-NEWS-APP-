import 'package:flutter/material.dart';
import 'package:news_app_con/controller/national_data.dart';
import 'package:news_app_con/model/national_article.dart';
import 'package:news_app_con/views/widgets/news_container.dart';

class National extends StatefulWidget {
  const National({super.key});

  @override
  State<National> createState() => _ExploreState();
}

class _ExploreState extends State<National> {
  late NationalArticle nationalArticle;
  bool isLoading = true;
  getNews() async {
    nationalArticle = await NationalData.fetchNews();
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
