import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class ChangeLanguageButton extends StatelessWidget {
  final String text;
  const ChangeLanguageButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      height: 30,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Text(text,
            style:  TextStyle(
                fontSize: 16,
                textBaseline: TextBaseline.alphabetic,
                color: AppColors.primaryColor)),
      ),
    );
  }
}
