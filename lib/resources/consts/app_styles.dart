import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

class AppStyles {
  static TextStyle regular(
      {Color? color = AppColors.primaryText,
      String? fontfamily = AppFonts.regular,
      double? size = 14.0,
      FontWeight? fontweight = FontWeight.normal}) {
    return TextStyle(
        color: color,
        fontFamily: fontfamily,
        fontSize: size,
        fontWeight: fontweight);
  }

  static TextStyle semiBold(
      {Color? color = AppColors.primaryText,
      String? fontfamily = AppFonts.semiBold,
      double? size = 14.0,
      FontWeight? fontweight}) {
    return TextStyle(
        color: color,
        fontFamily: fontfamily,
        fontSize: size,
        fontWeight: fontweight);
  }

  static TextStyle bold(
      {Color? color = AppColors.primaryText,
      String? fontfamily = AppFonts.bold,
      double? size = 14.0,
      FontWeight? fontweight}) {
    return TextStyle(
        color: color,
        fontFamily: fontfamily,
        fontSize: size,
        fontWeight: fontweight);
  }
}
