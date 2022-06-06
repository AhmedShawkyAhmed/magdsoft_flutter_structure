import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final Widget? suffix;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hint,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColor.darkSilver,
            )),
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColor.darkSilver2,
        ),
        fillColor: AppColor.brightGray,
        filled: true,
        hoverColor: Colors.red,
        suffix: suffix,
      ),
    );
  }
}
