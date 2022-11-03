import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../widget/gradient_background_widget.dart';

class BackgroundView extends StatelessWidget {
  final Widget child;
  const BackgroundView({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            const GradientBackGroundWidget(),
            Transform.translate(
              offset: Offset(4.6.w, 5.3.h),
              child: SizedBox(
                width: 91.w,
                height: 90.h,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
