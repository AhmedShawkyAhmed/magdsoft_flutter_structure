import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/contants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class AppFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final VoidCallback? onSuffixPressed;
  final ValueChanged<String>? onSubmit;
  final String? Function(String?)? validate;
  final ValueChanged<String>? onChanged;
  const AppFormField({
    Key? key,
    required this.hint,
    required this.type,
    required this.controller,
    this.prefixIcon,
    this.isPassword = false,
    this.suffixIcon,
    this.onChanged,
    this.onSuffixPressed,
    this.onSubmit,
    this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kWidth * 0.8,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        cursorColor: AppColor.black,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: AppColor.grey,
          ),
          suffix: suffixIcon != null
              ? GestureDetector(
                  onTap: onSuffixPressed, child: Icon(suffixIcon, size: 20))
              : null,
          labelText: hint,
          fillColor: AppColor.grey,
          filled: true,
          labelStyle: const TextStyle(color: AppColor.darkGrey),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.black),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.black),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        validator: validate,
      ),
    );
  }
}
