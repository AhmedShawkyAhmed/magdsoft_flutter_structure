import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_manager.dart';
import 'values_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

BoxDecoration getContainerDefDecoration() {
  return BoxDecoration(
      color: AppColor.white,
      shape: BoxShape.rectangle,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s36),
          topRight: Radius.circular(AppSize.s36)),
      boxShadow: const [BoxShadow(color: Colors.black26)]);
}
