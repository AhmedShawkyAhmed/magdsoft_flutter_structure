import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/routers.dart';
import 'package:magdsoft_flutter_structure/presentation/view/background_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_filled_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/vertical_space_widget.dart';
import 'package:sizer/sizer.dart';
import '../../view/expansion_panel.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundView(
        child: Column(
      children: [
        Text(
          'Help',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        VerticalSpaceWidget(7.h),
        const ExpansionPanelView(),
        CustomFilledButton(
          height: 5.5.h,
          width: 65.w,
          radius: 5.h,
          withShadow: false,
          onTap: () => Navigator.pushNamed(context, homeScreen),
          label: 'Continue',
        ),
      ],
    ));
  }
}
