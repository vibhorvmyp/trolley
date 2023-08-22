import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class CustomDialogRegularSize extends StatelessWidget {
  const CustomDialogRegularSize({
    this.imgUrl = '',
    this.dialogTitle = '',
    this.dialogDescription = '',
    this.leftButtonSelectedFlag = false,
    this.rightButtonSelectedFlag = false,
    this.leftButtonTitle = '',
    this.rightButtonTitle = '',
    this.onTap,
    super.key,
  });

  final String imgUrl;
  final String dialogTitle;
  final String dialogDescription;
  final bool rightButtonSelectedFlag;
  final bool leftButtonSelectedFlag;
  final String rightButtonTitle;
  final String leftButtonTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: OverflowBox(
        minWidth: 0.0,
        maxWidth: double.infinity,
        minHeight: 0.0,
        maxHeight: double.infinity,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 293.h,
              width: 270.w,
              margin: EdgeInsets.all(19.h),
              // padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                // color: Colors
                //     .transparent,

                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.h),
              ),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          height: 293.h,
                          width: 270.w,
                          child: Image.asset(
                            'assets/images/dialogs/dialog_frame.png',
                          ),
                        ),
                        Positioned(
                          bottom: 0.h,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              alignment: Alignment.topCenter,
                              height: 195.h,
                              width: 270.w,
                              decoration: BoxDecoration(
                                color: kColorWhite,
                                borderRadius: BorderRadius.circular(8.h),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 66.h,
                          right: 0.w,
                          left: 0.w,
                          child: Align(
                            child: Column(
                              children: [
                                Container(
                                  height: 72.h,
                                  width: 72.h,
                                  child: imgUrl != ''
                                      ? Image.asset(imgUrl)
                                      : const SizedBox(),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  dialogTitle.tr,
                                  style: dialogTitle.tr == 'Delete Account?'.tr
                                      ? kTextStyleSemiBold.copyWith(
                                          fontSize: 18.sp,
                                          color: const Color(0xFFBA0000),
                                        )
                                      : kTextStyleSemiBold.copyWith(
                                          fontSize: 18.sp,
                                          color: kColorBlack,
                                        ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  dialogDescription.tr,
                                  style: kTextStyleRegular.copyWith(
                                    fontSize: 14.sp,
                                    color: kColorBlack2withOpacity75,
                                  ),
                                ),
                                SizedBox(
                                  height: 36.h,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 30.w, right: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //No Button
                                      GestureDetector(
                                        onTap: () {
                                          if (leftButtonTitle.tr == 'No'.tr) {
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.h, horizontal: 35.w),
                                          decoration:
                                              leftButtonSelectedFlag != false
                                                  ? BoxDecoration(
                                                      color: kColorMainTheme,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.h),
                                                      border: Border.all(
                                                        width: 1.h,
                                                        color: kColorMainTheme,
                                                      ),
                                                    )
                                                  : BoxDecoration(
                                                      color: kColorWhite,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.h),
                                                      border: Border.all(
                                                        width: 1.h,
                                                        color: kColorMainTheme,
                                                      ),
                                                    ),
                                          child: Text(
                                            leftButtonTitle.tr,
                                            style: kTextStyleSemiBold.copyWith(
                                              fontSize: 14.sp,
                                              color: leftButtonSelectedFlag !=
                                                      false
                                                  ? kColorWhite
                                                  : kColorMainTheme,
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Yes Button
                                      GestureDetector(
                                        onTap: onTap,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.h, horizontal: 35.w),
                                          decoration:
                                              rightButtonSelectedFlag != false
                                                  ? BoxDecoration(
                                                      color: kColorMainTheme,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.h),
                                                      border: Border.all(
                                                        width: 1.h,
                                                        color: kColorMainTheme,
                                                      ),
                                                    )
                                                  : BoxDecoration(
                                                      color: kColorWhite,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.h),
                                                      border: Border.all(
                                                        width: 1.h,
                                                        color: kColorMainTheme,
                                                      ),
                                                    ),
                                          child: Text(
                                            rightButtonTitle.tr,
                                            style: kTextStyleSemiBold.copyWith(
                                              fontSize: 14.sp,
                                              color: rightButtonSelectedFlag !=
                                                      false
                                                  ? kColorWhite
                                                  : kColorMainTheme,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 1.h),
                padding: EdgeInsets.all(12.h),
                width: 36.5.h,
                height: 36.5.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset('assets/images/dialogs/close.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
