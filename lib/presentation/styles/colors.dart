import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFF005DA3);
  static const Color blueAccent = Color(0xFF1bb0e8);
  static const Color red = Color(0xFFAD002F);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFECECEC);
  static const Color darkGrey = Color(0xFF7B7B7B);
  static const Color black = Color(0xFF707070);

  static Map<int, Color> swatch = {
    50: const Color(0x1A005DA3), //10%
    100: const Color(0x33005DA3), //20%
    200: const Color(0x4D005DA3), //30%
    300: const Color(0x66005DA3), //40%
    400: const Color(0x80005DA3), //50%
    500: const Color(0x99005DA3), //60%
    600: const Color(0xBF005DA3), //70%
    700: const Color(0xCC005DA3), //80%
    800: const Color(0xE6005DA3), //90%
    900: const Color(0xff005DA3), //100%
  };

  static MaterialColor primarySwatch = MaterialColor(0xff005DA3, swatch);
}
