
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

class CardSlidWidget extends StatelessWidget {
  const CardSlidWidget({
    Key? key,
    required this.image,
    required this.subTitle,
    required this.title,
  }) : super(key: key);
  final Widget image;
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black.withOpacity(0.50),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.h)),
      margin: EdgeInsets.symmetric(horizontal: 2.3.w),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(1.h),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              image,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.7.w, vertical: 1.h),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColor.white,
                            fontSize: 9.sp),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColor.white,
                            fontSize: 9.sp),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
