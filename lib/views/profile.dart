import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_con/resources/consts/app_styles.dart';
import 'package:news_app_con/resources/consts/colors.dart';
import 'package:news_app_con/views/widgets/bottom.dart';
import 'package:news_app_con/views/widgets/profile_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser?.emailVerified;
  final mail = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    var titleList = [
      "Bookmarks",
      "Dark Mode",
      "Notifications",
      "Contact Us",
      "Rate App",
      "Privacy policy",
      "About Us"
    ];
    var colors = [
      AppColors.bookMarkCard,
      AppColors.darkModeCard,
      AppColors.notificationCard,
      AppColors.contactCard,
      AppColors.rateCard,
      AppColors.privacyCard,
      AppColors.aboutCard
    ];
    var iconList = [
      Icons.bookmark_outline,
      Icons.dark_mode_outlined,
      Icons.notifications_outlined,
      Icons.mail_outline,
      Icons.star_outline,
      Icons.lock_outline,
      Icons.info_outline
    ];
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.blueGrey,
        elevation: 2,
        title: Text(
          "Profile",
          style: AppStyles.semiBold(size: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileTile(
              title: "$mail",
              icon: Icons.person_outline,
              color: AppColors.secondaryButton,
            ),
            10.heightBox,
            Text(
              "General Settings",
              style: AppStyles.semiBold(size: 16),
            ),
            10.heightBox,
            ListView.builder(
                shrinkWrap: true,
                itemCount: titleList.length,
                itemBuilder: (context, index) {
                  return ProfileTile(
                    isSwitch: index == 1 || index == 2 ? true : false,
                    title: titleList[index],
                    icon: iconList[index],
                    color: colors[index],
                  );
                })
          ],
        ),
      ),
      bottomNavigationBar: const Bottom(),
    );
  }
}
