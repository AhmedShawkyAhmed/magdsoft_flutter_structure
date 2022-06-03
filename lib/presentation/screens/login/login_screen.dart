import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../business_logic/login_cubit/login_cubit.dart';
import '../../../business_logic/login_cubit/login_states.dart';
import '../../router/app_router.dart';
import '../../resources/strings_manager.dart';
import '../../styles/colors.dart';
import '../../styles/styles_manager.dart';
import '../../styles/values_manager.dart';
import '../../view/login_header.dart';
import '../../view/login_register_row.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/snackbar_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: ((context) => GlobalCubit())),
      ],
      child: BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
        if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
            message: state.message,
            state: SnackBarStates.ERROR,
          ));
        } else if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
              message: AppStrings.success.tr(), state: SnackBarStates.SUCCESS));
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.userProfileRoute, (route) => false);
        }
      }, builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Scaffold(
          backgroundColor: AppColor.primary,
          body: _getContent(context, cubit),
        );
      }),
    );
  }

  Widget _getContent(BuildContext context, LoginCubit cubit) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: AppPadding.p8),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: LoginHeader(showLanguageButton: true),
                    ),
                    Expanded(
                      flex: 5,
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(AppPadding.p16),
                            decoration: getContainerDefDecoration(),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  const Spacer(flex: 2),
                                  Column(
                                    children: [
                                      CustomTextField(
                                        hint: AppStrings.email.tr(),
                                        onChanged: (email) {
                                          cubit.setEmail(email);
                                        },
                                        type: TextInputType.emailAddress,
                                      ),
                                      CustomTextField(
                                        hint: AppStrings.password.tr(),
                                        isPassword: true,
                                        onChanged: (password) {
                                          cubit.setPassword(password);
                                        },
                                      ),
                                    ],
                                  ),
                                  const Spacer(flex: 2),
                                  LoginRegisterRow(onLogin: () {
                                    _validateLogin(cubit);
                                  }, onRegister: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        Routes.registerRoute);
                                  }),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                          cubit.state is LoginButtonPressedState
                              ? const Positioned(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _validateLogin(LoginCubit cubit) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      cubit.login();
    }
  }
}
