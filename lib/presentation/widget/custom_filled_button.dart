import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class CustomFilledButton extends StatelessWidget {
  final String label;
  final double width, height, radius;
  final bool withShadow;

  final VoidCallback onTap;
  const CustomFilledButton({
    Key? key,
    required this.height,
    required this.width,
    required this.radius,
    required this.onTap,
    required this.label,
    required this.withShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: radius,
      borderRadius: BorderRadius.circular(5.h),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0XFF0062BD),
              Color.fromARGB(255, 111, 179, 241),
            ],
            stops: [0.1, 1],
          ),
          boxShadow: [
            withShadow
                ? BoxShadow(
                    offset: Offset(0, 0.2.h),
                    spreadRadius: 0.1.w,
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 1.h)
                : BoxShadow(),
          ],
          color: Colors.red,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 20,
                color: AppColor.white,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
