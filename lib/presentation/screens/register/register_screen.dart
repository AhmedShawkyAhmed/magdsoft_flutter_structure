import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/app_strings.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/curved_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text_field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:magdsoft_flutter_structure/utils/navigation.dart';
import 'package:magdsoft_flutter_structure/utils/string_matcher.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    fToast.init(context);
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final globalCubit = GlobalCubit.get(context);
    return Scaffold(
      backgroundColor: AppColor.mediumPersianBlue,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Image(
                          image: Svg(
                            'assets/images/flutter_logo.svg',
                            size: Size(160, 160),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CurvedContainer(
                        child: Center(
                          child: Column(
                            children: [
                              CustomTextField(
                                hint: 'Full Name',
                                controller: _fullNameController,
                                keyboardType: TextInputType.name,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Full name is required';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              CustomTextField(
                                hint: 'Email',
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is required';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              CustomTextField(
                                hint: 'Phone',
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Phone is required';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              CustomTextField(
                                hint: 'Password',
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  } else {
                                    return null;
                                  }
                                },
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              CustomTextField(
                                hint: 'Confirm Password',
                                controller: _confirmPasswordController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Confirm password is required';
                                  } else {
                                    return null;
                                  }
                                },
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              BlocConsumer<GlobalCubit, GlobalState>(
                                listener: (context, state) {
                                  if(state is ErrorRegisterState){
                                    fToast.removeCustomToast();
                                    showToast(state.message);
                                  }
                                  else if(state is SuccessLoginState){
                                    goToScreenAndFinish(
                                        context: context,
                                        routeName: AppStrings.home,
                                        arguments: state.getAccounts);
                                  }
                                },
                                builder: (context, state) {
                                  if(state is LoadingRegisterState){
                                    return const CircularProgressIndicator();
                                  }
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          textButton: 'Register',
                                          onPressed: () {
                                            if (_passwordController.text !=
                                                _confirmPasswordController
                                                    .text) {
                                              showToast(
                                                  'Password is not matching');
                                            } else {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                globalCubit.registerAccount(
                                                  fullName:
                                                      _fullNameController.text,
                                                  email: _emailController.text,
                                                  phone: _phoneController.text,
                                                  password:
                                                      _passwordController.text,
                                                );
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 38,
                                      ),
                                      Expanded(
                                        child: CustomButton(
                                          textButton: 'Login',
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
