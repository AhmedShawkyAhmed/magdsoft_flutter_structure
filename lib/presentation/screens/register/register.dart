import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/voids.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/login.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/my_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/my_form.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/responsive_spaces.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (context, state) {
        if (state is RegisterSuccess)
        {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Register Success');
        }
      },
      builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColor.mainColor,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset('assets/images/flutter_logo.png'),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        responsiveValue(context, 50),
                      ),
                      topRight: Radius.circular(
                        responsiveValue(context, 50),
                      ),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveValue(
                            context,
                            20,
                          ),
                          vertical: responsiveValue(
                            context,
                            20,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            space40Vertical(context),
                            MyForm(
                                label: 'Full name',
                                controller: fullNameController,
                                type: TextInputType.text,
                                error: 'Full name is required',
                                isPassword: false
                            ),
                            space20Vertical(context),
                            MyForm(
                                label: 'Email',
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                error: 'Email is required',
                                isPassword: false
                            ),
                            space20Vertical(context),
                            MyForm(
                                label: 'Phone',
                                controller: phoneController,
                                type: TextInputType.emailAddress,
                                error: 'Phone is required',
                                isPassword: false
                            ),
                            space20Vertical(context),
                            MyForm(
                                label: 'Password',
                                controller: passwordController,
                                type: TextInputType.text,
                                error: 'Password is required',
                                isPassword: true
                            ),
                            space20Vertical(context),
                            MyForm(
                                label: 'Confirm password',
                                controller: confirmPasswordController,
                                type: TextInputType.text,
                                error: 'Confirm password is required',
                                isPassword: true
                            ),
                            space100Vertical(context),
                            Row(
                              children: [
                                Expanded(
                                  child: MyButton(
                                    onPressed: ()
                                    {
                                      if (formKey.currentState!.validate() || passwordController == confirmPasswordController)
                                      {
                                        GlobalCubit.get(context).register(
                                            name: fullNameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phone: phoneController.text
                                        );
                                      }
                                      else
                                      {
                                        Fluttertoast.showToast(msg: 'Please Enter Your Data Correctly');
                                      }
                                    },
                                    text: 'Register',
                                    colorText: AppColor.white,
                                    colorButton: AppColor.mainColor,
                                    isLoading: false,
                                  ),
                                ),
                                space20Horizontal(context),
                                Expanded(
                                  child: MyButton(
                                    onPressed: ()
                                    {
                                      Navigator.pop(context);
                                    },
                                    text: 'Login',
                                    colorText: AppColor.white,
                                    colorButton: AppColor.mainColor,
                                    isLoading: false,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      );
      },
    );
  }
}
