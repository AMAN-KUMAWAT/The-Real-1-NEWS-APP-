// import 'package:flutter/material.dart';
// import 'package:news_app_con/resources/consts/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:news_app_con/resources/consts/app_styles.dart';
import 'package:news_app_con/views/widgets/bottom.dart';
import 'package:news_app_con/views/widgets/section.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var category = [
    "Explore",
    "International",
    "National",
    "Entertainment",
    "Sports",
    "Politics",
    "Technology",
  ];
  var images = [
    "assets/images/explore.png",
    "assets/images/international.png",
    "assets/images/national.png",
    "assets/images/entertainment.png",
    "assets/images/sports.png",
    "assets/images/politics.png",
    "assets/images/tech.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.blueGrey,
        elevation: 2,
        title: Text(
          "Category",
          style: AppStyles.semiBold(size: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
            itemCount: category.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return Section(
                title: category[index],
                imageUri: images[index],
                number: index,
              );
            }),
      ),
      bottomNavigationBar: const Bottom(),
    );
  }
}
