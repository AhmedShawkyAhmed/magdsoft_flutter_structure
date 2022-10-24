import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/view/category_list_item.dart';
import 'package:sizer/sizer.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 5.5.h,
      child: ListView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          CategoryListItem(
              icon: Image.asset('assets/images/cup.png'), name: 'All'),
          CategoryListItem(
              icon: Image.asset('assets/images/acer_logo.png'), name: 'Acer'),
          CategoryListItem(
              icon: Image.asset('assets/images/razer.png'), name: 'Razer')
        ],
      ),
    );
  }
}
