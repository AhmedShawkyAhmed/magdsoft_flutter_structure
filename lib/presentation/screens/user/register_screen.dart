import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/navigator.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/text_field.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var confirmPassController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {

        if(state is GlobalRegisterSuccess){
          if(GlobalCubit.get(context).model!.status==200){
            navigateAndFinish(context, const LoginScreen());
          }
          if(GlobalCubit.get(context).model!.status==214){
            Fluttertoast.showToast(
                msg: GlobalCubit.get(context).model!.message,
                backgroundColor: Colors.red,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM
            );
          }
        }
      },
      builder: (context, state) {
        double screenHeight=MediaQuery.of(context).size.height;
        double screenWidth=MediaQuery.of(context).size.width;
        var cubit = GlobalCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                color: DEFAULT_COLOR,
                child: Column(
                 children: [
                   const Center(
                       child: Image(
                           image: AssetImage('assets/images/appBarLogo.png'))),
                   Container(
                     width: double.infinity,
                     height: screenHeight*0.68,
                     decoration: const BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadiusDirectional.only(
                           topEnd: Radius.circular(40.0),
                           topStart: Radius.circular(40.0)),
                     ),
                     child: Padding(
                       padding:  EdgeInsetsDirectional.only(top: screenHeight*0.07,start: screenWidth*0.11,end: screenWidth*0.11,bottom: screenHeight*0.026),
                       child: Form(
                         key: _formKey,
                         child: Column(
                           children: [
                             defaultTextFormField(
                               controller: nameController,
                               hintText: 'Full Name',
                               keyboardType: TextInputType.text,
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return 'Name Is Required';
                                 }
                               },
                             ),
                              SizedBox(
                               height: screenHeight*0.015,
                             ),
                             defaultTextFormField(
                               controller: emailController,
                               hintText: 'Email',
                               keyboardType: TextInputType.emailAddress,
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return 'Email Is Required';
                                 }
                               },
                             ),
                              SizedBox(
                               height: screenHeight*0.015,
                             ),
                             defaultTextFormField(
                               controller: phoneController,
                               hintText: 'Phone',
                               keyboardType: TextInputType.phone,
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return 'Phone Is Required';
                                 }
                               },
                             ),
                              SizedBox(
                               height: screenHeight*0.015,
                             ),
                             defaultTextFormField(
                               controller: passwordController,
                               hintText: 'Password',
                               obscureText: cubit.isVisible,
                               suffixIcon: cubit.suffix,
                               onPressedIcon: (){
                                 cubit.changePasswordVisibility();
                               },
                               keyboardType: TextInputType.visiblePassword,
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return 'Password Is Required';
                                 }
                               },
                             ),
                              SizedBox(
                               height: screenHeight*0.015,
                             ),
                             defaultTextFormField(
                               controller: confirmPassController,
                               hintText: 'Confirm Password',
                               obscureText: cubit.isVisible,
                               suffixIcon: cubit.suffix,
                               onPressedIcon: (){
                                 cubit.changePasswordVisibility();
                               },
                               keyboardType: TextInputType.visiblePassword,
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return 'Confirm Password Is Required';
                                 }
                                 if (passwordController.text != confirmPassController.text) {
                                   return "Password does not match";
                                 }
                               },
                             ),
                             const Spacer(),
                             state is! GlobalRegisterLoading
                                 ? Row(
                                     children: [
                                       Expanded(
                                         child: defaultButton(
                                             onPressed: () {
                                               if (_formKey.currentState !=
                                                       null &&
                                                   _formKey.currentState!
                                                       .validate()) {
                                                 cubit.register(
                                                   emailController.text,
                                                   passwordController.text,
                                                   nameController.text,
                                                   phoneController.text,
                                                 );
                                               }
                                             },
                                             text: 'Register'),
                                       ),
                                       const SizedBox(
                                         width: 30,
                                       ),
                                       Expanded(
                                         child: defaultButton(
                                             onPressed: () {
                                               navigateTo(
                                                   context, const LoginScreen());
                                             },
                                             text: 'Login'),
                                       )
                                     ],
                                   )
                                 : const CircularProgressIndicator(
                                     color: DEFAULT_COLOR,
                                   ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ],
                  ),
              ),
            ),
          ),
        );
      },
    );
  }
}
