import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/decorations.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/models/cart/cart_data_model.dart';
import 'package:trolley/routes/routes.dart';

import 'package:trolley/widgets/cart/cart_product_list_widget.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';
import 'package:trolley/widgets/common/custom_simple_button.dart';

import '../../constants/colors.dart';
import '../../widgets/home_headings_see_all_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kColorBg,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                //App bar
                CustomAppBarWithBackWithCartQuantity(
                  title: 'Cart'.tr,
                  cartQuantity: '(2)',
                ),

                Container(
                  // alignment: Alignment.center,
                  padding: Get.locale!.languageCode == 'ar'
                      ? EdgeInsets.only(right: 25.w)
                      : EdgeInsets.only(left: 25.w),
                  height: 60.h,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: kColorWhite,
                    boxShadow: [
                      kBoxShadowStyle1,
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 36.h,
                        width: 36.h,
                        child: Image.asset(
                            'assets/images/order_details/ticket.png'),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Free Delivery if order is more than '.tr,
                                style: kTextStyleSemiBold.copyWith(
                                  color: kColorBlack2,
                                  fontSize: 15.sp,
                                ),
                              ),
                              Text(
                                'EGP 50',
                                style: kTextStyleSemiBold.copyWith(
                                  color: kColorBlack2,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Minimum amount to place an order is '.tr,
                                style: kTextStyleRegular.copyWith(
                                  color: kColorBlack2,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                'EGP 20',
                                style: kTextStyleRegular.copyWith(
                                  color: kColorBlack2,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //Checkout Main Card
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(15.h),
                          margin: EdgeInsets.only(
                            left: 25.w,
                            right: 25.w,
                          ),
                          decoration: BoxDecoration(
                            color: kColorWhite,
                            borderRadius: BorderRadius.circular(24.h),
                          ),
                          width: screenWidth,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Checkout'.tr,
                                    style: kTextStyleSemiBold.copyWith(
                                      color: kColorBlack2,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Total Items'.tr,
                                        style: kTextStyleRegular.copyWith(
                                          color: kColorBlack2,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      Text(
                                        ' - 2',
                                        style: kTextStyleRegular.copyWith(
                                          color: kColorBlack2,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              //Item Bar Card
                              const OrderDetailsItemCardWidget(),

                              //Divider
                              Container(
                                margin: EdgeInsets.only(
                                  top: 15.h,
                                  bottom: 15.h,
                                ),
                                child: Divider(
                                  height: 1.h,
                                  color: kColorBlack2withOpacity25,
                                ),
                              ),

                              //Item Bar Card
                              const OrderDetailsItemCardWidget(),

                              // SizedBox(
                              //   height: 15,
                              // ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15.h,
                        ),

                        //Coupons
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(couponsScreen);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.h),
                            margin: EdgeInsets.only(
                              left: 25.w,
                              right: 25.w,
                            ),
                            decoration: BoxDecoration(
                              color: kColorWhite,
                              borderRadius: BorderRadius.circular(24.h),
                            ),
                            width: screenWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 24.h,
                                      width: 24.h,
                                      child: Image.asset(
                                        'assets/images/cart/coupon.png',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'Use Coupons'.tr,
                                      style: kTextStyleSemiBold.copyWith(
                                        fontSize: 20.sp,
                                        color: kColorBlack2,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 24.h,
                                  width: 24.h,
                                  child: Get.locale!.languageCode == 'ar'
                                      ? Image.asset(
                                          'assets/images/cart/arrow_left.png')
                                      : Image.asset(
                                          'assets/images/cart/arrow_right.png'),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 15.h,
                        ),

                        //Billing Details Card
                        Container(
                          padding: EdgeInsets.all(15.h),
                          margin: EdgeInsets.only(
                            left: 25.w,
                            right: 25.w,
                          ),
                          decoration: BoxDecoration(
                            color: kColorWhite,
                            borderRadius: BorderRadius.circular(24.h),
                          ),
                          width: screenWidth,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Billing Details'.tr,
                                    style: kTextStyleSemiBold.copyWith(
                                      color: kColorBlack2,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              //Biiling Details
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Total Items'.tr,
                                            style: kTextStyleRegular.copyWith(
                                              color: kColorBlack2,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                          Text(
                                            ' - 2',
                                            style: kTextStyleRegular.copyWith(
                                              color: kColorBlack2,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'EGP 398.90',
                                            style: kTextStyleRegular.copyWith(
                                              color: kColorBlack2,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor: kColorBlack2,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            'EGP 198.90',
                                            style: kTextStyleMedium.copyWith(
                                              color: kColorBlack2,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 8.h,
                                  ),

                                  //Delivery Charge
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Delivery Charge'.tr,
                                        style: kTextStyleRegular.copyWith(
                                          color: kColorBlack2,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'EGP 398.90',
                                            style: kTextStyleRegular.copyWith(
                                              color: kColorBlack2,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor: kColorBlack2,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),

                                          Text(
                                            'Free'.tr,
                                            style: kTextStyleMedium.copyWith(
                                              fontSize: 16.sp,
                                              color: const Color(
                                                0xFF79A400,
                                              ),
                                            ),
                                          ),
                                          // Text(
                                          //   'EGP 198.90',
                                          //   style: kTextStyleMedium.copyWith(
                                          //     color: kColorBlack2,
                                          //     fontSize: 15,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              //Divider
                              Container(
                                margin: EdgeInsets.only(
                                  top: 15.h,
                                  bottom: 15.h,
                                ),
                                child: Divider(
                                  height: 1.h,
                                  color: kColorBlack2withOpacity25,
                                ),
                              ),

                              //Biiling Details
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Grand Total'.tr,
                                        style: kTextStyleMedium.copyWith(
                                          color: kColorBlack2,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'EGP 198.90',
                                            style: kTextStyleSemiBold.copyWith(
                                              color: kColorBlack2,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 8.h,
                                  ),

                                  //Delivery Charge
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Savings'.tr,
                                        style: kTextStyleRegular.copyWith(
                                          color: const Color(0xFF79A400),
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'EGP 249.50',
                                            style: kTextStyleMedium.copyWith(
                                              color: const Color(0xFF79A400),
                                              fontSize: 13.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15.h,
                        ),

                        //You may also like section
                        const HomeHeadingSeeAllWidget(
                          headingTitle: 'You may also like',
                          iconUrl: 'assets/images/home/must_try_icon.png',
                        ),

                        SizedBox(
                          height: 15.h,
                        ),

                        CartProductListWidget(
                          productList: CartDataModel.youMayAlsoLikeList,
                        ),

                        SizedBox(
                          height: 80.h,
                        ),

                        // Container(
                        //   height: 1000,
                        //   color: Colors.pink,
                        //   child: Text('Checkout main card'),
                        // ),
                      ],
                    ),
                  ),
                ),
                // Text('Here'),
              ],
            ),
          ),

          // Raise an Enquiry Button
          Positioned(
            bottom: 10.h,
            left: 0.w,
            right: 0.w,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(checkoutScreen);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomSimpleButton(
                  buttonTitle: 'Proceed to Checkout'.tr,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetailsItemCardWidget extends StatelessWidget {
  const OrderDetailsItemCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      // color: Colors.amberAccent,
      width: screenWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 70.h,
            width: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight * 0.01),
              // border: Border.all(
              //   width: 1,
              //   color: const Color(0xFFFFEBBB),
              // ),
              color: const Color(0xFFFFFAEE),
            ),
            child: Image.asset(
              'assets/images/orders/mango.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Container(
            // color: Colors.pink,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mango Alphonso',
                  style: kTextStyleSemiBold.copyWith(
                    color: kColorBlack2,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  '6 pcs (Approx 1.2kg)',
                  style: kTextStyleRegular.copyWith(
                    color: kColorBlack2withOpacity75,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Container(
                      // color: Colors.amber,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'EGP 199.45',
                            style: kTextStyleRegular.copyWith(
                              color: const Color(0xFF646464),
                              decoration: TextDecoration.lineThrough,
                              decorationColor: const Color(
                                0xFF646464,
                              ),
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'EGP ',
                              style: kTextStyleMedium.copyWith(
                                color: kColorBlack2,
                                fontSize: 12.sp,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '99.45',
                                  style: kTextStyleSemiBold.copyWith(
                                    color: kColorBlack2,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(2),
            width: 80.w,
            height: 30.h,
            color: const Color(0xFFF3F3F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(color: kColorWhite),
                  height: 24.h,
                  width: 24.w,
                  child: Image.asset('assets/images/cart/minus.png'),
                ),
                Text(
                  '1',
                  style: kTextStyleBold.copyWith(
                    fontSize: 14.sp,
                    color: kColorBlack2,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(color: kColorWhite),
                  height: 24.h,
                  width: 24.w,
                  child: Image.asset('assets/images/cart/plus.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
