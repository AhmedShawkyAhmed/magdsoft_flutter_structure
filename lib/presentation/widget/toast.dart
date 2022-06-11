import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void showToast({
  required String msg,
  required ToastStates state,
  double fontSize = 16,
  int seconds = 3,
}) =>
    BotToast.showText(
      text: msg,
      duration: Duration(seconds: seconds),
      contentColor: toastColor(state),
      clickClose: true,
      align: const Alignment(0, -0.9),
    );

enum ToastStates { sUCCESS, eRROR, wARNING }

Color toastColor(ToastStates state) {
  switch (state) {
    case ToastStates.sUCCESS:
      return Colors.green;
    case ToastStates.eRROR:
      return Colors.red;
    case ToastStates.wARNING:
      return Colors.yellow;
  }
}
