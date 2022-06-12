
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/splash_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../styles/GeneralComponents.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
      builder: (context,state){
        var cubit=GlobalCubit.get(context);
        return ConditionalBuilder(
            condition:cubit.loginModal!=null ,
            builder: (context)=>ScreenUtilInit(builder: (context,child){
              return Scaffold(
                backgroundColor: AppColor.white,
                appBar: AppBar(
                  backgroundColor: AppColor.Blue,
                  title: Text("User Data"),
                  centerTitle: true,
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name:  ${cubit.loginModal!.account![0].name} ",style: TextStyle(
                        fontSize: 25.sp,
                        color: AppColor.Blue,
                      ),),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text("Email:${cubit.loginModal!.account![0].email} ",style:TextStyle(
                        fontSize: 25.sp,
                        color: AppColor.Blue,
                      ),),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text("Phone:  ${cubit.loginModal!.account![0].phone} ",style: TextStyle(
                        fontSize: 25.sp,
                        color: AppColor.Blue,

                      ),),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: MakeDafultButton(
                            circularRadius: 15.r,
                              color: AppColor.Red,
                              onPressed:(){
                                Navigator.push(context, MaterialPageRoute(builder:(context)=>SplashScreen()));
                              }, text: "logout"),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            fallback: (context)=>Center(
              child: CircularProgressIndicator(
                color: AppColor.Blue,
              ),
            ));
      },
      listener: (context,state){},
    );
  }
}
