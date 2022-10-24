import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.width,
    required this.height,
    required this.hintText,
    required this.controller,
    required this.inputType,
    required this.onSaved,
    this.hintSize,
    this.icon,
    this.shadowOffset,
    this.shadowColor,
  }) : super(key: key);
  final double? width, height;
  final String hintText;
  final ValueSetter<String> onSaved;
  final TextInputType inputType;
  final TextEditingController controller;
  final Widget? icon;
  final Color? shadowColor;
  final Offset? shadowOffset;
  final double? hintSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1.h),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.black.withOpacity(0.25),
            blurRadius: 5,
            offset: shadowOffset ?? Offset(0.4.w, 0.2.h),
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        onSaved: (s) => onSaved,
        // validator: (value) {
        //   if (value != null && value.isEmpty) {
        //     return 'This Field is Required';
        //   } else {
        //     return null;
        //   }
        // },

        textDirection: TextDirection.ltr,
        textAlign: TextAlign.start,
        cursorColor: AppColor.blue,
        decoration: InputDecoration(
          suffixIcon: icon,
          errorBorder: InputBorder.none,
          fillColor: Colors.transparent,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: 
              TextStyle(
                fontSize: hintSize ?? 8.sp,
                height: 1.2,
              ),
        ),
      ),
    );
  }
}
