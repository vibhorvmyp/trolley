import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/routes/routes.dart';

import '../constants/colors.dart';
import '../constants/textstyles.dart';

class HomeHeadingSeeAllWidget extends StatelessWidget {
  const HomeHeadingSeeAllWidget({
    this.headingTitle = '',
    this.iconUrl = '',
    this.seeAllFlag = true,
    super.key,
  });

  final String headingTitle;
  final String iconUrl;
  final bool seeAllFlag;

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                headingTitle,
                style: kTextStyleSemiBold.copyWith(
                    fontSize: 20.sp, color: kColorBlack),
              ),
              SizedBox(
                width: 8.w,
              ),
              SizedBox(
                height: 24.h,
                width: 24.h,
                child: iconUrl != '' ? Image.asset(iconUrl) : const SizedBox(),
              )
            ],
          ),
          seeAllFlag != false
              ? GestureDetector(
                  onTap: () {
                    Get.toNamed(productListingScreen);
                  },
                  child: Text(
                    'See all'.tr,
                    style: kTextStyleSemiBold.copyWith(
                        fontSize: 16.sp, color: kColorMainTheme),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
