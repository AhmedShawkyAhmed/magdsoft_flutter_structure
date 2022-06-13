import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.text,
    this.icon,
    this.iconSize,
    // this.flag,
  }) : super(key: key);
  String? text;
  dynamic icon;
  double? iconSize;
  // Flag? flag;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Center(
        child: Container(
          width: 94.w,
          height: 6.4.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: AppColors.inputFieldColor,
            border: Border.all(
              color: AppColors.buttonBorderColor,
              width: 0.4,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      text!,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Icon(
                  icon,
                  size: iconSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
