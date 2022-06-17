import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/app_bar.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/app_button.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../data/models/account_model.dart';
import '../../widget/data_place_container.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);

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
                if (state is GlobalAuthState) {
                  return DataPlaceContainer(
                    user: state.user,
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
              onPressed: () {},
              text: AppLocalizations.of(context)!.logout,
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
