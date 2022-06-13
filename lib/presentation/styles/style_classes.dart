import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:loading_indicator/loading_indicator.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class LoaderButton extends StatelessWidget {
  const LoaderButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      width: 15.w,
      height: 10.h,
      child: const LoadingIndicator(
        indicatorType: Indicator.circleStrokeSpin,
        colors: [Colors.white],
      ),
    ));
  }
}

class PrimaryButton extends StatefulWidget {
  const PrimaryButton(
      {Key? key,
      required this.title,
      this.titleColor,
      this.onTap,
      this.color,
      this.reduis,
      this.fontWeight})
      : super(key: key);

  final String title;
  final Color? titleColor;
  final Function()? onTap;
  final Color? color;
  final FontWeight? fontWeight;
  final double? reduis;

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(widget.color!),
        backgroundColor: MaterialStateProperty.all<Color>(widget.color!),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: widget.color!),
          ),
        ),
      ),
      child: Container(
        child: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.color,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.reduis ?? 15),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatefulWidget {
  const SecondaryButton({required this.title, this.onTap, this.color});

  final String title;
  final Function()? onTap;
  final Color? color;

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(widget.color!),
        backgroundColor: MaterialStateProperty.all<Color>(widget.color!),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: widget.color!),
          ),
        ),
      ),
      child: Container(
        child: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.color,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
              width: 2.0, color: widget.color!, style: BorderStyle.solid),
        ),
      ),
    );
  }
}

class SecondaryButtonBorder extends StatefulWidget {
  const SecondaryButtonBorder({required this.title, this.onTap, this.color});

  final String title;
  final Function()? onTap;
  final Color? color;

  @override
  _SecondaryButtonBorderState createState() => _SecondaryButtonBorderState();
}

class _SecondaryButtonBorderState extends State<SecondaryButtonBorder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Center(
            child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: widget.color,
            fontWeight: FontWeight.w400,
          ),
        )),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(width: 1.0, color: widget.color!),
        ),
      ),
    );
  }
}

class SecondaryButtonWithIcon extends StatefulWidget {
  const SecondaryButtonWithIcon(
      {required this.title, this.onTap, this.color, this.icon});

  final String title;
  final IconData? icon;
  final Function()? onTap;
  final Color? color;

  @override
  _SecondaryButtonWithIconState createState() =>
      _SecondaryButtonWithIconState();
}

class _SecondaryButtonWithIconState extends State<SecondaryButtonWithIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              widget.icon,
              color: widget.color,
              size: 30,
            ),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: widget.color,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
              width: 2.0, color: widget.color!, style: BorderStyle.solid),
        ),
      ),
    );
  }
}
