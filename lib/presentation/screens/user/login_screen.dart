import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/register_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/navigator.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/text_field.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (context,state){
        if(state is GlobalLoginSuccess){
          if(GlobalCubit.get(context).accountModel!.status==200){
            navigateAndFinish(context, const UserScreen());
          }
          if(GlobalCubit.get(context).accountModel!.status==404){
            Fluttertoast.showToast(
              msg: '${GlobalCubit.get(context).accountModel!.message}',
              backgroundColor: Colors.red,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM
            );
          }
        }
      },
        builder: (context,state){
        var cubit=GlobalCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Container(
              color: DEFAULT_COLOR,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.only(end: 20.0, top: 50.0),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            height: 30.0,
                            width: 80.0,
                            child: ElevatedButton(
                              onPressed: () {
                              },
                              child: const Text(
                                'عربي',
                                style: TextStyle(color: DEFAULT_COLOR),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.only(top: 30.0),
                          child: Center(
                              child: Image(
                                  image: AssetImage('assets/images/appBarLogo.png'))),
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      //height: screenHeight*0.66,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(40.0),
                            topStart: Radius.circular(40.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(top: 120,start: 50,end: 50.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
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
                              height: 20,
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
                              const SizedBox(height: 90,),
                              state is! GlobalLoginLoading?
                              Row(
                                children: [
                                  Expanded(
                                    child: defaultButton(onPressed: (){
                                      navigateTo(context, RegisterScreen());
                                    }, text: 'Register'),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: defaultButton(onPressed: (){
                                      if (formKey.currentState != null && formKey.currentState!.validate()) {
                                        cubit.login(emailController.text, passwordController.text);
                                      }
                                    }, text: 'Login'),
                                  )
                                ],
                              ):const CircularProgressIndicator(color: DEFAULT_COLOR,),
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
