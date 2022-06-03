import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/register_cubit/register_cubit.dart';
import '../../../business_logic/register_cubit/register_states.dart';
import '../../resources/strings_manager.dart';
import '../../router/app_router.dart';
import '../../styles/colors.dart';
import '../../styles/styles_manager.dart';
import '../../styles/values_manager.dart';
import '../../view/login_header.dart';
import '../../view/login_register_row.dart';
import '../../widget/centr_porogress.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/snackbar_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
              message: state.message,
              state: SnackBarStates.ERROR,
            ));
          } else if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                message: AppStrings.success.tr(),
                state: SnackBarStates.SUCCESS));
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.userProfileRoute, (route) => false);
          }
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
              backgroundColor: AppColor.primary,
              body: _getContent(context, cubit));
        },
      ),
    );
  }

  Widget _getContent(BuildContext context, RegisterCubit cubit) {
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
                      child: LoginHeader(),
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
                                  const Spacer(),
                                  Column(
                                    children: [
                                      CustomTextField(
                                        hint: AppStrings.fullName.tr(),
                                        onChanged: (name) {
                                          cubit.setName(name);
                                        },
                                      ),
                                      CustomTextField(
                                        hint: AppStrings.email.tr(),
                                        onChanged: (email) {
                                          cubit.setEmail(email);
                                        },
                                        type: TextInputType.emailAddress,
                                      ),
                                      CustomTextField(
                                        hint: AppStrings.phone.tr(),
                                        onChanged: (phone) {
                                          cubit.setPhone(phone);
                                        },
                                        type: TextInputType.phone,
                                      ),
                                      CustomTextField(
                                        hint: AppStrings.password.tr(),
                                        onChanged: (password) {
                                          cubit.setPassword(password);
                                        },
                                        isPassword: true,
                                      )
                                    ],
                                  ),
                                  const Spacer(flex: 2),
                                  LoginRegisterRow(onLogin: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        Routes.loginRoute);
                                  }, onRegister: () {
                                    _validateRegister(cubit);
                                  }),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                          cubit.state is RegisterButtonPressedState
                              ? const CenterProgress()
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

  _validateRegister(RegisterCubit cubit) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      cubit.register();
    }
  }
}
