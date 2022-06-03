import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

SnackBar customSnackBar(
    {required String message, SnackBarStates state = SnackBarStates.WARNING}) {
  return SnackBar(
    content: Text(message),
    backgroundColor: chooseToastColor(state),
  );
}

enum SnackBarStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(SnackBarStates state) {
  Color color;
  switch (state) {
    case SnackBarStates.SUCCESS:
      color = AppColor.green;
      break;
    case SnackBarStates.ERROR:
      color = AppColor.error;
      break;
    case SnackBarStates.WARNING:
      color = AppColor.yellow;
      break;
  }
  return color;
}
