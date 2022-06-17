import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/register_cubit/register_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/register_cubit/register_state.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import '../../styles/colors.dart';
import '../../widget/button.dart';
import '../../widget/text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmedPasswordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.registerModel.status == 200) {
              Navigator.pushReplacementNamed(context, homeScreen,
                  arguments: state.registerModel);
              toast(msg: state.registerModel.message,color: Colors.green);
              // print(state.userModel.account![0].email);
            }
            if (state.registerModel.status == 408) {
              toast(msg : state.registerModel.message,color: AppColor.red) ;
            }
            if (state.registerModel.status == 214) {
              toast(msg : state.registerModel.message,color: AppColor.red) ;
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
              height: MediaQuery.of(context).size.height * .23,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .77,
              decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: textFieldOfLogin(context),
                    ),
                    buttons(context)
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget textFieldOfLogin(BuildContext context) => Column(
        children: [
          defaultTextFormField(
            hintText: 'Full Name',
            validate: (value) {
              if (value!.isEmpty) {
                return 'Please enter your Name';
              }
              return null;
            },
            controller: nameController,
            maxLines: 1,
            type: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          defaultTextFormField(
            hintText: 'Email',
            validate: (value) {
              if (value!.isEmpty) {
                return 'Please enter your Email';
              }
              return null;
            },
            controller: emailController,
            maxLines: 1,
            type: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          defaultTextFormField(
            hintText: 'Phone',
            validate: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone';
              }
              return null;
            },
            controller: phoneController,
            maxLines: 1,
            type: TextInputType.number,
          ),
          const SizedBox(
            height: 10,
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
              obscure: RegisterCubit.get(context).obscure,
              suffix: RegisterCubit.get(context).suffix,
              suffixPressed: RegisterCubit.get(context).suffixPressed),
          const SizedBox(
            height: 10,
          ),
          defaultTextFormField(
              hintText: 'Confirmed Password',
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your confirmed password';
                }
                return null;
              },
              controller: confirmedPasswordController,
              maxLines: 1,
              type: TextInputType.text,
              obscure: RegisterCubit.get(context).obscure,
              suffix: RegisterCubit.get(context).suffix,
              suffixPressed: RegisterCubit.get(context).suffixPressed),
        ],
      );

  bool obscure = true;
  IconData suffix = Icons.visibility_off_outlined;

  void Function()? suffixPressed() {
    obscure = !obscure;
    suffix =
        obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    return null;
  }

  Widget buttons(BuildContext context) => Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            defaultButton(
                onPreesed: () {
                  Navigator.pushReplacementNamed(context, loginScreen);
                },
                text: 'Login'),
            defaultButton(
                onPreesed: () {
                  if (formKey.currentState!.validate()) {
                    RegisterCubit.get(context).userRegister(
                      email: emailController.text,
                      password: passwordController.text,
                      name: nameController.text,
                      phone: passwordController.text,
                    );
                  }
                },
                text: 'Register'),
          ],
        ),
      );
}
