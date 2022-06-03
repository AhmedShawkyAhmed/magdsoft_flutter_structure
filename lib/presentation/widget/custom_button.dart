import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../styles/values_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.title, required this.onPressed, this.color})
      : super(key: key);

  final String title;
  final Function onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s50,
      child: ElevatedButton(
          child: Text(title),
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(primary: color ?? AppColor.primary)),
    );
  }
}
