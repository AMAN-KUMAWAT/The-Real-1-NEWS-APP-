import 'package:flutter/material.dart';
import 'package:news_app_con/resources/consts/app_styles.dart';
import 'package:news_app_con/resources/consts/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class Swiper extends StatefulWidget {
  const Swiper({super.key});

  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return VxSwiper.builder(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        viewportFraction: 1.0,
        itemCount: 5,
        onPageChanged: (value) {
          current = value;
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                color: Vx.randomPrimaryColor,
              ),
              Positioned(
                top: 14,
                left: 10,
                child: VxBox(
                        child: Text(
                  "Sport",
                  style: AppStyles.regular(size: 12, color: Colors.white),
                ))
                    .color(AppColors.primaryButton)
                    .roundedSM
                    .padding(
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6))
                    .make(),
              ),
              Positioned(
                top: 14,
                right: 10,
                child: VxBox(
                        child: Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 14,
                    ),
                    4.widthBox,
                    Text(
                      "255",
                      style: AppStyles.regular(color: Colors.white),
                    )
                  ],
                ))
                    .color(Colors.black26)
                    .roundedSM
                    .padding(
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6))
                    .make(),
              ),
              Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Column(
                    children: [
                      Text(
                        "Professor Albus Dumbledore was the greatest sorceror of all times"
                            .allWordsCapitilize(),
                        style: AppStyles.regular(color: AppColors.white),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: AppColors.white,
                          ),
                          5.widthBox,
                          Text(
                            "Hello",
                            style: AppStyles.regular(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ).box.roundedSM.clip(Clip.hardEdge).make();
        });
  }
}
