import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/theme.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_filled_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text_form_field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/loading_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/vertical_space_widget.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/auth_cubit/auth_cubit.dart';
import '../styles/colors.dart';

class LoginCardWidget extends StatefulWidget {
  const LoginCardWidget({Key? key}) : super(key: key);

  @override
  State<LoginCardWidget> createState() => _LoginCardWidgetState();
}

class _LoginCardWidgetState extends State<LoginCardWidget> {
  final _key = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Positioned(
        top: 20.7.h,
        left: 6.7.w,
        right: 6.7.w,
        child: Container(
          padding: EdgeInsets.only(
            top: 2.99.h,
            left: 10.69.w,
            right: 10.23.w,
          ),
          width: 86.w,
          height: 39.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.h),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 20,
                offset: Offset(0.4.w, 0.5.h),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              VerticalSpaceWidget(1.9.h),
              Container(
                height: 0.33.h,
                width: 33.2.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.h),
                  color: AppColor.blue,
                ),
              ),
              VerticalSpaceWidget(4.59.h),
              CustomTextFormField(
                width: 65.5.w,
                height: 5.15.h,
                hintText: 'Enter Your Full Name',
                inputType: TextInputType.name,
                controller: name,
                onSaved: (value) => name.text = value,
              ),
              VerticalSpaceWidget(1.8.h),
              CustomTextFormField(
                width: 65.5.w,
                height: 5.15.h,
                hintText: 'Enter Your Phone Number',
                inputType: TextInputType.phone,
                controller: phone,
                onSaved: (value) => phone.text = value,
              ),
              VerticalSpaceWidget(4.6.h),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const LoadingWidget();
                  }
                  return CustomFilledButton(
                    width: 65.5.w,
                    height: 5.15.h,
                    radius: 5.h,
                    withShadow: false,
                    onTap: () {
                      _key.currentState!.save();
                      FocusScope.of(context).unfocus();
                      AuthCubit.get(context).login(name.text, phone.text);
                    },
                    label: 'Login',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
