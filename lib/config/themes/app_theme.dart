import 'package:flutter/material.dart';
import 'package:neon_spaces/core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: "DIN",
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 22.0,
        fontFamily: "DIN",
      ),
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
      toolbarHeight: 90,
    ),
  );
}
