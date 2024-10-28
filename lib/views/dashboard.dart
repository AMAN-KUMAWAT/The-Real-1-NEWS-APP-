import 'package:flutter/material.dart';
import 'package:news_app_con/resources/consts/app_styles.dart';
import 'package:news_app_con/resources/consts/colors.dart';
import 'package:news_app_con/views/Inter.dart';
import 'package:news_app_con/views/entertainment_view.dart';
import 'package:news_app_con/views/explore.dart';
import 'package:news_app_con/views/national.dart';
import 'package:news_app_con/views/politics_view.dart';
import 'package:news_app_con/views/sports.dart';
import 'package:news_app_con/views/tech_views.dart';
import 'package:news_app_con/views/widgets/bottom.dart';
import 'package:news_app_con/views/widgets/drawer_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int current = 0;
    var categoriesList = [
      "explore    ",
      "International",
      "National",
      "sports",
      "entertainment    ",
      "politics    ",
      "travel    "
    ];
    return DefaultTabController(
      initialIndex: 0,
      length: categoriesList.length,
      child: Scaffold(
          drawer: const DrawerWidget(),
          appBar: AppBar(
            title: Text(
              "The Real 1",
              style: AppStyles.semiBold(
                  color: Colors.black45, size: 20, fontweight: FontWeight.bold),
            ),
            elevation: 2,
            backgroundColor: AppColors.white,
            shadowColor: Colors.blue,
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_sharp)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined))
            ],
            bottom: TabBar(
              dividerColor: Colors.transparent,
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    "Explore",
                    style: AppStyles.semiBold(
                        color: Colors.deepPurpleAccent,
                        size: 12,
                        fontweight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    "International",
                    style: AppStyles.semiBold(
                        color: Colors.deepPurpleAccent,
                        size: 12,
                        fontweight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    "National",
                    style: AppStyles.semiBold(
                        color: Colors.deepPurpleAccent,
                        size: 12,
                        fontweight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    "Entertainment",
                    style: AppStyles.semiBold(
                        color: Colors.deepPurpleAccent,
                        size: 12,
                        fontweight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    "Sports",
                    style: AppStyles.semiBold(
                        color: Colors.deepPurpleAccent,
                        size: 12,
                        fontweight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    "Politics",
                    style: AppStyles.semiBold(
                        color: Colors.deepPurpleAccent,
                        size: 12,
                        fontweight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    "Tech Insides",
                    style: AppStyles.semiBold(
                        color: Colors.deepPurpleAccent,
                        size: 12,
                        fontweight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            Explore(),
            Inter(),
            National(),
            EntertainmentView(),
            Sports(),
            PoliticsView(),
            TechViews()
          ]),
          bottomNavigationBar: const Bottom()),
    );
  }
}
