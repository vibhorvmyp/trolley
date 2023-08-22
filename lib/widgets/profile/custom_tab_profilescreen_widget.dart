import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class CustomTabProfileScreenWidget extends StatelessWidget {
  const CustomTabProfileScreenWidget({
    this.leadingIconUrl = '',
    this.rightArrowIconUrl = '',
    this.title = '',
    super.key,
  });

  final String leadingIconUrl;
  final String title;
  final String rightArrowIconUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Get.locale!.languageCode == 'ar'
          ? EdgeInsets.only(right: 25.w)
          : EdgeInsets.only(left: 25.w),
      padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 24.h,
                width: 24.h,
                child: Image.asset(leadingIconUrl),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                // 'My Trolley Credit',
                title,
                style: kTextStyleMedium.copyWith(
                    fontSize: 20.sp, color: kColorBlack2),
              ),
            ],
          ),
          Container(
            margin: Get.locale!.languageCode == 'ar'
                ? EdgeInsets.only(left: 15.w)
                : EdgeInsets.only(right: 15.w),
            height: 15.h,
            width: 15.h,
            child: Image.asset(rightArrowIconUrl),
          ),
        ],
      ),
    );
  }
}
