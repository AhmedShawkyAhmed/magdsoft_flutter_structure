import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

final FToast fToast = FToast();

showToast(String? text, BuildContext context) {
  fToast.init(context);
  Widget toast = Container(
    padding: EdgeInsets.symmetric(horizontal: 2.4.w, vertical: 1.2.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2.5.h),
      color: AppColor.blue,
    ),
    child: Text(
      text!,
      style: TextStyle(color: AppColor.white),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}
