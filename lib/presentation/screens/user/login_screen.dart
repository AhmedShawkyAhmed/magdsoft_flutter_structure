import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/validators.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/login_layout.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/textformfield.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  bool isValid = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showToast(msg: "Login Error", state: ToastStates.eRROR);
        }
        if (state is LoginSuccessState) {
          showToast(msg: "Login Successfully", state: ToastStates.sUCCESS);
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.profile, (route) => false);
        }
      },
      builder: (context, state) => AuthenticationLayout(
          loginPressed: () {
            if (formKey.currentState!.validate()) {
              GlobalCubit.get(context).userLogin(
                  email: emailController.text,
                  password: passwordController.text);
            }
          },
          registerPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.register,
                ((route) => false),
              ),
          child: Center(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppFormField(
                      hint: "Email",
                      type: TextInputType.name,
                      controller: emailController,
                      validate: emailValidator,
                    ),
                    const SizedBox(height: 20),
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
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
