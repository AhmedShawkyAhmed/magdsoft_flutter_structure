import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColor.mediumPersianBlue,
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
        ),
      ),
    );
  }
}
