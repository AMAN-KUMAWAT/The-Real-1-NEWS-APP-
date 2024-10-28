import 'package:flutter/material.dart';
import 'package:news_app_con/resources/consts/app_styles.dart';
import 'package:news_app_con/views/Inter.dart';
import 'package:news_app_con/views/entertainment_view.dart';
import 'package:news_app_con/views/explore.dart';
import 'package:news_app_con/views/national.dart';
import 'package:news_app_con/views/politics_view.dart';
import 'package:news_app_con/views/sports.dart';
import 'package:news_app_con/views/tech_views.dart';

class Section extends StatelessWidget {
  final String title;
  final String imageUri;
  final int number;
  const Section(
      {super.key,
      required this.title,
      required this.imageUri,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: unused_element
        switch (number) {
          case 0:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Explore()));
            break;
          case 1:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Inter()));
            break;
          case 2:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const National()));
            break;
          case 3:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EntertainmentView()));
            break;
          case 4:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Sports()));
            break;
          case 5:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PoliticsView()));
            break;
          case 6:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TechViews()));
            break;
        }
      },
      child: Container(
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.all(8),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(children: [
            Image.asset(
              imageUri,
              height: 300,
              width: 200,
            ),
            Positioned(
              bottom: 2,
              child: Text(
                title,
                style: AppStyles.semiBold(color: Colors.black),
              ),
            ),
          ])),
    );
  }
}
