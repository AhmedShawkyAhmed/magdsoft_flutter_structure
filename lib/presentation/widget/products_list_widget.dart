import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_flutter_structure/constants/routers.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/loading_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/vertical_space_widget.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/products_cubit/products_cubit.dart';
import 'favorite_button.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.4.h),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return state is ProductsLoaded
              ? MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 9.h),
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.7.h,
                  crossAxisSpacing: 9.w,
                  itemCount: state.products.length + 1,
                  itemBuilder: (context, index) => index == 0
                      ? SizedBox(
                          width: 44.w,
                          height: 8.5.h,
                          child: Text(
                            'Recomended for You',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20.sp), // 30
                          ))
                      : productGridCardItem(
                          context,
                          productModel: state.products[index - 1],
                        ),
                )
              : const LoadingWidget();
        },
      ),
    );
  }

  Widget productGridCardItem(BuildContext context,
      {required ProductModel productModel}) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, productScreen, arguments: productModel),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 39.h,
          height: 25.6.h,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: Offset(0.2.h, 0.2.h),
                color: Colors.black.withOpacity(0.5),
                blurRadius: 1.h),
          ], color: Colors.white, borderRadius: BorderRadius.circular(2.h)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProductImage(productModel),
              VerticalSpaceWidget(0.5.h),
              buildProductInfo(productModel),
              const Spacer(),
              buildProductPrice(productModel),
            ],
          ),
        ),
      ),
    );
  }

  Row buildProductPrice(ProductModel productModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Text(
            productModel.price + ' EGP',
            style: TextStyle(
              fontSize: 9.sp,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          width: 9.w,
          height: 4.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2.h),
              bottomRight: Radius.circular(2.h),
            ),
            gradient: LinearGradient(
              colors: [
                AppColor.blue,
                AppColor.blue.withOpacity(0.5),
              ],
            ),
          ),
          child: const Icon(
            Icons.add,
            color: AppColor.white,
          ),
        ),
      ],
    );
  }

  Widget buildProductImage(ProductModel productModel) {
    return Container(
      width: 39.w,
      height: 15.2.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0.2.h, 0.2.h),
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.h),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Center(
            child: Image.network(
              productModel.image,
              width: 33.w,
              height: 12.h,
            ),
          ),
          FavoriteButton(),
        ],
      ),
    );
  }

  Widget buildProductInfo(ProductModel productModel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productModel.company,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColor.blue,
            ),
          ),
          Text(
            productModel.name,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
