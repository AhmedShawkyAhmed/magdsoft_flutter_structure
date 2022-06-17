import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/app_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/text_input_field.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widget/change_langauge_button.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final _key = GlobalKey<FormState>();
  RegisterScreen({Key? key}) : super(key: key);

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
                    child: SizedBox(
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
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: double.infinity,
                        ),
                      ),
                      TextInputField(
                        validator: ((input) {
                          if (input!.isEmpty) {
                            return 'Full name is empty';
                          }
                        }),
                        controller: _fullNameController,
                        hintText: AppLocalizations.of(context)!.fullName,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextInputField(
                        validator: ((input) {
                          if (input!.isEmpty) {
                            return 'Email is empty';
                          }
                          if (!(input.isValidEmail)) {
                            return 'Email is not valid';
                          }
                        }),
                        controller: _emailController,
                        hintText: AppLocalizations.of(context)!.email,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextInputField(
                        validator: ((input) {
                          if (input!.isEmpty) {
                            return 'Phone number is empty';
                          }
                          if (!input.isValidPhone) {
                            return 'Not valid phone number';
                          }
                        }),
                        controller: _phoneController,
                        hintText: AppLocalizations.of(context)!.phone,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextInputField(
                        validator: ((input) {
                          if (input!.isEmpty) {
                            return 'Password is empty';
                          }
                          if (input.length < 6) {
                            return 'Password is too short';
                          }
                        }),
                        controller: _passwordController,
                        hintText: AppLocalizations.of(context)!.password,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextInputField(
                        validator: ((input) {
                          if (input!.isEmpty) {
                            return 'Password is empty';
                          }
                          if (input != _passwordController.text) {
                            return 'Password not match';
                          }
                          if (input.length < 6) {
                            return 'Password is too short';
                          }
                        }),
                        controller: _confirmPasswordController,
                        hintText: AppLocalizations.of(context)!.confirmPassword,
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
                                if (_key.currentState!.validate()) {}
                              },
                            ),
                            AppButton(
                              text: AppLocalizations.of(context)!.login,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.registerRoute);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
