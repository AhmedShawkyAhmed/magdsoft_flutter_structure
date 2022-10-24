import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/bottom_bar_navigator/bottom_bar_navigator_cubit.dart';

class TabBarMaterialWidget extends StatelessWidget {
  const TabBarMaterialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const placeholder = Opacity(
      opacity: 0,
      child: IconButton(
        onPressed: null,
        icon: Icon(Icons.no_cell),
      ),
    );
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 0.3.h,
      child: BlocBuilder<BottomBarNavigatorCubit, BottomBarNabigatorState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTabItem(
                  toolTip: 'Menu',
                  icon: Image.asset(
                    'assets/images/exit.png',
                    width: 20,
                    color: state.index == 0 ? AppColor.blue : AppColor.grey,
                  ),
                  index: 0,
                  onPressed: () =>
                      BlocProvider.of<BottomBarNavigatorCubit>(context)
                          .navigateToScreen(0)),
              _buildTabItem(
                toolTip: 'Offers',
                icon: Image.asset(
                  'assets/images/heart.png',
                  width: 20,
                  color: state.index == 1 ? AppColor.blue : AppColor.grey,
                ),
                index: 1,
                onPressed: () =>
                    BlocProvider.of<BottomBarNavigatorCubit>(context)
                        .navigateToScreen(1),
              ),
              placeholder,
              _buildTabItem(
                toolTip: 'Profile',
                icon: Image.asset('assets/images/notification.png',
                    width: 20,
                    color: state.index == 3 ? AppColor.blue : AppColor.grey),
                index: 3,
                onPressed: () =>
                    BlocProvider.of<BottomBarNavigatorCubit>(context)
                        .navigateToScreen(3),
              ),
              _buildTabItem(
                toolTip: 'Settings',
                icon: Image.asset('assets/images/settings.png',
                    width: 20,
                    color: state.index == 4 ? AppColor.blue : AppColor.grey),
                index: 4,
                onPressed: () =>
                    BlocProvider.of<BottomBarNavigatorCubit>(context)
                        .navigateToScreen(4),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabItem(
      {required Widget icon,
      required int index,
      required String toolTip,
      required VoidCallback onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      tooltip: toolTip,
    );
  }
}
