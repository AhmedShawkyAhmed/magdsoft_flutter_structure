import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/contants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    this.loading = false,
    this.textColor = AppColor.white,
    this.backgroundColor = AppColor.primary,
    this.splashColor = Colors.white,
    this.radius = 15,
    this.textSize = 18,
    this.heightFactor = 0.08,
    this.widthFactor = 0.4,
    this.onPressed,
  }) : super(key: key);
  final Color textColor;
  final Color splashColor;
  final Color? backgroundColor;
  final String text;
  final double radius;
  final double heightFactor;
  final double widthFactor;
  final double textSize;
  final GestureTapCallback? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: kWidth * widthFactor,
        height: kHeight * heightFactor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
        ),
        child: Center(
          child: !loading
              ? Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: textSize),
                )
              : const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(color: AppColor.white)),
        ),
      ),
    );
  }
}
