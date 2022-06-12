
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

Widget defaultButton({
  required Function onPressed,
  required String text,
  double width=10.0,
  double height=50.0,
  Color backgroundColor=DEFAULT_COLOR,
}){
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    style: TextButton.styleFrom(
      backgroundColor: backgroundColor,
      fixedSize:  Size(width,height),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
    ),
    child: Text(text),
  );
}