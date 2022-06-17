import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.primaryColor,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryColor,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      //statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  // text field in sign in and register
  inputDecorationTheme: InputDecorationTheme(
    
    filled: true,
    fillColor: AppColors.textInputFillColor,
    hintStyle: TextStyle(
      color: AppColors.hintTextInputColor,
      fontSize: 17,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.textInputBorderColor,
        width: 1,
      ),
    ),
  ),
  // all buttons except logout button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStateProperty.all(AppColors.primaryButtonColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.secondaryColor,
        ),
      ),
    ),
  ),
  textTheme: TextTheme(
    headline4: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryColor,
    ),
    headline5: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryColor,
    ),
    headline6: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryColor,
    ),
    bodyText1: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryColor,
    ),
    bodyText2: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryColor,
    ),
  ),
);
