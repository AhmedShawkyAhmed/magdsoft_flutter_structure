import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/style_classes.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:sizer/sizer.dart';

import '../../components/input_field.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String? phoneNumber;
  // ignore: non_constant_identifier_names
  RegisterScreen({this.phoneNumber});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // with AccountDelegate
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? email, password = '';
  String message = '';
  bool messageInfo = false;
  bool messageError = false;

  FocusNode myFocusNodeEmail = FocusNode();
  FocusNode myFocusNodePassword = FocusNode();
  // Account account = Account();

  // AnimationController? myAnimationController1;
  // Animation? myAnimation1;
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // myAnimationController1!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.backgoundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: double.infinity,
                      color: AppColors.primaryColor,
                      height: 30.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/logo.png',
                            // width: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 250, 0, 0),
                    decoration: const BoxDecoration(
                      color: AppColors.backgoundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    ///// start form here choose langauge
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: <Widget>[
                        Visibility(
                          visible: messageInfo,
                          child: showToast('Error'),
                        ),
                        //button fields
                        //1
                        Container(
                          child: buildInputTF(
                            isEdit: widget.phoneNumber == null ? false : true,
                            isEditFunc: () {
                              Navigator.pop(context);
                            },
                            initialValue: widget.phoneNumber,
                            myFocusNode: myFocusNodeEmail,
                            onChange: (value) {
                              setState(() {
                                email = value.toString();
                              });
                              print('Email value$email');
                            },
                            title: translate('auth.login.email'),
                            onTap: () {
                              setState(() {
                                FocusScope.of(context)
                                    .requestFocus(myFocusNodeEmail);
                              });
                            },
                            icon: null,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                        ),
                        //2
                        Container(
                          child: buildInputTF(
                            isEdit: widget.phoneNumber == null ? false : true,
                            isEditFunc: () {
                              Navigator.pop(context);
                            },
                            initialValue: widget.phoneNumber,
                            myFocusNode: myFocusNodeEmail,
                            onChange: (value) {
                              setState(() {
                                email = value.toString();
                              });
                              print('Email value$email');
                            },
                            title: translate('auth.login.email'),
                            onTap: () {
                              setState(() {
                                FocusScope.of(context)
                                    .requestFocus(myFocusNodeEmail);
                              });
                            },
                            icon: null,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                        ),
                        //3
                        Container(
                          child: buildInputTF(
                            isEdit: widget.phoneNumber == null ? false : true,
                            isEditFunc: () {
                              Navigator.pop(context);
                            },
                            initialValue: widget.phoneNumber,
                            myFocusNode: myFocusNodeEmail,
                            onChange: (value) {
                              setState(() {
                                email = value.toString();
                              });
                              print('Email value$email');
                            },
                            title: translate('auth.login.email'),
                            onTap: () {
                              setState(() {
                                FocusScope.of(context)
                                    .requestFocus(myFocusNodeEmail);
                              });
                            },
                            icon: null,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                        ),
                        //4
                        Container(
                          child: buildInputTF(
                            isEdit: widget.phoneNumber == null ? false : true,
                            isEditFunc: () {
                              Navigator.pop(context);
                            },
                            initialValue: widget.phoneNumber,
                            myFocusNode: myFocusNodeEmail,
                            onChange: (value) {
                              setState(() {
                                email = value.toString();
                              });
                              print('Email value$email');
                            },
                            title: translate('auth.login.email'),
                            onTap: () {
                              setState(() {
                                FocusScope.of(context)
                                    .requestFocus(myFocusNodeEmail);
                              });
                            },
                            icon: null,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                        ),
                        // password
                        Container(
                          child: buildInputPasswordTF(
                            onChange: (value) {
                              setState(() {
                                password = value.toString();
                              });
                              print('_password value$password');
                            },
                            myFocusNode: myFocusNodePassword,
                            title: translate('auth.login.Password'),
                            onTap: () {
                              setState(() {
                                FocusScope.of(context)
                                    .requestFocus(myFocusNodePassword);
                              });
                            },
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 3.w),
                        ),

                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 6.5.h,
                              child: PrimaryButton(
                                title: 'button.logIn',
                                color: (email == '' || password == '')
                                    ? AppColors.primaryColor
                                    : AppColors.primaryColor,
                                onTap: () {
                                  if (email == '' || password == '') {
                                    showToast('enter is valid');
                                  } else {
                                    setState(() {
                                      //here actions
                                    });
                                    print('$email, _password , $password');
                                  }
                                },
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                            ),
                            Container(
                              height: 6.5.h,
                              child: PrimaryButton(
                                title: 'button.register',
                                color: (email == '' || password == '')
                                    ? AppColors.primaryColor
                                    : AppColors.primaryColor,
                                onTap: () {
                                  //TODO
                                  //action
                                },
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                            ),
                          ],
                        ),
                        // Visibility(
                        //   visible: showSpinner,
                        //   child:  LoaderButton(),
                        // ),

                        // const SizedBox(
                        //   height: 20,
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
