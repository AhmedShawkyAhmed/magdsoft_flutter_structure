import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../styles/GeneralComponents.dart';
import '../shared/splash_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     var golbalkey=GlobalKey<FormState>();
    return ScreenUtilInit(builder: (context,child){
      return Scaffold(
        body: BlocConsumer<GlobalCubit, GlobalState>(
          builder: (context, state) {
            var cubit = GlobalCubit.get(context);
            return SafeArea(
              child: Stack(
                children: [
                  Container(
                    color: AppColor.Blue,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/images/logo1.png"),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Column(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(

                        height: 460.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:20,right: 20,left: 20,bottom: 20),
                          child: SingleChildScrollView(
                            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                            child: Form(
                              key: golbalkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MakeTextFormField(
                                      controller: cubit.RegisterUserName,
                                      labelText: "Full Name",
                                      iconData: Icons.person,
                                      textInputType: TextInputType.text,
                                      validator: (Text) {}),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  MakeTextFormField(
                                      controller: cubit.RegisterEmail,
                                      labelText: "Email",
                                      iconData: Icons.email_outlined,
                                      textInputType: TextInputType.emailAddress,
                                      validator: (Text) {
                                        if (Text.isEmpty) {
                                          return "please enter your email adders";
                                        } else {
                                          return null;
                                        }
                                      }),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  MakeTextFormField(
                                      controller: cubit.RegisterPhoneNumber,
                                      labelText: "Phone",
                                      iconData: Icons.phone,
                                      textInputType: TextInputType.phone,
                                      validator: (Text) {}),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  MakeTextFormField(
                                      controller: cubit.RegisterPassword,
                                      labelText: "Password",
                                      iconData: Icons.lock_open_outlined,
                                      textInputType: TextInputType.visiblePassword,
                                      ObscureText: cubit.isPasswordconfiromRegister,
                                      Iconsuffix: cubit.suffixconfiromRegister,
                                      suffixPressed: () {
                                        cubit.checkvisibilityconfiromRegister();
                                      },
                                      OnFieldSubmitted: (value) {
                                        // if (cubit.golbalkeyRegister.currentState!
                                        //     .validate()) {
                                        //   cubit.Register();
                                        // }
                                      },
                                      validator: (password) {
                                        if (password.isEmpty) {
                                          return "please enter your password";
                                        } else {
                                          return null;
                                        }
                                      }),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  MakeTextFormField(
                                      controller: cubit.RegisterConfirmPassword,
                                      labelText: "Confirm Password",
                                      iconData: Icons.lock_open_outlined,
                                      textInputType: TextInputType.visiblePassword,
                                      Iconsuffix: cubit.suffixRegister,
                                      suffixPressed: () {
                                        cubit.checkvisibilityRegister();
                                      },
                                      ObscureText: cubit.isPasswordRegister,
                                      OnFieldSubmitted: (value) {
                                        // if (cubit.golbalkeyRegister.currentState!
                                        //     .validate()) {
                                        //   cubit.Register();
                                        // }
                                      },
                                      validator: (password) {
                                        if (password.isEmpty) {
                                          return "please enter your confirm password";
                                        } else {
                                          return null;
                                        }
                                      }),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      MakeDafultButton(
                                          circularRadius: 15.r,
                                          onPressed: () {
                                            if (golbalkey.currentState!
                                                .validate()) {
                                              cubit.Register();
                                            }
                                          },
                                          text: "register"),
                                      MakeDafultButton(
                                          circularRadius: 15.r,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SplashScreen()));
                                          },
                                          text: "login"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {},
        ),
      );
    });
  }
}

