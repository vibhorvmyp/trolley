import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class CustomDialogCongratsSimple extends StatelessWidget {
  const CustomDialogCongratsSimple({
    this.imgUrl = '',
    this.dialogTitle = '',
    this.dialogDescription = '',
    super.key,
  });

  final String imgUrl;
  final String dialogTitle;
  final String dialogDescription;

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
              height: 241.h,
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
                          height: 241.h,
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
                              height: 151.h,
                              width: 270.w,
                              decoration: BoxDecoration(
                                color: kColorWhite,
                                borderRadius: BorderRadius.circular(8.h),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 55.h,
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
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 15.w, right: 15.w),
                                  child: Text(
                                    dialogDescription.tr,
                                    textAlign: TextAlign.center,
                                    style: kTextStyleRegular.copyWith(
                                      fontSize: 14.sp,
                                      color: kColorBlack2withOpacity75,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 36.h,
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
