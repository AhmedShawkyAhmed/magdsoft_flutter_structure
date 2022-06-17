import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_state.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../widget/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is PostDataSuccessState) {
            if (state.userModel.status == 200) {
              Navigator.pushReplacementNamed(context, homeScreen,
                  arguments: state.userModel);
            }
            if (state.userModel.status == 404) {
              //Fluttertoast();
              toast(msg: state.userModel.message, color: AppColor.red);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.blue,
            body: buildBody(context),
          );
        },
      ),
    );
  }

  Widget buildBody(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: MediaQuery.of(context).size.height * .3,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .7,
              decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 150, left: 50, right: 50),
                      child: textFieldOfLogin(context),
                    ),
                    buttons(context),
                  ],
                ),
              ),
            ),

          ],
        ),
      );

  Widget textFieldOfLogin(BuildContext context) => Column(
        children: [
          defaultTextFormField(
            hintText: 'Email',
            validate: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            controller: emailController,
            maxLines: 1,
            type: TextInputType.text,
          ),
          const SizedBox(
            height: 20,
          ),
          defaultTextFormField(
              hintText: 'Password',
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              controller: passwordController,
              maxLines: 1,
              type: TextInputType.text,
              obscure: LoginCubit.get(context).obscure,
              suffix: LoginCubit.get(context).suffix,
              suffixPressed: LoginCubit.get(context).suffixPressed),
        ],
      );

  Widget buttons(BuildContext context) => Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            defaultButton(
                onPreesed: () {
                  if (formKey.currentState!.validate()) {
                    LoginCubit.get(context).userLogin(
                        email: emailController.text,
                        password: passwordController.text);
                  }
                },
                text: 'Login'),
            defaultButton(
                onPreesed: () {
                  Navigator.pushNamed(context, registerScreen);
                },
                text: 'Register'),
          ],
        ),
      );
}
