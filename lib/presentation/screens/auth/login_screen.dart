import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/routers.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_Icon_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/horizonatl_space_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/login_card_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/vertical_space_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/auth_cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    print(
        '======================= Build Login Screen ============================');
    return Scaffold(
        body: Stack(children: [
      pictureBackGroundWidget(),
      bottomBackgroundWidget(),
      BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginFailed) {
            showToast(state.message, context);
          } else if (state is LoginSuccess) {
            Navigator.pushNamed(context, verifyScreen,
                arguments: AuthCubit.get(context));
            showToast(state.message, context);
          }
        },
        builder: (context, state) {
          return const LoginCardWidget();
        },
      ),
    ]));
  }

  Widget pictureBackGroundWidget() {
    return SizedBox(
      width: double.infinity,
      height: 41.4.h,
      child: Image.asset(
        'assets/images/welcome.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget bottomBackgroundWidget() {
    return Transform.translate(
      offset: Offset(0, 33.9.h),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.h),
            topRight: Radius.circular(5.h),
          ),
        ),
        child: Column(
          children: [
            VerticalSpaceWidget(38.3.h),
            dividerWidgetWithText(),
            VerticalSpaceWidget(10.h),
            iconsBarWidget()
          ],
        ),
      ),
    );
  }

  Widget dividerWidgetWithText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 38.3.w,
          height: 0.10.h,
          decoration: BoxDecoration(
            color: AppColor.blue.withOpacity(0.61),
          ),
        ),
        HorizontalSpaceWidget(2.3.w),
        Text(
          'OR',
          style: TextStyle(
            color: AppColor.blue.withOpacity(0.61),
            fontSize: 15,
          ),
        ),
        HorizontalSpaceWidget(2.3.w),
        Container(
          width: 38.3.w,
          height: 0.10.h,
          decoration: BoxDecoration(
            color: AppColor.blue.withOpacity(0.61),
          ),
        ),
      ],
    );
  }

  Widget iconsBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomIconButton(
          imagePath: 'assets/images/facebook.png',
        ),
        HorizontalSpaceWidget(6.5.w),
        const CustomIconButton(
          imagePath: 'assets/images/apple.png',
        ),
        HorizontalSpaceWidget(6.5.w),
        const CustomIconButton(
          imagePath: 'assets/images/google.png',
        ),
      ],
    );
  }
}
