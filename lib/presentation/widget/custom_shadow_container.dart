import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomShadowContainer extends StatelessWidget {
  final double width, height, radius;
  final Widget child;
  final Color? color;

  const CustomShadowContainer(
      {Key? key,
      required this.child,
      required this.height,
      required this.radius,
      required this.width,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), //2.h
          color: color ?? Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0.2.h),
                spreadRadius: 0.1.w,
                color: Colors.black.withOpacity(0.5),
                blurRadius: 1.h),
          ]),
      child: child,
    );
  }
}
