import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/routes/routes.dart';

import '../constants/colors.dart';
import '../constants/textstyles.dart';

class EnquiryCardWidget extends StatelessWidget {
  const EnquiryCardWidget({
    this.enquiryId = '#TROLL12345',
    this.subjectTitle = 'Wrong items delivered',
    this.raisedTime = '26th May 2023, 11:30 am',
    this.enquiryStatus = 'Opened',
    this.enquiryStatusIconUrl = 'assets/images/enquiries/opened_icon.png',
    this.enquiryStatusColor = kColorOpenedEnquiryBlue,
    this.enquiryStatusColorBorderColor = Colors.black,
    this.showDot = false,
    super.key,
  });

  final String enquiryId;
  final String enquiryStatus;
  final Color enquiryStatusColor;
  final Color enquiryStatusColorBorderColor;
  final String enquiryStatusIconUrl;
  final String subjectTitle;
  final String raisedTime;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.toNamed(enquiryChatScreen);
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 25.w, right: 25.w),
            padding: Get.locale!.languageCode == 'ar'
                ? EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h)
                : EdgeInsets.only(left: 15.w, top: 15.h),
            width: screenSize.width,
            decoration: BoxDecoration(
              color: kColorWhite,
              border: Border.all(color: enquiryStatusColorBorderColor),
              borderRadius: BorderRadius.circular(5.h),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      enquiryId,
                      // '#TROLL12345',
                      style: kTextStyleRegular.copyWith(
                          fontSize: 10.sp, color: kColorBlack2withOpacity75),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15.w),
                      child: Get.locale!.languageCode == 'ar'
                          ? Row(
                              children: [
                                Text(
                                  enquiryStatus,
                                  style: kTextStyleSemiBold.copyWith(
                                      fontSize: 12.sp,
                                      color: enquiryStatusColor),
                                ),

                                SizedBox(
                                  width: 5.w,
                                ),
                                // Icon(Icons.abc),
                                SizedBox(
                                  height: 16.h,
                                  width: 16.h,
                                  child: Image.asset(enquiryStatusIconUrl),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                // Icon(Icons.abc),
                                SizedBox(
                                  height: 16.h,
                                  width: 16.h,
                                  child: Image.asset(enquiryStatusIconUrl),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  enquiryStatus,
                                  style: kTextStyleSemiBold.copyWith(
                                      fontSize: 12.sp,
                                      color: enquiryStatusColor),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Subject : ',
                    style: kTextStyleMedium.copyWith(
                        color: kColorBlack2, fontSize: 16.sp),
                    children: <TextSpan>[
                      TextSpan(
                        text: subjectTitle,
                        style: kTextStyleMedium.copyWith(
                            color: kColorBlack2withOpacity75, fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                //Date , Rasied on
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Raised on $raisedTime',
                      style: kTextStyleRegular.copyWith(
                          fontSize: 10.sp, color: kColorBlack2withOpacity75),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15.w),
                      child: SizedBox(
                          height: 24.h,
                          width: 24.h,
                          child: Get.locale!.languageCode == 'ar'
                              ? Image.asset(
                                  'assets/images/enquiries/round_arrow_left.png')
                              : Image.asset(
                                  'assets/images/enquiries/round_arrow.png')),
                    )
                  ],
                ),

                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
          showDot != false
              ? Positioned(
                  top: 0,
                  right: 20.w,
                  child: Container(
                    width: 10.h,
                    height: 10.h,
                    decoration: const BoxDecoration(
                      color: kColorMainTheme, // Replace with your desired color
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
