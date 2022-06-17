import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/app_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/change_langauge_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/text_input_field.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 3.h),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      height: 22.h,
                      child: const ChangeLanguageButton(
                        text: 'العربية',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 22.h,
                      child: Image.asset(
                        'assets/images/flutter.png',
                        width: 40.w,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: 22.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Container(
                width: double.infinity,
                height: 72.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: double.infinity,
                      ),
                    ),
                    TextInputField(
                      controller: _emailController,
                      hintText: AppLocalizations.of(context)!.email,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    TextInputField(
                      controller: _passwordController,
                      hintText: AppLocalizations.of(context)!.password,
                      obscureText: true,
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppButton(
                            text: AppLocalizations.of(context)!.register,
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.registerRoute);
                            },
                          ),
                          AppButton(
                            text: AppLocalizations.of(context)!.login,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
