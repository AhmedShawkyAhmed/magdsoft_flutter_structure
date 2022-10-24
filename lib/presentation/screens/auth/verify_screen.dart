import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/background_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/otp_form_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_filled_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/vertical_space_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/auth_cubit/auth_cubit.dart';
import '../../../constants/routers.dart';
import '../../widget/loading_widget.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({Key? key}) : super(key: key);

  final List<String> list = [];

  @override
  Widget build(BuildContext context) {
    print(
        '======================= Build Verify Screen ============================');

    return BackgroundView(
        child: Column(
      children: [
        Text(
          'Verify Phone',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        VerticalSpaceWidget(14.8.h),
        OtpForm(
          code: list,
        ),
        VerticalSpaceWidget(9.6.h),
        Text(
          'Resend Code',
          style: TextStyle(color: AppColor.blue, fontSize: 12.5.sp),
        ),
        VerticalSpaceWidget(8.3.h),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is VerifySuccess) {
              showToast(state.message, context);
              Navigator.pushNamed(context, helpScreen);
            } else if (state is VerifyFailed) {
              showToast(state.message, context);
            }
          },
          builder: (context, state) {
            if (state is VerifyLoading) {
              return const LoadingWidget();
            }
            return CustomFilledButton(
              withShadow: false,
              radius: 5.h,
              onTap: () {
                verify(context);
              },
              label: 'Verify',
              width: 79.7.w,
              height: 6.11.h,
            );
          },
        )
      ],
    ));
  }

  verify(BuildContext context) {
    FocusScope.of(context).unfocus();
    final String code = list.join();
    AuthCubit.get(context).verify(code);
    list.clear();
  }
}
