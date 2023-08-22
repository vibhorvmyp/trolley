import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/const_strings.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';

import '../../constants/textstyles.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorBg,
      body: SafeArea(
        child: Column(
          children: [
            //App bar
            CustomAppBarWithBack(
              title: 'About Us'.tr,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          height: 900.h,
                          color: kColorBg,
                          child: Image.asset('assets/images/about_us_bg.png'),
                        ),
                        Positioned(
                          top: 90.h,
                          child: Container(
                            color: Colors.transparent,
                            height: 800.h,
                            width: screenSize.width,
                            child: Column(
                              children: [
                                Container(
                                  width: screenSize.width,
                                  margin:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
                                  padding:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
                                  decoration: BoxDecoration(
                                    color: kColorWhite,
                                    borderRadius: BorderRadius.circular(16.h),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      Text(
                                        "What’s Special About us?".tr,
                                        style: kTextStyleBold.copyWith(
                                            fontSize: 16.sp,
                                            color: kColorMainTheme),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(
                                        aboutUsDetailsSample,
                                        style: kTextStyleRegular.copyWith(
                                          fontSize: 14.sp,
                                          color: kColorBlack2withOpacity75,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
