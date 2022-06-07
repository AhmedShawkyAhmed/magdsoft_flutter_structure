import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/curved_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNameController;
  late final TextEditingController _passwordNameController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNameController = TextEditingController();
    _passwordNameController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNameController.dispose();
    _passwordNameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mediumPersianBlue,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
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
                            children: [
                               CustomTextField(
                                hint: 'Full Name',
                                controller: _fullNameController,
                                keyboardType: TextInputType.name,
                                validator: (String? value){
                                  if(value == null || value.isEmpty){
                                    return 'Full name is required';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                               CustomTextField(
                                hint: 'Email',
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (String? value){
                                  if(value == null || value.isEmpty){
                                    return 'Email is required';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                               CustomTextField(
                                hint: 'Phone',
                                controller: _phoneNameController,
                                keyboardType: TextInputType.phone,
                                validator: (String? value){
                                  if(value == null || value.isEmpty){
                                    return 'Phone is required';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              CustomTextField(
                                hint: 'Password',
                                controller: _passwordNameController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (String? value){
                                  if(value == null || value.isEmpty){
                                    return 'Password is required';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              CustomTextField(
                                hint: 'Confirm Password',
                                controller: _confirmPasswordController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (String? value){
                                  if(value == null || value.isEmpty){
                                    return 'Confirm password is required';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      textButton: 'Register',
                                      onPressed: () {
                                        if(_formKey.currentState!.validate()){

                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 38,
                                  ),
                                  Expanded(
                                    child: CustomButton(
                                      textButton: 'Login',
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              )
                            ],
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
