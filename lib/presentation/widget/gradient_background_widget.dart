import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../styles/colors.dart';

class GradientBackGroundWidget extends StatelessWidget {
  final Widget? child;
  const GradientBackGroundWidget({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.65.h),
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.blue,
            AppColor.blue.withOpacity(0.50),
            AppColor.white,
          ],
          stops: [
            0.02.h,
            0.05.h,
            1.h,
          ],
        ),
      ),
      child: child,
    );
  }
}
