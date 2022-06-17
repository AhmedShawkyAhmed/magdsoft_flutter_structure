import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

Widget defaultTextFormField({
  TextEditingController? controller,
  TextInputType? type,
  bool obscure = false,
  String? Function(String?)? validate,
  int? maxLines,
  Color? color = AppColor.lightGrey,
  IconData? suffix,
  void Function()? suffixPressed,
  String? hintText,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: obscure,
      validator: validate,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: color,
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
            color: AppColor.greyOfText,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: AppColor.greyOfText)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: AppColor.greyOfText)),
      ),
    );
