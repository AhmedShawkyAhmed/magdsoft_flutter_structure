import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/extensions.dart';

import '../../../data/models/user_data_model.dart';
import '../../resources/strings_manager.dart';
import '../../router/app_router.dart';
import '../../styles/colors.dart';
import '../../styles/values_manager.dart';
import '../../widget/custom_button.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (_, state) {
        if (state is GlobalUserLoggedOutState) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
        }
      },
      builder: (context, state) {
        GlobalCubit cubit = GlobalCubit.get(context);
        return Scaffold(
          appBar: AppBar(title: Text(AppStrings.userData.tr())),
          body: _getContent(context, cubit),
        );
      },
    );
  }

  Widget _getContent(BuildContext context, GlobalCubit cubit) {
    UserData userData = cubit.getUserData();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Expanded(
            flex: 3,
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.displayLarge,
                children: [
                  TextSpan(
                      text:
                          '${AppStrings.name.tr()} : ${userData.name.orEmpty()}\n'),
                  TextSpan(
                      text:
                          '${AppStrings.email.tr()} : ${userData.email.orEmpty()}\n'),
                  TextSpan(
                      text:
                          '${AppStrings.phone.tr()} : ${userData.phone.orEmpty()}'),
                ],
              ),
            ),
          ),
          const Spacer(flex: 4),
          CustomButton(
            title: AppStrings.logout.tr(),
            onPressed: () {
              cubit.logOut();
            },
            color: AppColor.accentColor,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
