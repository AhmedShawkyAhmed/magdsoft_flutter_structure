import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class CustomExpansionPanel extends StatelessWidget {
  final String header, content;
  const CustomExpansionPanel({
    Key? key,
    required this.content,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.8.h),
      child: Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0.h)),
        elevation: 5,
        child: ExpansionTile(
          expandedAlignment: Alignment.bottomLeft,
          childrenPadding:
              EdgeInsets.only(left: 1.7.h, right: 1.7.h, bottom: 1.7.h),
          title: Text(
            header,
            style: const TextStyle(
              color: AppColor.blue,
            ),
          ),
          children: [
            Text(
              content,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.fontblack,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
