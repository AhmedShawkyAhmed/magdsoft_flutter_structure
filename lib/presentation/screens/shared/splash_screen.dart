import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/values_manager.dart';

import '../../../business_logic/splash_cubit/splash_cubit.dart';
import '../../../business_logic/splash_cubit/splash_states.dart';
import '../../router/app_router.dart';
import '../../styles/assets_manager.dart';
import '../../styles/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..startTimer(),
      child: BlocConsumer<SplashCubit, SplashStates>(
        listener: (context, state) {
          if (state is LoadedSplashStates) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: _getContent(context),
          );
        },
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Container(
      color: AppColor.primary,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: CircleAvatar(
          backgroundColor: AppColor.white,
          backgroundImage: const AssetImage(ImageAssets.logo),
          radius: AppSize.s120,
        ),
      ),
    );
  }
}
