import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FToast fToast = FToast();
showToast(String? text) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      //color: AppColors.lightGray,
    ),
    child: Text(text!),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 2),
  );
}

Future<bool?> toast({String? msg , Color? color }) => Fluttertoast.showToast(
    msg: msg!,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0
);