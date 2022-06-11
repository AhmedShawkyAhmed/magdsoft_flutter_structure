import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/contants.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/register_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/app_button.dart';

class AuthenticationLayout extends StatelessWidget {
  const AuthenticationLayout(
      {Key? key, required this.child, this.registerPressed, this.loginPressed})
      : super(key: key);
  final Widget child;
  final GestureTapCallback? loginPressed;
  final GestureTapCallback? registerPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: AppColor.primary,
        // resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(height: kHeight * 0.05),
            Stack(
              children: [
                Image.asset(
                  ImageAssets.flutterLogo,
                  width: kWidth,
                  height: kHeight * 0.25,
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: AppButton(
                    text: "English",
                    backgroundColor: AppColor.white,
                    textColor: AppColor.primary,
                    widthFactor: 0.25,
                    heightFactor: 0.05,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: kWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(child: child),
                    Visibility(
                      visible: MediaQuery.of(context).viewInsets.bottom == 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppButton(
                                text: "Register",
                                loading: state is RegisterLoadingState,
                                onPressed: registerPressed,
                              ),
                              AppButton(
                                text: "Login",
                                loading: state is LoginLoadingState,
                                onPressed: loginPressed,
                              ),
                            ],
                          ),
                          kSeparator(factor: 0.05),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
