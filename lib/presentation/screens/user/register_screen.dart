import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/contants.dart';
import 'package:magdsoft_flutter_structure/constants/validators.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/login_layout.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/textformfield.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  bool isValid = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          showToast(
              msg: state.registerModel.message!, state: ToastStates.eRROR);
        }
        if (state is LoginSuccessState) {
          showToast(msg: "Login Successfully", state: ToastStates.sUCCESS);
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.profile, (route) => false);
        }
      },
      builder: (context, state) => AuthenticationLayout(
          registerPressed: () {
            if (formKey.currentState!.validate()) {
              GlobalCubit.get(context).userRegister(
                name: nameController.text,
                phone: phoneController.text,
                email: emailController.text,
                password: passwordController.text,
              );
            }
          },
          loginPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.login,
                ((route) => false),
              ),
          child: Center(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    kSeparator(),
                    AppFormField(
                      hint: "Full Name",
                      type: TextInputType.name,
                      controller: nameController,
                      validate: nameValidator,
                    ),
                    kSeparator(),
                    AppFormField(
                      hint: "Email",
                      type: TextInputType.name,
                      controller: emailController,
                      validate: emailValidator,
                    ),
                    kSeparator(),
                    AppFormField(
                      hint: "Phone",
                      type: TextInputType.name,
                      controller: phoneController,
                      validate: phoneValidator,
                    ),
                    kSeparator(),
                    AppFormField(
                      hint: "Password",
                      type: TextInputType.visiblePassword,
                      controller: passwordController,
                      isPassword: GlobalCubit.get(context).isPassword,
                      suffixIcon: GlobalCubit.get(context).passwordSuffix,
                      onSuffixPressed: () =>
                          GlobalCubit.get(context).changePasswordVisibility(),
                      validate: passwordValidator,
                    ),
                    kSeparator(),
                    AppFormField(
                      hint: "Confirm Password",
                      type: TextInputType.visiblePassword,
                      controller: confirmPasswordController,
                      isPassword: GlobalCubit.get(context).isConfirmNewPassword,
                      suffixIcon:
                          GlobalCubit.get(context).confirmPasswordSuffix,
                      onSuffixPressed: () => GlobalCubit.get(context)
                          .changeConfirmNewPasswordVisibility(),
                      validate: (String? value) {
                        return confirmPasswordController.text.isEmpty ||
                                passwordController.text !=
                                    confirmPasswordController.text
                            ? 'Passwords not matched.'
                            : null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
