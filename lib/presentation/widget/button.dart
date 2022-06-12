
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

Widget defaultButton({
  required Function onPressed,
  required String text,
}){
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    style: TextButton.styleFrom(
      backgroundColor: DEFAULT_COLOR,
      fixedSize: const Size(10.0,50.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
    ),
    child: Text(text),
  );
}