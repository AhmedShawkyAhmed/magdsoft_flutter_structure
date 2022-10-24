import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/background_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text_form_field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/products_list_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/vertical_space_widget.dart';
import 'package:sizer/sizer.dart';
import '../widget/card_slid_widget.dart';
import '../widget/category_list_widget.dart';
import '../widget/custom_action_button.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(
        '======================= Build Home View ============================');

    return BackgroundView(
      child: Column(
        children: [
          appBarWidget(),
          VerticalSpaceWidget(2.3.h),
          CardSlidWidget(
            image: Image.asset('assets/images/baner.png'),
            title: 'New Release',
            subTitle: 'Acer Predator Helios 300',
          ),
          VerticalSpaceWidget(1.5.h),
          const CategoryListWidget(),
          const Expanded(
            child: ProductListWidget(),
          ),
        ],
      ),
    );
  }

  Row appBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextFormField(
            width: 75.3.w,
            height: 5.3.h,
            icon: const Icon(
              Icons.search,
              color: AppColor.grey,
            ),
            hintText: 'Search',
            hintSize: 13.sp,
            controller: controller,
            shadowColor: Colors.black.withOpacity(0.5),
            shadowOffset: Offset(0.2.h, 0.2.h),
            inputType: TextInputType.text,
            onSaved: (s) {}),
        CustomActionButton(
          child: Image.asset(
            'assets/images/filter.png',
            width: 3.7.w,
            color: AppColor.grey,
          ),
        ),
      ],
    );
  }
}
