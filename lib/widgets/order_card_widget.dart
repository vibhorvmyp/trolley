import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/textstyles.dart';
import '../models/orders/orders.dart';
import 'dialogs/custom_dialog_regular_size.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    this.orderList = const [],
    super.key,
  });

  final List<Order> orderList;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: orderList.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              padding: EdgeInsets.all(25.h),
              margin: EdgeInsets.only(left: 25.w, right: 25.w),
              height: 300.h,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: kColorWhite,
                borderRadius: BorderRadius.circular(24.h),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: kColorMainTheme.withOpacity(0.10),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orderList[index].orderId,
                        style: kTextStyleRegular.copyWith(
                          color: kColorBlack2withOpacity75,
                          fontSize: 10.sp,
                        ),
                      ),

                      //Order Status Widget
                      Get.locale!.languageCode == 'ar'
                          ? Row(
                              children: [
                                Text(
                                  orderList[index].orderStatus,
                                  style: kTextStyleSemiBold.copyWith(
                                      color: orderList[index].orderStatus ==
                                              'On the way'
                                          ? const Color(0xFFF3A638)
                                          : orderList[index].orderStatus ==
                                                  'Delivered'
                                              ? const Color(0xFF4CB64C)
                                              : const Color(0xFFE3503E),
                                      fontSize: 12.sp),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SizedBox(
                                  height: 16.h,
                                  width: 16.h,
                                  child: orderList[index].orderStatus ==
                                          'On the way'
                                      ? Image.asset(
                                          'assets/images/orders/on_the_way.png',
                                        )
                                      : orderList[index].orderStatus ==
                                              'Delivered'
                                          ? Image.asset(
                                              'assets/images/orders/delivered.png',
                                            )
                                          : Image.asset(
                                              'assets/images/orders/cancelled.png',
                                            ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                SizedBox(
                                  height: 16.h,
                                  width: 16.h,
                                  child: orderList[index].orderStatus ==
                                          'On the way'
                                      ? Image.asset(
                                          'assets/images/orders/on_the_way.png',
                                        )
                                      : orderList[index].orderStatus ==
                                              'Delivered'
                                          ? Image.asset(
                                              'assets/images/orders/delivered.png',
                                            )
                                          : Image.asset(
                                              'assets/images/orders/cancelled.png',
                                            ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  orderList[index].orderStatus,
                                  style: kTextStyleSemiBold.copyWith(
                                      color: orderList[index].orderStatus ==
                                              'On the way'
                                          ? const Color(0xFFF3A638)
                                          : orderList[index].orderStatus ==
                                                  'Delivered'
                                              ? const Color(0xFF4CB64C)
                                              : const Color(0xFFE3503E),
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                    ],
                  ),

                  //Height 15
                  SizedBox(
                    height: 15.h,
                  ),

                  //Items count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${orderList[index].itemCount} Items',
                        style: kTextStyleMedium.copyWith(
                          color: kColorBlack2,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 8.h,
                  ),
                  //Items
                  Container(
                    alignment: Alignment.centerLeft,
                    // width: 300,
                    height: 70.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, innerIndex) {
                        return Container(
                          height: 70.h,
                          width: 70.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.h),
                            // border: Border.all(
                            //   width: 1,
                            //   color: const Color(0xFFFFEBBB),
                            // ),
                            color: const Color(0xFFFFFAEE),
                          ),
                          child: Image.asset(
                            orderList[index].itemsListImgUrl[innerIndex],
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 8.w,
                        );
                      },
                      itemCount: orderList[index].itemsListImgUrl.length,
                    ),
                  ),

                  SizedBox(
                    height: 13.h,
                  ),

                  //Item titles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Mango Alphonso, Orange Carrot',
                        style: kTextStyleSemiBold.copyWith(
                          color: kColorBlack2,
                          fontSize: 14.sp,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'EGP ',
                          style: kTextStyleMedium.copyWith(
                              color: kColorBlack2, fontSize: 16.sp),
                          children: <TextSpan>[
                            TextSpan(
                              text: orderList[index].totalSum,
                              style: kTextStyleSemiBold.copyWith(
                                color: kColorBlack2,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                  //Order time and date
                  SizedBox(
                    // color: Colors.red,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                          width: 16.h,
                          child: Image.asset(
                            'assets/images/orders/calender.png',
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'Ordered on ${orderList[index].orderTime}',
                          style: kTextStyleRegular.copyWith(
                            fontSize: 10.sp,
                            color: kColorBlack2withOpacity75,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //In case of showing the cancelled faded card
            orderList[index].orderStatus == 'Cancelled'
                ? Container(
                    padding: EdgeInsets.all(25.h),
                    margin: EdgeInsets.only(left: 25.w, right: 25.w),
                    height: 300.h,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      color: kColorWhite.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(24.h),
                    ),
                    child: Get.locale!.languageCode == 'ar'
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                orderList[index].orderStatus,
                                style: kTextStyleSemiBold.copyWith(
                                  color: orderList[index].orderStatus ==
                                          'On the way'
                                      ? const Color(0xFFF3A638)
                                      : orderList[index].orderStatus ==
                                              'Delivered'
                                          ? const Color(0xFF4CB64C)
                                          : const Color(0xFFE3503E),
                                  fontSize: 12.h,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SizedBox(
                                height: 16.h,
                                width: 16.h,
                                child:
                                    orderList[index].orderStatus == 'On the way'
                                        ? Image.asset(
                                            'assets/images/orders/on_the_way.png',
                                          )
                                        : orderList[index].orderStatus ==
                                                'Delivered'
                                            ? Image.asset(
                                                'assets/images/orders/delivered.png',
                                              )
                                            : Image.asset(
                                                'assets/images/orders/cancelled.png',
                                              ),
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 16.h,
                                width: 16.h,
                                child:
                                    orderList[index].orderStatus == 'On the way'
                                        ? Image.asset(
                                            'assets/images/orders/on_the_way.png',
                                          )
                                        : orderList[index].orderStatus ==
                                                'Delivered'
                                            ? Image.asset(
                                                'assets/images/orders/delivered.png',
                                              )
                                            : Image.asset(
                                                'assets/images/orders/cancelled.png',
                                              ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                orderList[index].orderStatus,
                                style: kTextStyleSemiBold.copyWith(
                                  color: orderList[index].orderStatus ==
                                          'On the way'
                                      ? const Color(0xFFF3A638)
                                      : orderList[index].orderStatus ==
                                              'Delivered'
                                          ? const Color(0xFF4CB64C)
                                          : const Color(0xFFE3503E),
                                  fontSize: 12.h,
                                ),
                              ),
                            ],
                          ),
                  )
                : const SizedBox(),

            Positioned(
              bottom: 20.h,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  if (orderList[index].buttonTitle == 'Reorder') {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const CustomDialogRegularSize(
                        rightButtonTitle: 'Yes',
                        leftButtonTitle: 'No',
                        rightButtonSelectedFlag: true,
                        leftButtonSelectedFlag: false,
                        dialogDescription: 'Are you sure you want to Reorder?',
                        dialogTitle: 'Reorder?',
                        imgUrl: 'assets/images/dialogs/reorder.png',
                      ),
                    );
                    print('open reorder dialog');
                  }
                },
                child: Container(
                  // color: Colors.red,
                  // width: screenSize.width,
                  padding: EdgeInsets.only(right: 25.w),
                  margin: EdgeInsets.only(right: 25.w),
                  child: Text(
                    orderList[index].buttonTitle,
                    style: kTextStyleSemiBold.copyWith(
                        fontSize: 18.sp,
                        color: orderList[index].buttonTitle == 'Cancel Order'
                            ? const Color(0xFFE3503E)
                            : orderList[index].buttonTitle == 'Reorder'
                                ? const Color(0xFFF3A638)
                                : const Color(0xFFF3A638)),
                  ),
                ),
              ),
            ),

            //Rate Order Widget
            orderList[index].ratingFlag != false
                ? Positioned(
                    bottom: 25.h,
                    left: 10.w,
                    child: Container(
                      // color: Colors.red,
                      // width: 60,
                      // width: screenSize.width,
                      // padding: EdgeInsets.only(
                      //   left: 25.w,
                      // ),
                      margin: EdgeInsets.only(
                        left: 40.w,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Rate Order'.tr,
                            style: kTextStyleRegular.copyWith(
                              fontSize: 12.sp,
                              color: kColorBlack2,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 16.h,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Image.asset(
                                'assets/images/orders/star_filled.png'),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 25.h,
        );
      },
    );
  }
}
