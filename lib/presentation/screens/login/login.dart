import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/voids.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/my_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/my_form.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/responsive_spaces.dart';
import '../register/register.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (context, state) {
        if(state is LoginSuccess)
        {
          navigateAndFinish(context, const UserProfile());
          Fluttertoast.showToast(msg: 'Login Success');
          // CacheHelper.saveDataSharedPreference(key: 'name', value: state.loginModel.account![0].name);
          // CacheHelper.saveDataSharedPreference(key: 'email', value: state.loginModel.account![0].email);
          // CacheHelper.saveDataSharedPreference(key: 'phone', value: state.loginModel.account![0].phone);
        }
      },
      builder:  (context, state) {
      return  Scaffold(
          backgroundColor: AppColor.mainColor,
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Center(
                      child: Image.asset('assets/images/flutter_logo.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsiveValue(
                          context,
                          20,
                        ),
                        vertical: responsiveValue(
                          context,
                          50,
                        ),
                      ),
                      child: MyButton(
                        onPressed: ()
                        {

                        },
                        text: 'عربي',
                        colorText: AppColor.mainColor,
                        colorButton: AppColor.white,
                        isLoading: false,
                        width: responsiveValue(context, 90),
                      ),
                    )
                  ],
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyForm(
                                label: 'Email',
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                error: 'email is required',
                                isPassword: false
                            ),
                            space20Vertical(context),
                            MyForm(
                                label: 'Password',
                                controller: passwordController,
                                type: TextInputType.text,
                                error: 'password is required',
                                isPassword: true
                            ),
                            space100Vertical(context),
                            Row(
                              children: [
                                Expanded(
                                  child: MyButton(
                                    onPressed: ()
                                    {
                                      navigateTo(context, RegisterScreen());
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
                                      if (formKey.currentState!.validate())
                                      {
                                        // navigateAndFinish(context, const UserProfile());
                                        GlobalCubit.get(context).login(
                                            email: emailController.text,
                                            password: passwordController.text
                                        );
                                      }
                                      else
                                      {
                                        Fluttertoast.showToast(msg: 'Please Enter Your Data Correctly');
                                      }

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
                  )
              ),
            ],
          ),
        ) ;
      },
    );
  }
}
