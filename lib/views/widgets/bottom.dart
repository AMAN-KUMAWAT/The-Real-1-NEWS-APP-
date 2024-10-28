import 'package:flutter/material.dart';
import 'package:news_app_con/views/category.dart';
import 'package:news_app_con/views/dashboard.dart';
import 'package:news_app_con/views/profile.dart';
import 'package:news_app_con/views/video.dart';
import 'package:velocity_x/velocity_x.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(height: 50, destinations: [
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Dashboard()));
        },
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            children: [const Icon(Icons.home), 1.heightBox, const Text("Home")],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Video()));
        },
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            children: [
              const Icon(Icons.video_call),
              1.heightBox,
              const Text("Videos")
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Category()));
        },
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            children: [
              const Icon(Icons.category),
              1.heightBox,
              const Text("Category")
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Profile()));
        },
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            children: [
              const Icon(Icons.person),
              1.heightBox,
              const Text("Profile")
            ],
          ),
        ),
      ),
    ]);
  }
}
