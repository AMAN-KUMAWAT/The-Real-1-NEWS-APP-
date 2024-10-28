import 'package:flutter/material.dart';
import 'package:news_app_con/resources/consts/app_styles.dart';
import 'package:news_app_con/resources/consts/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Function()? onPressed;
  final bool? isSwitch;
  final Function(bool)? onChange;
  final bool? switchValue;
  const ProfileTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      this.onPressed,
      this.isSwitch = false,
      this.onChange,
      this.switchValue = false});

  @override
  State<ProfileTile> createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
  var switchValue = false;
  changeSwitchValue(value) {
    setState(() {
      switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onPressed,
      leading: VxBox(
          child: Icon(
        widget.icon,
        color: AppColors.white,
      )).rounded.p4.color(widget.color).make(),
      title: Text(
        widget.title,
        style: AppStyles.regular(),
      ),
      trailing: widget.isSwitch == false
          ? const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            )
          : Switch(
              value: switchValue,
              onChanged: (value) {
                changeSwitchValue(value);
              }),
    );
  }
}
