import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/app_strings.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/curved_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text_field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:magdsoft_flutter_structure/utils/navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  late FToast ffToast;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    fToast.init(context);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final globalCubit = GlobalCubit.get(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: AppColor.mediumPersianBlue,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          width: double.infinity,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Image(
                              image: Svg(
                                'assets/images/flutter_logo.svg',
                                size: Size(160, 160),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CurvedContainer(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTextField(
                                    hint: 'Email',
                                    controller: _emailController,
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email is empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  CustomTextField(
                                    hint: 'Password',
                                    controller: _passwordController,
                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.remove_red_eye,
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'password is empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  const Spacer(),
                                  BlocConsumer<GlobalCubit, GlobalState>(
                                    listener: (context, state) {
                                      if (state is ErrorLoginState) {
                                        showToast(state.error);
                                      } else if (state is SuccessLoginState) {
                                        goToScreenAndFinish(
                                            context: context,
                                            routeName: AppStrings.home,
                                            arguments: state.getAccounts);
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is LoadingLoginState) {
                                        return const CircularProgressIndicator();
                                      }
                                      return Row(
                                        children: [
                                          Expanded(
                                            child: CustomButton(
                                              textButton: 'Register',
                                              onPressed: () {
                                                goToScreenAndFinish(
                                                  context: context,
                                                  routeName:
                                                      AppStrings.register,
                                                );
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 38,
                                          ),
                                          Expanded(
                                            child: CustomButton(
                                              textButton: 'Login',
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  final email =
                                                      _emailController.text;
                                                  final password =
                                                      _passwordController.text;
                                                  globalCubit
                                                      .loginWithEmailAndPassword(
                                                    email: email,
                                                    password: password,
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    PositionedDirectional(
                      end: 21,
                      top: 27,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.white,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'عربي',
                          style: TextStyle(
                            color: AppColor.mediumPersianBlue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
