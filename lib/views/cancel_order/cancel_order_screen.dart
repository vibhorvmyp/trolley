import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/controllers/cancel_order/cancel_order_controller.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';
import 'package:trolley/widgets/common/custom_bottom_button_with_icon_solid_color.dart';
import 'package:trolley/widgets/dialogs/custom_dialog_regular_size.dart';

class CancelOrderScreen extends StatelessWidget {
  CancelOrderScreen({super.key});

  final cancelOrderControlller = Get.put(CancelOrderController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kColorWhite,
        body: Obx(
          () => SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    //App Bar
                    CustomAppBarWithBack(
                      title: 'Cancel Order'.tr,
                    ),

                    SizedBox(
                      height: 15.h,
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 25.w),
                      child: RichText(
                        text: TextSpan(
                          text: 'Order'.tr,
                          style: kTextStyleRegular.copyWith(
                            color: kColorBlack2,
                            fontSize: 16.sp,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' : ',
                              style: kTextStyleRegular.copyWith(
                                color: kColorBlack2,
                                fontSize: 16.sp,
                              ),
                            ),
                            TextSpan(
                              text: '#TROLL12345',
                              style: kTextStyleRegular.copyWith(
                                color: kColorBlack2withOpacity75,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 25.h,
                    ),

                    Container(
                      margin: Get.locale!.languageCode == 'ar'
                          ? EdgeInsets.only(right: 25.w)
                          : EdgeInsets.only(left: 25.w),
                      child: Row(
                        children: [
                          //Checkbox
                          Stack(
                            children: [
                              cancelOrderControlller.selectedItemsList.length ==
                                      cancelOrderControlller
                                          .cancelOrderItemsStaticList.length
                                  ? Container(
                                      height: 18.h,
                                      width: 18.h,
                                      decoration: BoxDecoration(
                                        color: kColorMainTheme,
                                        borderRadius:
                                            BorderRadius.circular(3.h),
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        size: 12.h,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(
                                      height: 18.h,
                                      width: 18.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.h,
                                          color: kColorMainTheme,
                                        ),
                                        color: kColorWhite,
                                        borderRadius:
                                            BorderRadius.circular(3.h),
                                      ),
                                    ),
                              GestureDetector(
                                onTap: () {
                                  if (cancelOrderControlller
                                          .selectedItemsList.length <
                                      cancelOrderControlller
                                          .cancelOrderItemsStaticList.length) {
                                    cancelOrderControlller.addAllIds();
                                  } else {
                                    cancelOrderControlller.removeAllIds();
                                  }
                                },
                                child: Container(
                                  height: 18.h,
                                  width: 18.h,
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: 15.w,
                          ),

                          Row(
                            children: [
                              Text(
                                'Select all Items'.tr,
                                style: kTextStyleMedium.copyWith(
                                  fontSize: 16.sp,
                                  color: kColorBlack2,
                                ),
                              ),
                              Text(
                                ' (${cancelOrderControlller.selectedItemsList.length.toString()}/${cancelOrderControlller.cancelOrderItemsStaticList.length.toString()}) ',
                                style: kTextStyleMedium.copyWith(
                                  fontSize: 16.sp,
                                  color: kColorBlack2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 33.h,
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        child: ListView.separated(
                            padding: EdgeInsets.only(left: 25.w, right: 25.w),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                width: screenSize.width,
                                // color: Colors.grey.withOpacity(0.4),
                                height: 106.h,
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        //Checkbox
                                        cancelOrderControlller.selectedItemsList
                                                .contains(cancelOrderControlller
                                                    .cancelOrderItemsStaticList[
                                                        index]
                                                    .id)
                                            ? Container(
                                                height: 18.h,
                                                width: 18.h,
                                                decoration: BoxDecoration(
                                                  color: kColorMainTheme,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.h),
                                                ),
                                                child: Icon(
                                                  Icons.check,
                                                  size: 12.h,
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Container(
                                                height: 18.h,
                                                width: 18.h,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 1.h,
                                                    color: kColorMainTheme,
                                                  ),
                                                  color: kColorWhite,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.h),
                                                ),
                                              ),

                                        GestureDetector(
                                          onTap: () {
                                            cancelOrderControlller.addOrRemoveId(
                                                cancelOrderControlller
                                                    .cancelOrderItemsStaticList[
                                                        index]
                                                    .id);
                                          },
                                          child: Container(
                                            height: 18.h,
                                            width: 18.h,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 25.w,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 74.h,
                                          width: 74.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFAEE),
                                            borderRadius:
                                                BorderRadius.circular(8.h),
                                            // border: Border.all(
                                            //   // width: 5.h,
                                            //   color: const Color(0xFFFFEBBB),
                                            // ),
                                          ),
                                          child: Image.asset(
                                              cancelOrderControlller
                                                  .cancelOrderItemsStaticList[
                                                      index]
                                                  .imgUrl),
                                        ),
                                        SizedBox(
                                          width: 25.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cancelOrderControlller
                                                  .cancelOrderItemsStaticList[
                                                      index]
                                                  .title,
                                              style:
                                                  kTextStyleSemiBold.copyWith(
                                                fontSize: 16.sp,
                                                color: kColorBlack2,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              cancelOrderControlller
                                                  .cancelOrderItemsStaticList[
                                                      index]
                                                  .weight,
                                              style: kTextStyleRegular.copyWith(
                                                fontSize: 14.sp,
                                                color:
                                                    kColorBlack2withOpacity75,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'SDG ${cancelOrderControlller.cancelOrderItemsStaticList[index].originalPrice}',
                                                  style: kTextStyleRegular
                                                      .copyWith(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationColor:
                                                        const Color(0xFF646464),
                                                    fontSize: 14.sp,
                                                    color:
                                                        const Color(0xFF646464),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: 'SDG ',
                                                    style: kTextStyleMedium
                                                        .copyWith(
                                                      color: kColorBlack2,
                                                      fontSize: 14.sp,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: cancelOrderControlller
                                                            .cancelOrderItemsStaticList[
                                                                index]
                                                            .discountedPrice,
                                                        style:
                                                            kTextStyleSemiBold
                                                                .copyWith(
                                                          color: kColorBlack2,
                                                          fontSize: 18.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 1.h,
                                color: kColorBlack2withOpacity25,
                              );
                            },
                            itemCount: cancelOrderControlller
                                .cancelOrderItemsStaticList.length),
                      ),
                    ),
                  ],
                ),
                // Raise an Enquiry Button
                Positioned(
                  bottom: 20.h,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // Get.toNamed(registerScreen);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            CustomDialogRegularSize(
                          rightButtonTitle: 'Yes'.tr,
                          leftButtonTitle: 'No'.tr,
                          rightButtonSelectedFlag: true,
                          leftButtonSelectedFlag: false,
                          dialogDescription:
                              'Are you sure you want to cancel order?'.tr,
                          dialogTitle: 'Cancel Order?'.tr,
                          imgUrl: 'assets/images/dialogs/cancel_order.png',
                        ),
                      );
                      print('open cancel order  dialog');
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: CustomBottomButtonWithIconSolidColor(
                        imgUrl: 'assets/images/orders/cancel_order.png',
                        // imgUrl: 'assets/images/enquiries/query_icon.png',
                        buttonTitle: 'Cancel Selected Orders'.tr,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
