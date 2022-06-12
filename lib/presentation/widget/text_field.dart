import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required String hintText,
  required String? Function(String? value) validator,
  required TextInputType keyboardType,
  bool obscureText = false,
  IconData? suffixIcon,
  Function? onPressedIcon,
}) {
  return TextFormField(
    obscureText: obscureText,
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      suffixIcon: IconButton(
        icon: Icon(suffixIcon),
        onPressed: () {
          onPressedIcon!();
        },
      ),
      filled: true,
      fillColor: const Color.fromRGBO(236, 236, 236, 1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Color.fromRGBO(112, 112, 112, 1),
        ),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(color: Color.fromRGBO(123, 123, 123, 1)),
    ),
    validator: validator,
  );
}
