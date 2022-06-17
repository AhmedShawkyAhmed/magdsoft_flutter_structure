import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback onPressed;

  const AppButton(
      {Key? key, required this.text, required this.onPressed, this.color})
      : super(key: key);
  factory AppButton.logoutButton({
    text,
    onPressed,
  }) =>
      AppButton(
        text: text,
        color: AppColors.secondaryButtonColor,
        onPressed: onPressed,
      );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 152,
      height: 61,
      child: ElevatedButton(
        style: const ButtonStyle().copyWith(
          backgroundColor:
              MaterialStateProperty.all(color ?? AppColors.primaryButtonColor),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
