import 'package:flutter/material.dart';
import 'package:news_app_con/controller/fetch_news.dart';
import 'package:news_app_con/model/news_article.dart';
import 'package:news_app_con/resources/consts/app_styles.dart';
import 'package:news_app_con/resources/consts/colors.dart';
import 'package:news_app_con/views/widgets/swiper.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late NewsArticle newsArticle;
  bool isLoading = true;
  int current = 0;

  getNews() async {
    newsArticle = await FetchNews.fetchNews();
    // setState(() {
    //   isLoading = false;
    // });
  }

  @override
  void initState() {
    getNews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var categoriesList = [
      "explore    ",
      "entertainment    ",
      "sports    ",
      "politics    ",
      "travel    "
    ];
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: AppColors.white,
          shadowColor: Colors.blue,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_sharp)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined))
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(2),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: categoriesList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              width: 100,
                              height: 26,
                              decoration: BoxDecoration(
                                  borderRadius: current == index
                                      ? BorderRadius.circular(15)
                                      : BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  color: current == index
                                      ? Colors.white70
                                      : Colors.transparent,
                                  border: current == index
                                      ? Border.all(
                                          color: Colors.deepPurpleAccent,
                                          width: 2)
                                      : null),
                              child: Center(
                                child: Text(
                                  categoriesList[index].capitalized,
                                  style: AppStyles.semiBold(
                                      color: current == index
                                          ? Colors.black
                                          : Colors.blue,
                                      size: 12,
                                      fontweight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          2.heightBox,
                          Visibility(
                              visible: current == index,
                              child: Container(
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepOrangeAccent),
                              )),
                        ],
                      );
                    }),
              ),
              const Swiper(),
            ],
          ),
        ));
  }
}
//  NewsContainer(
//                     imageUrl: newsArticle.imgUrl,
//                     title: newsArticle.newsHead,
//                     description: newsArticle.newsDesc,
//                     newsUrl: newsArticle.newsUrl,
//                     newscnt: newsArticle.newsCnt,
//                   )
// isLoading
//               ? Center(
//                   child: LoadingAnimationWidget.dotsTriangle(
//                       color: Colors.black, size: 100),
//                 )
//               :