import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
// import 'package:trolley/constants/decorations.dart';
import 'package:trolley/routes/routes.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';

import '../../constants/textstyles.dart';
import '../../models/orders/orders.dart';
// import '../../widgets/common/custom_bottom_button_with_icon_solid_color.dart';
import '../../widgets/common/custom_bottom_button_with_icon_solid_color.dart';
import '../../widgets/order_card_widget.dart';

enum OrderStatus { all, onTheWay, delivered, cancelled }

enum OrderTime { allTime, last7Days, last1Month, last6Months }

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kColorBg,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //App bar

                CustomAppBarWithBack(
                  title: 'Orders'.tr,
                ),

                //List goes from here
                Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: screenSize.width,
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),

                          //Order Card Widget
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(ordersDetailsScreen);
                            },
                            child: OrderCardWidget(
                              orderList: Order.ordersList,
                            ),
                          ),

                          SizedBox(
                            height: 35.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

            //Filter Button

            //Filter Button
            Positioned(
              bottom: 20.h,
              right: 36.w,
              child: GestureDetector(
                onTap: () {
                  _openBottomSheet(context);
                },
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: kColorMainTheme,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: const Offset(0, 4),
                        color: kColorBlack.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: Image.asset(
                      'assets/images/sub_categories/filter.png',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _openBottomSheet(BuildContext context) {
  OrderStatus _orderStatus = OrderStatus.all;
  OrderTime _orderTime = OrderTime.allTime;

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
                height: 628.h,
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
                        height: 608.h,
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
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(right: 25.w)
                                  : EdgeInsets.only(left: 25.w),
                              child: Text(
                                'Filter by'.tr,
                                style: kTextStyleSemiBold.copyWith(
                                  fontSize: 20.sp,
                                  color: kColorBlack2,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 48.h,
                            ),

                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(right: 25.w)
                                  : EdgeInsets.only(left: 25.w),
                              child: Text(
                                'Status'.tr,
                                style: kTextStyleMedium.copyWith(
                                  fontSize: 16.sp,
                                  color: kColorBlack2,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15.h,
                            ),

                            //Order Status Radio
                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(right: 25.w)
                                  : EdgeInsets.only(left: 25.w),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Radio(
                                      activeColor: kColorMainTheme,
                                      // contentPadding: EdgeInsets.all(2.w),
                                      // visualDensity:
                                      //     const VisualDensity(horizontal: -4.0),
                                      // dense: true,
                                      // title: Text(
                                      //   'All',
                                      //   style: kTextStyleRegular.copyWith(
                                      //     fontSize: 16.h,
                                      //     color: kColorBlack2,
                                      //   ),
                                      // ),
                                      value: OrderStatus.all,
                                      groupValue: _orderStatus,
                                      onChanged: (OrderStatus? value) {
                                        setState(() {
                                          _orderStatus = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(
                                    'All'.tr,
                                    style: _orderStatus == OrderStatus.all
                                        ? kTextStyleMedium.copyWith(
                                            color: kColorMainTheme,
                                            fontSize: 16.sp,
                                          )
                                        : kTextStyleRegular.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(right: 25.w)
                                  : EdgeInsets.only(left: 25.w),

                              // height: 100,
                              // width: 300,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Radio(
                                      activeColor: kColorMainTheme,
                                      // contentPadding: EdgeInsets.all(2.w),
                                      // visualDensity:
                                      //     const VisualDensity(horizontal: -4.0),
                                      // dense: true,
                                      // title: Text(
                                      //   'All',
                                      //   style: kTextStyleRegular.copyWith(
                                      //     fontSize: 16.h,
                                      //     color: kColorBlack2,
                                      //   ),
                                      // ),
                                      value: OrderStatus.onTheWay,
                                      groupValue: _orderStatus,
                                      onChanged: (OrderStatus? value) {
                                        setState(() {
                                          _orderStatus = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(
                                    'On the Way'.tr,
                                    style: _orderStatus == OrderStatus.onTheWay
                                        ? kTextStyleMedium.copyWith(
                                            color: kColorMainTheme,
                                            fontSize: 16.sp,
                                          )
                                        : kTextStyleRegular.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(right: 25.w)
                                  : EdgeInsets.only(left: 25.w),

                              // height: 100,
                              // width: 300,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Radio(
                                      activeColor: kColorMainTheme,
                                      // contentPadding: EdgeInsets.all(2.w),
                                      // visualDensity:
                                      //     const VisualDensity(horizontal: -4.0),
                                      // dense: true,
                                      // title: Text(
                                      //   'All',
                                      //   style: kTextStyleRegular.copyWith(
                                      //     fontSize: 16.h,
                                      //     color: kColorBlack2,
                                      //   ),
                                      // ),
                                      value: OrderStatus.delivered,
                                      groupValue: _orderStatus,
                                      onChanged: (OrderStatus? value) {
                                        setState(() {
                                          _orderStatus = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(
                                    'Delivered'.tr,
                                    style: _orderStatus == OrderStatus.delivered
                                        ? kTextStyleMedium.copyWith(
                                            color: kColorMainTheme,
                                            fontSize: 16.sp,
                                          )
                                        : kTextStyleRegular.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(right: 25.w)
                                  : EdgeInsets.only(left: 25.w),

                              // height: 100,
                              // width: 300,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Radio(
                                      activeColor: kColorMainTheme,
                                      // contentPadding: EdgeInsets.all(2.w),
                                      // visualDensity:
                                      //     const VisualDensity(horizontal: -4.0),
                                      // dense: true,
                                      // title: Text(
                                      //   'All',
                                      //   style: kTextStyleRegular.copyWith(
                                      //     fontSize: 16.h,
                                      //     color: kColorBlack2,
                                      //   ),
                                      // ),
                                      value: OrderStatus.cancelled,
                                      groupValue: _orderStatus,
                                      onChanged: (OrderStatus? value) {
                                        setState(() {
                                          _orderStatus = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(
                                    'Cancelled'.tr,
                                    style: _orderStatus == OrderStatus.cancelled
                                        ? kTextStyleMedium.copyWith(
                                            color: kColorMainTheme,
                                            fontSize: 16.sp,
                                          )
                                        : kTextStyleRegular.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),

                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(right: 25.w)
                                  : EdgeInsets.only(left: 25.w),
                              child: Text(
                                'Time'.tr,
                                style: kTextStyleMedium.copyWith(
                                  fontSize: 16.sp,
                                  color: kColorBlack2,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15.h,
                            ),

                            //Order Status Radio
                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(right: 25.w)
                                  : EdgeInsets.only(left: 25.w),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Radio(
                                      activeColor: kColorMainTheme,
                                      // contentPadding: EdgeInsets.all(2.w),
                                      // visualDensity:
                                      //     const VisualDensity(horizontal: -4.0),
                                      // dense: true,
                                      // title: Text(
                                      //   'All',
                                      //   style: kTextStyleRegular.copyWith(
                                      //     fontSize: 16.h,
                                      //     color: kColorBlack2,
                                      //   ),
                                      // ),
                                      value: OrderTime.allTime,
                                      groupValue: _orderTime,
                                      onChanged: (OrderTime? value) {
                                        setState(() {
                                          _orderTime = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(
                                    'All Time'.tr,
                                    style: _orderTime == OrderTime.allTime
                                        ? kTextStyleMedium.copyWith(
                                            color: kColorMainTheme,
                                            fontSize: 16.sp,
                                          )
                                        : kTextStyleRegular.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(right: 25.w)
                                  : EdgeInsets.only(left: 25.w),

                              // height: 100,
                              // width: 300,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Radio(
                                      activeColor: kColorMainTheme,
                                      // contentPadding: EdgeInsets.all(2.w),
                                      // visualDensity:
                                      //     const VisualDensity(horizontal: -4.0),
                                      // dense: true,
                                      // title: Text(
                                      //   'All',
                                      //   style: kTextStyleRegular.copyWith(
                                      //     fontSize: 16.h,
                                      //     color: kColorBlack2,
                                      //   ),
                                      // ),
                                      value: OrderTime.last7Days,
                                      groupValue: _orderTime,
                                      onChanged: (OrderTime? value) {
                                        setState(() {
                                          _orderTime = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(
                                    'Last 7 Days'.tr,
                                    style: _orderTime == OrderTime.last7Days
                                        ? kTextStyleMedium.copyWith(
                                            color: kColorMainTheme,
                                            fontSize: 16.sp,
                                          )
                                        : kTextStyleRegular.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(right: 25.w)
                                  : EdgeInsets.only(left: 25.w),

                              // height: 100,
                              // width: 300,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Radio(
                                      activeColor: kColorMainTheme,
                                      // contentPadding: EdgeInsets.all(2.w),
                                      // visualDensity:
                                      //     const VisualDensity(horizontal: -4.0),
                                      // dense: true,
                                      // title: Text(
                                      //   'All',
                                      //   style: kTextStyleRegular.copyWith(
                                      //     fontSize: 16.h,
                                      //     color: kColorBlack2,
                                      //   ),
                                      // ),
                                      value: OrderTime.last1Month,
                                      groupValue: _orderTime,
                                      onChanged: (OrderTime? value) {
                                        setState(() {
                                          _orderTime = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(
                                    'Last 1 Month'.tr,
                                    style: _orderTime == OrderTime.last1Month
                                        ? kTextStyleMedium.copyWith(
                                            color: kColorMainTheme,
                                            fontSize: 16.sp,
                                          )
                                        : kTextStyleRegular.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(right: 25.w)
                                  : EdgeInsets.only(left: 25.w),

                              // height: 100,
                              // width: 300,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Radio(
                                      activeColor: kColorMainTheme,
                                      // contentPadding: EdgeInsets.all(2.w),
                                      // visualDensity:
                                      //     const VisualDensity(horizontal: -4.0),
                                      // dense: true,
                                      // title: Text(
                                      //   'All',
                                      //   style: kTextStyleRegular.copyWith(
                                      //     fontSize: 16.h,
                                      //     color: kColorBlack2,
                                      //   ),
                                      // ),
                                      value: OrderTime.last6Months,
                                      groupValue: _orderTime,
                                      onChanged: (OrderTime? value) {
                                        setState(() {
                                          _orderTime = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(
                                    'Last 6 Months'.tr,
                                    style: _orderTime == OrderTime.last6Months
                                        ? kTextStyleMedium.copyWith(
                                            color: kColorMainTheme,
                                            fontSize: 16.sp,
                                          )
                                        : kTextStyleRegular.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 48.h,
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 25.w, right: 25.w),
                              child: CustomBottomButtonWithIconSolidColor(
                                buttonTitle: 'Apply'.tr,
                              ),
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

// Widget _buildBottomSheetContent(BuildContext context) {
//   return 
// }
