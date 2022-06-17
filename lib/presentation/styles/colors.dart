import 'package:flutter/material.dart';


class AppColors{
  static Color  primaryColor = HexColor.fromHex('005DA3');
  static Color  secondaryColor = HexColor.fromHex('FFFFFF');
  static Color  textInputBorderColor = HexColor.fromHex('707070');
  static Color  textInputFillColor = HexColor.fromHex('ECECEC');
  static Color  primaryButtonColor = HexColor.fromHex('005DA3');
  static Color  secondaryButtonColor = HexColor.fromHex('AD002F');
  static Color  hintTextInputColor = HexColor.fromHex('7B7B7B');
}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#','');
    if(hexColorString.length == 6){
      hexColorString = "FF" + hexColorString;
    }
      return Color(int.parse(hexColorString,radix: 16));
  }
}
