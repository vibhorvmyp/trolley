import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/decorations.dart';

class CustomAppBarWithBack extends StatelessWidget {
  const CustomAppBarWithBack({
    this.title = '',
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: kColorWhite,
        boxShadow: [
          kBoxShadowStyle1,
        ],
      ),
      // color: Colors.red,
      // Get.locale!.languageCode

      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // color: Colors.red,
                margin: Get.locale!.languageCode == 'ar'
                    ? EdgeInsets.only(right: 20.w)
                    : EdgeInsets.only(left: 20.w),
                height: 24.h,
                width: 24.w,
                child: Row(
                  children: [
                    // Text(local.toString()),
                    Get.locale!.languageCode == 'ar'
                        ? Image.asset('assets/images/arrow_right.png')
                        : Image.asset('assets/images/arrow_left.png'),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            child: Align(
              alignment: Get.locale!.languageCode == 'ar'
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Get.back();

                  // print('back');
                },
                child: Container(
                  height: 60.h,
                  width: 60.w,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: 'HindMadurai-SemiBold',
                    fontSize: 24.sp,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBarWithBackWithCartQuantity extends StatelessWidget {
  const CustomAppBarWithBackWithCartQuantity({
    this.title = '',
    this.cartQuantity = '',
    super.key,
  });

  final String title;
  final String cartQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: kColorWhite,
        boxShadow: [
          kBoxShadowStyle1,
        ],
      ),
      // color: Colors.red,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // color: Colors.red,
                margin: Get.locale!.languageCode == 'ar'
                    ? EdgeInsets.only(right: 20.w)
                    : EdgeInsets.only(left: 20.w),
                height: 24.h,
                width: 24.w,
                child: Get.locale!.languageCode == 'ar'
                    ? Image.asset('assets/images/arrow_right.png')
                    : Image.asset('assets/images/arrow_left.png'),
              ),
            ],
          ),
          Positioned(
            child: Align(
              alignment: Get.locale!.languageCode == 'ar'
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Get.back();

                  // print('back');
                },
                child: Container(
                  height: 60.h,
                  width: 60.w,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'HindMadurai-SemiBold',
                        fontSize: 24.sp,
                        color: Colors.black),
                  ),
                  Text(
                    cartQuantity,
                    style: TextStyle(
                        fontFamily: 'HindMadurai-SemiBold',
                        fontSize: 24.sp,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
