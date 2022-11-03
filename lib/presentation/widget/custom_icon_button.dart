import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomIconButton extends StatelessWidget {
  final String imagePath;
  const CustomIconButton({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.w,
      height: 12.w,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0.4.w, 0.5.h),
              blurRadius: 20,
            )
          ]),
      child: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          width: 8.8.w,
          height: 8.8.w,
        ),
      ),
    );
  }
}
