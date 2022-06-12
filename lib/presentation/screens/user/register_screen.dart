import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/navigator.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/text_field.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var confirmPassController = TextEditingController();
    var formKey = GlobalKey<FormState>();
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
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(40.0),
                            topStart: Radius.circular(40.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            top: 50, start: 50, end: 50.0, bottom: 50.0),
                        child: Form(
                          key: formKey,
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
                              const SizedBox(
                                height: 10,
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
                              const SizedBox(
                                height: 10,
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
                              const SizedBox(
                                height: 10,
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
                              const SizedBox(
                                height: 10,
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
                                  if (phoneController.text != confirmPassController.text) {
                                    return "Password does not match";
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              state is! GlobalRegisterLoading
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: defaultButton(
                                              onPressed: () {
                                                if (formKey.currentState !=
                                                        null &&
                                                    formKey.currentState!
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
