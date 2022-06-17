import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/app_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/text_input_field.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widget/change_langauge_button.dart';
import '../../widget/toast.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final _key = GlobalKey<FormState>();
  @override
  void initState() {
    fToast.init(context);
    super.initState();
  }

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
                          return null;
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
                          return null;
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
                          return null;
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
                          return null;
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
                          return null;
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
                            BlocListener<GlobalCubit, GlobalState>(
                              listener: (context, state) {
                                if (state is GlobalAuthState) {
                                  if (state.status ==
                                      GlobalStateStatus.userLoaded) {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.userRoute);
                                  }
                                  if (state.status ==
                                      GlobalStateStatus.submissionFailure) {
                                    showToast(state.errorMessage);
                                  }
                                }
                              },
                              child: AppButton(
                                text: AppLocalizations.of(context)!.register,
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    context
                                        .read<GlobalCubit>()
                                        .registerWithEmailAndPasswordAndPhone(
                                          _emailController.text,
                                          _passwordController.text,
                                          _phoneController.text,
                                          _fullNameController.text,
                                        );
                                  }
                                },
                              ),
                            ),
                            AppButton(
                              text: AppLocalizations.of(context)!.login,
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, Routes.loginRoute);
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
