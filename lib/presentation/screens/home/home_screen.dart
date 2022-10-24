import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../../business_logic/bottom_bar_navigator/bottom_bar_navigator_cubit.dart';
import '../../widget/bottom_appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarNavigatorCubit, BottomBarNabigatorState>(
      builder: (context, state) {
        return Scaffold(
          // To set the floating action button in bottom when keyboard open
          resizeToAvoidBottomInset: false,
          /////////////////////////////////////////////////////////////////
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                context.read<BottomBarNavigatorCubit>().navigateToScreen(2),
            child: const Icon(Icons.home),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // go to screens list in BottomBarNabigatorState --> start from HomeView class
          body: state.screens[state.index],

          bottomNavigationBar: const TabBarMaterialWidget(),
        );
      },
    );
  }
}
