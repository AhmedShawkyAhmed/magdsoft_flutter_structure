import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';

import '../resources/strings_manager.dart';

class LoginRegisterRow extends StatelessWidget {
  const LoginRegisterRow(
      {Key? key, required this.onLogin, required this.onRegister})
      : super(key: key);

  final Function onLogin;
  final Function onRegister;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          flex: 8,
          child: CustomButton(
              title: AppStrings.register.tr(),
              onPressed: () {
                onRegister();
              }),
        ),
        const Spacer(flex: 2),
        Expanded(
          flex: 8,
          child: CustomButton(
              title: AppStrings.login.tr(),
              onPressed: () {
                onLogin();
              }),
        ),
        const Spacer(),
      ],
    );
  }
}
