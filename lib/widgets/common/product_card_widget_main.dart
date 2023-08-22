import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/routes/routes.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
// import '../../models/home/deals.dart';
import '../../painter/offer_painted_widget.dart';

class ProductCardWidgetMain extends StatelessWidget {
  const ProductCardWidgetMain({
    required this.product,
    super.key,
    // required this.productList,
  });

  // final List<Deals> productList;

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(productDetailsScreen);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Colors.pink.withOpacity(0.5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 2.h,
                )
              ],
            ),
            padding: EdgeInsets.all(15.h),
            width: 175.w,
            height: 300.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      height: 160.h,
                      child: Image.asset(product.imgUrl),
                    ),
                    Text(
                      product.title,
                      style: kTextStyleSemiBold.copyWith(
                          fontSize: 16.sp, color: kColorBlack2),
                    ),
                    Text(
                      '${product.weight}g',
                      style: kTextStyleMedium.copyWith(
                          fontSize: 14.sp, color: kColorBlack2withOpacity75),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EGP ${product.originalPrice}",
                          style: kTextStyleRegular.copyWith(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: const Color(0xFF646464),
                            fontSize: 12.sp,
                            color: const Color(0xFF646464),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'EGP ',
                            style: kTextStyleMedium.copyWith(
                                color: kColorBlack2, fontSize: 14.sp),
                            children: <TextSpan>[
                              TextSpan(
                                text: product.discountedPrice,
                                style: kTextStyleSemiBold.copyWith(
                                    color: kColorBlack2, fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40.h,
                      height: 40.h,
                      child: Image.asset(
                          'assets/images/home/add_to_cart_icon.png'),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                  width: 50.w,
                  height: 20.h,
                  child: CustomPaint(
                    painter:
                        VCutRectanglePainter(color: const Color(0xFF79A400)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Text(
                    '${product.offPercentage}%Off',
                    style: kTextStyleMedium.copyWith(
                        color: kColorWhite, fontSize: 10.sp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
