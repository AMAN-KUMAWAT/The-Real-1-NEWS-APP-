import 'package:flutter/material.dart';
import 'package:news_app_con/resources/consts/app_styles.dart';
import 'package:news_app_con/resources/consts/colors.dart';
import 'package:news_app_con/views/widgets/profile_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var titleList = [
      "Bookmarks",
      "Contact Us",
      "Rate App",
      "Privacy policy",
      "About Us"
    ];
    var colors = [
      AppColors.bookMarkCard,
      AppColors.contactCard,
      AppColors.rateCard,
      AppColors.privacyCard,
      AppColors.aboutCard
    ];
    var iconList = [
      Icons.bookmark_outline,
      Icons.mail_outline,
      Icons.star_outline,
      Icons.lock_outline,
      Icons.info_outline
    ];
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          50.heightBox,
          Image.asset("assets/images/logo.png"),
          5.heightBox,
          Text(
            "Powered By AMAN KUMAWAT",
            style: AppStyles.semiBold(size: 10),
          ),
          20.heightBox,
          ListView.builder(
              itemCount: titleList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ProfileTile(
                    title: titleList[index],
                    icon: iconList[index],
                    color: colors[index]);
              })
        ],
      ),
    );
  }
}
