import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double screenHeight=MediaQuery.of(context).size.height*0.5;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                        const EdgeInsetsDirectional.only(end: 20.0, top: 50.0),
                    child: Container(
                      height: 30.0,
                      width: 80.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'عربي',
                          style: TextStyle(color: DEFAULT_COLOR),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          //fixedSize: Size(70.0,0.0),
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(40.0),
                      topStart: Radius.circular(40.0)),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 150,start: 50,end: 50.0),
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
                          obscureText: true,
                          controller: passwordController,
                          hintText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password Is Required';
                            }
                          },
                        ),
                        SizedBox(height: 100,),
                        Row(
                          children: [
                            Expanded(
                              child: defaultButton(onPressed: (){}, text: 'Register'),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: defaultButton(onPressed: (){}, text: 'Login'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
