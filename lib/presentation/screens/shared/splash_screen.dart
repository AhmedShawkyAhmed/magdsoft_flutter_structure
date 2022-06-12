
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../styles/GeneralComponents.dart';
import '../user/User.dart';
import '../user/user_profile.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child){
      return Scaffold(
        body: BlocConsumer<GlobalCubit,GlobalState>(
          builder: (context,state) {
            var cubit=GlobalCubit.get(context);
            return  SafeArea(
              child: Stack(
                children: [
                  Container(
                    color: AppColor.Blue,
                    width: double.infinity,
                    child: Image.asset("assets/images/logo1.png"),
                  ),
                  Positioned(
                    top: -15,
                    right: -15,
                    child: Padding(
                      padding: EdgeInsets.all(40.sp),
                      child: MakeDafultButton(onPressed: (){},
                          circularRadius: 65.r,
                          color: AppColor.white,
                          TextColor: AppColor.Blue,

                          text: "عربي"),
                    ),
                  ),
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LayoutBuilder(
                        builder: (context,constraints){
                          return Container(
                            height: 400.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.r)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 60,top:100,right: 20,left: 20),
                              child: Form(
                                key: cubit.golbalkey,
                                child: Column(
                                  children: [
                                    MakeTextFormField(
                                        controller: cubit.LoginEmail,
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

                                        controller: cubit.LoginPassword,
                                        labelText: "Password",
                                        iconData: Icons.lock_open_outlined,
                                        textInputType: TextInputType.visiblePassword,
                                        Iconsuffix: cubit.suffixLogin,
                                        suffixPressed: () {
                                          cubit.checkvisibilityLogin();
                                        },
                                        ObscureText:cubit.isPasswordLogin,
                                        OnFieldSubmitted: (value) {
                                          // if (cubit.golbalkey.currentState!.validate()) {
                                          //   cubit.Login();
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
                                      height:20.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        MakeDafultButton(
                                            circularRadius: 15.r,
                                            onPressed:(){
                                              Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterScreen()));
                                            }, text: "register"),
                                        MakeDafultButton(
                                            circularRadius: 15.r,
                                            onPressed:(){
                                              if (cubit.golbalkey.currentState!.validate()) {
                                                cubit.Login();
                                                  Navigator.push(context, MaterialPageRoute(
                                                      builder: (context) => User()));
                                              }
                                            }, text: "login"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                ],
              ),
            );
          },
          listener: (context,state){

          },
        ),
      );
    } );
  }
}
