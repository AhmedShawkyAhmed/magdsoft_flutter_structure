import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft_flutter_structure/data/models/user_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/style_classes.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late UserModel user;
  @override
  void initState() {
    super.initState();
    GlobalCubit.get(context).users;
  }

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(translate('app_bar.title')),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                translate('user_data.form.name'),
              ),
              Text(': Ahmed'),
            ],
          ),
          Row(
            children: [
              Text(
                translate('user_data.form.email'),
              ),
              Text(': ahmed@gmail.com'),
            ],
          ),
          Row(
            children: [
              Text(
                translate('user_data.form.phone'),
              ),
              Text(': 01152226320'),
            ],
          ),
          const Spacer(),
          PrimaryButton(
            title: translate('button.logOut'),
            color: AppColors.logOutButtonColor,
            titleColor: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }
}
