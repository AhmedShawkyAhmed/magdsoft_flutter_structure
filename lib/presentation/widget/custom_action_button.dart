import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    Key? key,
    required this.child,
    @required this.onTap,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 5.3.h,
        height: 5.3.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0.2.h, 0.2.h),
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(1.5.h),
        ),
        child: Center(child: child),
      ),
    );
  }
}
