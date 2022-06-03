import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    fontFamily: 'cairo',
    scaffoldBackgroundColor: AppColor.white,
    primaryColor: AppColor.primary,
    cardTheme: CardTheme(
        color: AppColor.white,
        shadowColor: AppColor.grey,
        elevation: AppSize.s1_5),
    appBarTheme: AppBarTheme(
        color: AppColor.primary,
        elevation: AppSize.s0,
        centerTitle: true,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s30, color: AppColor.white),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        )),
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: AppColor.grey,
        buttonColor: AppColor.primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle:
                getRegularStyle(color: AppColor.white, fontSize: FontSize.s20),
            primary: AppColor.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s8)))),
    textTheme: TextTheme(
        displayLarge:
            getRegularStyle(color: AppColor.primary, fontSize: FontSize.s24),
        headlineLarge:
            getBoldStyle(color: AppColor.darkGrey, fontSize: FontSize.s16),
        headlineMedium:
            getRegularStyle(color: AppColor.darkGrey, fontSize: FontSize.s14),
        titleLarge:
            getBoldStyle(color: AppColor.primary, fontSize: FontSize.s16),
        titleMedium:
            getRegularStyle(color: AppColor.black, fontSize: FontSize.s16),
        titleSmall:
            getRegularStyle(color: AppColor.black, fontSize: FontSize.s14),
        bodySmall: getRegularStyle(color: AppColor.primary),
        labelSmall: getBoldStyle(color: AppColor.primary)),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle:
            getRegularStyle(color: AppColor.grey, fontSize: FontSize.s18),
        labelStyle:
            getRegularStyle(color: AppColor.black, fontSize: FontSize.s18),
        errorStyle: getRegularStyle(color: AppColor.error),
        filled: true,
        fillColor: AppColor.lightGrey,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.darkGrey, width: AppSize.s1),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColor.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.error, width: AppSize.s1),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColor.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
  );
}
