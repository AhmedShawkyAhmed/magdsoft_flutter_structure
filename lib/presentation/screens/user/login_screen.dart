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


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
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
          double screenHeight=MediaQuery.of(context).size.height;
          double screenWidth=MediaQuery.of(context).size.width;
        var cubit=GlobalCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                color: DEFAULT_COLOR,
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Padding(
                          padding:
                           EdgeInsetsDirectional.only(end: screenWidth*0.05, top: screenHeight*0.06),
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
                         Padding(
                          padding: EdgeInsetsDirectional.only(top: screenHeight*0.02),
                          child: const Center(
                              child: Image(
                                  image: AssetImage('assets/images/appBarLogo.png'))),
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: screenHeight*0.62,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(40.0),
                            topStart: Radius.circular(40.0)),
                      ),
                      child: Padding(
                        padding:  EdgeInsetsDirectional.only(top: screenHeight*0.2,start: screenWidth*0.11,end: screenWidth*0.11,bottom: screenHeight*0.05),
                        child: Form(
                          key: _formKey,
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
                              const Spacer(),
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
                                      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
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
