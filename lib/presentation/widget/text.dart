import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/contants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class AccountText extends StatelessWidget {
  const AccountText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        style: const TextStyle(
          color: AppColor.primary,
          fontSize: 22,
        ),
      ),
    );
  }
}
