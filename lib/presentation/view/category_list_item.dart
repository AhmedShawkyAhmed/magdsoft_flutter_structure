import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../widget/horizonatl_space_widget.dart';

class CategoryListItem extends StatefulWidget {
  CategoryListItem({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);
  final Widget icon;
  final String name;
  bool isTaped = false;

  @override
  State<CategoryListItem> createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        widget.isTaped = !widget.isTaped;
      }),
      child: Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: Container(
          width: 30.w,
          height: 5.5.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.2.h, 0.2.h),
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10),
            ],
            color: widget.isTaped ? AppColor.blue : Colors.white,
            borderRadius: BorderRadius.circular(3.h),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 2.7.w),
            child: Row(
              children: [
                Container(
                  width: 9.3.w,
                  height: 4.2.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.h),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.2.h, 0.2.h),
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10),
                    ],
                  ),
                  child: ClipRRect(
                    child: widget.icon,
                    borderRadius: BorderRadius.circular(3.h),
                  ),
                ),
                HorizontalSpaceWidget(3.w),
                Expanded(
                  child: Text(
                    widget.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15.sp),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
