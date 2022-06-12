
import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required String hintText,
  required String? Function(String? value)  validator,
  required TextInputType keyboardType,
  bool obscureText=false,
}){
  return TextFormField(
    obscureText:obscureText ,
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      filled: true,
      fillColor: const Color.fromRGBO(236, 236, 236, 1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Color.fromRGBO(112, 112, 112, 1),
        ),
      ),
      hintText: hintText,
    ),
    validator: validator,
  );
}