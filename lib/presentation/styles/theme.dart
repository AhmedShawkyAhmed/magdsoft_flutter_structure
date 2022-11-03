import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

appTheme(BuildContext context) {
  return ThemeData(
    textTheme: Theme.of(context).textTheme.copyWith(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColor.fontblack,
            fontSize: 23.sp,
          ),
          headlineMedium: TextStyle(
            color: AppColor.white,
            fontSize: 23.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
    fontFamily: 'Inter',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.blue,
      // centerTitle: true,
    ),
    brightness: Brightness.light,
    primaryColor: AppColor.blue,
    colorScheme: const ColorScheme.light(
      primary: AppColor.blue,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColor.blue,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.blue,
      foregroundColor: Colors.white,
    ),
  );
}
