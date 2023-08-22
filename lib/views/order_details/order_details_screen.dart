import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/routes/routes.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';

import '../../constants/colors.dart';
import '../../widgets/order/cancel_order_button.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

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
                CustomAppBarWithBack(
                  title: 'Order Details'.tr,
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),

                        //Order code card
                        // Container(
                        //   padding: EdgeInsets.all(15.h),
                        //   margin: EdgeInsets.only(
                        //     left: 25.w,
                        //     right: 25.w,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     color: kColorWhite,
                        //     borderRadius: BorderRadius.circular(24.h),
                        //   ),
                        //   width: screenWidth,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         'Order Code'.tr,
                        //         style: kTextStyleMedium.copyWith(
                        //           fontSize: 16.sp,
                        //           color: kColorBlack2,
                        //         ),
                        //       ),
                        //       Container(
                        //         height: 40.h,
                        //         width: 112.w,
                        //         decoration: BoxDecoration(
                        //           color: kColorMainTheme.withOpacity(0.05),
                        //           borderRadius: BorderRadius.circular(8.h),
                        //         ),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceEvenly,
                        //           children: [
                        //             Text(
                        //               '1',
                        //               style: kTextStyleSemiBold.copyWith(
                        //                 fontSize: 14.sp,
                        //                 color: kColorMainTheme,
                        //               ),
                        //             ),
                        //             Text(
                        //               '2',
                        //               style: kTextStyleSemiBold.copyWith(
                        //                 fontSize: 14.sp,
                        //                 color: kColorMainTheme,
                        //               ),
                        //             ),
                        //             Text(
                        //               '3',
                        //               style: kTextStyleSemiBold.copyWith(
                        //                 fontSize: 14.sp,
                        //                 color: kColorMainTheme,
                        //               ),
                        //             ),
                        //             Text(
                        //               '4 ',
                        //               style: kTextStyleSemiBold.copyWith(
                        //                 fontSize: 14.sp,
                        //                 color: kColorMainTheme,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        // SizedBox(
                        //   height: 15.h,
                        // ),

                        //Checkout Card
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
                              Text(
                                '#TROLL12345',
                                style: kTextStyleRegular.copyWith(
                                  fontSize: 10.sp,
                                  color: kColorBlack2withOpacity75,
                                ),
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

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

                              SizedBox(
                                height: 15.h,
                              ),
                            ],
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
                                              fontSize: 15.h,
                                            ),
                                          ),
                                          Text(
                                            ' - 2',
                                            style: kTextStyleRegular.copyWith(
                                              color: kColorBlack2,
                                              fontSize: 15.h,
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
                                          const SizedBox(
                                            width: 5,
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

                        //Address Details Card
                        Container(
                          padding: const EdgeInsets.all(15),
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
                                    'Address'.tr,
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
                              Text(
                                'C6/7, Vivina Co Op Hsg Ltd, Ma Rd, Andheri(w) Mumbai, Maharashtra',
                                style: kTextStyleRegular.copyWith(
                                  color: kColorBlack2,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15.h,
                        ),

                        //Time Slot Card
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Time Slot'.tr,
                                style: kTextStyleSemiBold.copyWith(
                                  fontSize: 15.sp,
                                  color: kColorBlack2,
                                ),
                              ),
                              Text(
                                '8:00 am to 9:00 am',
                                style: kTextStyleSemiBold.copyWith(
                                  fontSize: 15.sp,
                                  color: kColorMainTheme,
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15.h,
                        ),

                        //Time Slot Card
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Payment Method',
                                style: kTextStyleSemiBold.copyWith(
                                  fontSize: 15.sp,
                                  color: kColorBlack2,
                                ),
                              ),
                              Text(
                                'Cash on Delivery',
                                style: kTextStyleSemiBold.copyWith(
                                  fontSize: 15.sp,
                                  color: kColorMainTheme,
                                ),
                              )
                            ],
                          ),
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

          //Cancel Order Button
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: GestureDetector(
                onTap: () {
                  Get.toNamed(cancelOrderScreen);
                },
                child: const CustomCancelBottomButton()),
          ),

          // Confirm Button
          // Positioned(
          //   bottom: 10,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     margin: const EdgeInsets.symmetric(horizontal: 25),
          //     width: screenSize.width,
          //     height: 48,
          //     decoration: BoxDecoration(
          //       color: kColorMainTheme,
          //       borderRadius: BorderRadius.circular(5),
          //       boxShadow: [
          //         BoxShadow(
          //           offset: const Offset(0, 2),
          //           color: Colors.black.withOpacity(0.3),
          //           blurRadius: 3,
          //         ),
          //       ],
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           'Confirm',
          //           style: kTextStyleSemiBold.copyWith(
          //               fontSize: 16, color: kColorWhite),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
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
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mango Alphonso',
                style: kTextStyleSemiBold.copyWith(
                  color: kColorBlack2,
                  fontSize: 14,
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
            ],
          ),
        ],
      ),
    );
  }
}
