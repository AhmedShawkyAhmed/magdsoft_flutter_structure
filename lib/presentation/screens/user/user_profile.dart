import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/app_bar.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/app_button.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../widget/data_place_container.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late final User? user = User.fromJson(
      jsonDecode(CacheHelper.getDataFromSharedPreference(key: "user")));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            child: CustomAppBar(
              title: AppLocalizations.of(context)!.userData,
            ),
            preferredSize: const Size.fromHeight(kToolbarHeight)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity, height: 15.h),
            BlocBuilder<GlobalCubit, GlobalState>(
              builder: (context, state) {
                if (state is GlobalInitial) {
                  return DataPlaceContainer(
                    user: user,
                  );
                }
                if (state is GlobalAuthState) {
                  return DataPlaceContainer(
                    user: user,
                  );
                }
                return Text('No user',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.black));
              },
            ),
            SizedBox(height: 40.h),
            AppButton.logoutButton(
              onPressed: () {
                context.read<GlobalCubit>().logout();
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
              text: AppLocalizations.of(context)!.logout,
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
