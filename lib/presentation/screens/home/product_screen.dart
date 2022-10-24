import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/background_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_action_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_filled_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_shadow_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/horizonatl_space_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/vertical_space_widget.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel productModel;
  const ProductScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Arrow Back
          CustomActionButton(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              color: AppColor.grey,
            ),
          ),
          VerticalSpaceWidget(2.3.h),
          // Product Name and Type
          productheadTitle(
              title: productModel.name, subTitle: productModel.type),
          VerticalSpaceWidget(1.7.h),
          // scroll view
          SizedBox(
            height: 70.h,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 1.2.h),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  productImage(),
                  VerticalSpaceWidget(3.1.h),
                  productAllImages(),
                  VerticalSpaceWidget(3.1.h),
                  storeButton(),
                  VerticalSpaceWidget(3.6.h),
                  productPrice(),
                  VerticalSpaceWidget(4.h),
                  divider(),
                  VerticalSpaceWidget(3.2.h),
                  productDetails()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Divider divider() {
    return Divider(
      thickness: 1,
      endIndent: 13.w,
      indent: 13.w,
      color: AppColor.grey,
    );
  }

  Widget productImage() {
    return CustomShadowContainer(
      width: 84.6.w,
      height: 32.h,
      radius: 2.h,
      child: Image.network(productModel.image),
    );
  }

  Widget productDetails() {
    return SizedBox(
      height: 64.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //the head of Tab bar and clickable
          SizedBox(
            height: 5.3.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HeaderTapBar(
                  title: 'Overview',
                ),
                HeaderTapBar(
                  title: 'Sepsification',
                ),
                HeaderTapBar(
                  title: 'Review',
                ),
              ],
            ),
          ),
          // product description
          SizedBox(
            height: 54.h,
            child: Text(
              productModel.description,
              style:
                  TextStyle(fontSize: 12.5.sp, color: AppColor.fontPlaceholder),
            ),
          ),
        ],
      ),
    );
  }

  Widget productPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // product price
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: TextStyle(
                color: AppColor.fontPlaceholder,
                fontSize: 12.5.sp,
              ),
            ),
            Text(
              productModel.price + ' EGP',
              style: TextStyle(
                color: AppColor.fontblack,
                fontSize: 13.8.sp,
              ),
            )
          ],
        ),
        // add to cart button
        CustomFilledButton(
          height: 4.7.h,
          width: 48.3.w,
          onTap: () {},
          label: 'Add To Cart',
          radius: 1.h,
          withShadow: true,
        )
      ],
    );
  }

  Widget storeButton() {
    return Center(
      // the big container
      child: CustomShadowContainer(
        width: 84.6.w,
        height: 7.h,
        radius: 1.h,
        child: Padding(
          padding: EdgeInsets.all(0.7.h),
          child: Row(
            children: [
              // logo widget
              CustomShadowContainer(
                width: 12.7.w,
                height: 5.9.h,
                radius: 1.h,
                child: Image.asset('assets/images/acer.png'),
              ),
              HorizontalSpaceWidget(2.3.w),
              // comapny name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Acer Official Store',
                    style:
                        TextStyle(color: AppColor.fontblack, fontSize: 13.sp),
                  ),
                  Text(
                    'View Store',
                    style: TextStyle(
                        color: AppColor.fontPlaceholder, fontSize: 9.sp),
                  ),
                ],
              ),
              const Spacer(),
              // button
              CustomActionButton(
                child: const Icon(Icons.arrow_right_sharp),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productAllImages() {
    return SizedBox(
      width: double.infinity,
      height: 10.7.h,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 6.w),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 3.2.w),
          child: CustomShadowContainer(
            width: 23.2.w,
            height: 10.7.h,
            radius: 2.h,
            child: Image.network(productModel.image),
          ),
        ),
      ),
    );
  }

  Widget productheadTitle({required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: AppColor.white,
              fontSize: 19.sp,
              fontWeight: FontWeight.w700),
        ),
        Text(
          'Type: ' + subTitle,
          style: TextStyle(
              color: AppColor.white,
              fontSize: 11.5.sp,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

class HeaderTapBar extends StatefulWidget {
  final String title;

  bool isTaped = false;

  HeaderTapBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HeaderTapBar> createState() => _HeaderTapBarState();
}

class _HeaderTapBarState extends State<HeaderTapBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        // if isTaped false make it true or reverse
        widget.isTaped = !widget.isTaped;
      }),
      child: Column(
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 18,
                color: widget.isTaped
                    ? AppColor.fontblack
                    : AppColor.fontPlaceholder),
          ),
          // to visible notch when taped
          widget.isTaped
              ? CircleAvatar(
                  radius: 8,
                  backgroundColor: AppColor.blue.withOpacity(0.7),
                )
              : Container()
        ],
      ),
    );
  }
}
