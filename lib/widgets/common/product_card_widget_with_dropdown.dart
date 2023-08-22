import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
import '../../models/product/product_model.dart';
import '../../painter/offer_painted_widget.dart';
import '../../views/product_details/product_details_screen.dart';
// import 'custom_bottom_button_with_icon_solid_color.dart';

class ProductCardWidgetWithDropdown extends StatelessWidget {
  const ProductCardWidgetWithDropdown({
    super.key,
    // required this.screenHeight,
    // required this.screenWidth,
    this.product = const ProductModel(),
    // required this.productList,
  });

  // final double screenHeight;
  // final double screenWidth;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            // color: Colors.pink.withOpacity(0.5),
            color: kColorWhite,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                color: Colors.black.withOpacity(0.04),
                blurRadius: 2,
              )
            ],
          ),
          padding: EdgeInsets.all(8.h),
          // width: screenWidth * 0.46,
          // height: screenHeight * 0.375,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image and title
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProductDetailsScreen();
                      }));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          height: 103.h,
                          child: Image.asset(product.imgUrl),
                          // child: Text(product.imgUrl),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          product.title,
                          // 'title',
                          style: kTextStyleMedium.copyWith(
                            fontSize: 14.sp,
                            color: kColorBlack2,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Product Dropdown pressed');
                      _openProductWeightBottomSheet(context);
                    },
                    child: Container(
                      color: kColorTransparent,
                      height: 20.h,
                      child: Row(
                        children: [
                          Text(
                            '${product.weight}',
                            // 'weight',
                            style: kTextStyleRegular.copyWith(
                              fontSize: 10.sp,
                              color: kColorBlack2withOpacity75,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2.h),
                            height: 12.w,
                            width: 12.w,
                            child: Image.asset(
                              'assets/images/sub_categories/down_arrow.png',
                            ),
                          ),
                        ],
                      ),
                    ),
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
                        // product.originalPrice,
                        style: kTextStyleRegular.copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: const Color(0xFF646464),
                          fontSize: 10.sp,
                          color: const Color(0xFF646464),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'EGP ',
                          style: kTextStyleMedium.copyWith(
                            color: kColorBlack2,
                            fontSize: 10.sp,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: product.discountedPrice,
                              // text: '0',
                              style: kTextStyleSemiBold.copyWith(
                                color: kColorBlack2,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  product.inCartFlag == false
                      ? SizedBox(
                          width: 32.h,
                          height: 32.h,
                          child: Image.asset(
                            'assets/images/home/add_to_cart_icon.png',
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(2.w),
                          width: 62.w,
                          height: 25.h,
                          // color: Colors.red,

                          color: const Color(0xFFF3F3F3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 2),
                                decoration:
                                    const BoxDecoration(color: kColorWhite),
                                height: 16.h,
                                width: 16.w,
                                child: Image.asset(
                                  'assets/images/cart/minus.png',
                                ),
                              ),
                              Text(
                                product.inCartQuantity.toString(),
                                style: kTextStyleBold.copyWith(
                                  fontSize: 12.sp,
                                  color: kColorBlack2,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 2),
                                decoration:
                                    const BoxDecoration(color: kColorWhite),
                                height: 16.h,
                                width: 16.w,
                                child: Image.asset(
                                  'assets/images/cart/plus.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              )
            ],
          ),
        ),
        product.offPercentage == '0'
            ? const SizedBox()
            : Positioned(
                top: 0,
                left: 0,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SizedBox(
                      width: 55.w,
                      height: 22.h,
                      child: CustomPaint(
                        painter: VCutRectanglePainter(
                            color: const Color(0xFF79A400)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.w),
                      // margin: EdgeInsets.only(left: screenWidth * 0.013),
                      child: Text(
                        '${product.offPercentage}% Off',
                        // 'off %',
                        style: kTextStyleSemiBold.copyWith(
                            color: kColorWhite, fontSize: 10.sp),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  void _openProductWeightBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kColorTransparent, // Make the background transparent
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Stack(
              children: [
                Container(
                  height: 292.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.h),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 272.h,
                          decoration: const BoxDecoration(
                            color: kColorWhite,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 48.h,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 25.w),
                                child: Text(
                                  'Mango Alphonso',
                                  style: kTextStyleSemiBold.copyWith(
                                    fontSize: 20.sp,
                                    color: kColorBlack2,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 25.h,
                              ),

                              //Weights
                              Container(
                                margin:
                                    EdgeInsets.only(left: 25.w, right: 25.w),
                                padding:
                                    EdgeInsets.only(left: 18.w, right: 8.w),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.h),
                                  border: Border.all(
                                    color: const Color(0xFFE8E8E8),
                                    width: 1.h,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '180g',
                                          style: kTextStyleSemiBold.copyWith(
                                              fontSize: 16.sp,
                                              color: kColorBlack2),
                                        ),
                                        Container(
                                          height: 38.h,
                                          margin: EdgeInsets.only(
                                              left: 16.w,
                                              right: 16.w,
                                              top: 8.h,
                                              bottom: 8.h),
                                          width: 1.w,
                                          color: kColorBlack2.withOpacity(0.15),
                                        ),
                                        Text(
                                          '\$ 10',
                                          style: kTextStyleMedium.copyWith(
                                              fontSize: 16.sp,
                                              color: kColorBlack2),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.h, horizontal: 24.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.h),
                                            border: Border.all(
                                              width: 1.h,
                                              color: kColorMainTheme,
                                            ),
                                          ),
                                          child: Text(
                                            'Select',
                                            style: kTextStyleSemiBold.copyWith(
                                              fontSize: 16.sp,
                                              color: kColorMainTheme,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(left: 25.w, right: 25.w),
                                padding:
                                    EdgeInsets.only(left: 18.w, right: 8.w),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.h),
                                  border: Border.all(
                                    color: const Color(0xFFE8E8E8),
                                    width: 1.h,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '340g',
                                          style: kTextStyleSemiBold.copyWith(
                                              fontSize: 16.sp,
                                              color: kColorBlack2),
                                        ),
                                        Container(
                                          height: 38.h,
                                          margin: EdgeInsets.only(
                                              left: 16.w,
                                              right: 16.w,
                                              top: 8.h,
                                              bottom: 8.h),
                                          width: 1.w,
                                          color: kColorBlack2.withOpacity(0.15),
                                        ),
                                        Text(
                                          '\$ 15',
                                          style: kTextStyleMedium.copyWith(
                                              fontSize: 16.sp,
                                              color: kColorBlack2),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.h, horizontal: 24.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.h),
                                            border: Border.all(
                                              width: 1.h,
                                              color: kColorMainTheme,
                                            ),
                                          ),
                                          child: Text(
                                            'Select',
                                            style: kTextStyleSemiBold.copyWith(
                                              fontSize: 16.sp,
                                              color: kColorMainTheme,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 8.w,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: SizedBox(
                            width: 44.h,
                            height: 44.h,
                            child: SvgPicture.asset(
                              'assets/images/home/close_icon.svg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
