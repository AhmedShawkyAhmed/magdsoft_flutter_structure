import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:magdsoft_flutter_structure/presentation/resources/strings_manager.dart';

import '../../business_logic/global_cubit/global_cubit.dart';
import '../styles/assets_manager.dart';
import '../styles/colors.dart';
import '../styles/values_manager.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key, this.showLanguageButton = false})
      : super(key: key);

  final bool showLanguageButton;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is GlobalLanguageChangedState) {
          Phoenix.rebirth(context);
        }
      },
      builder: (context, state) {
        GlobalCubit cubit = GlobalCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Stack(
            children: [
              const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Image(image: AssetImage(ImageAssets.appLogo))),
              showLanguageButton
                  ? Positioned(
                  top: 1,
                  right: 1,
                  child: ElevatedButton(
                    onPressed: () async {
                      await cubit.changeLanguagePressed();
                    },
                    child: Text(AppStrings.languageButton.tr(),
                        style: Theme.of(context).textTheme.labelSmall),
                    style: ElevatedButton.styleFrom(
                        primary: AppColor.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(AppSize.s12)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p28)),
                  ))
                  : const Center(),
            ],
          ),
        );
      },
    );
  }
}
