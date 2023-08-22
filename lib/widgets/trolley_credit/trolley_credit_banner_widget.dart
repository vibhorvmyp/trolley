import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class TrolleyCreditBannerWidget extends StatelessWidget {
  const TrolleyCreditBannerWidget({
    this.balance = '',
    this.date = '',
    super.key,
  });

  final String date;
  final String balance;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 25.w, right: 25.w),
          height: 119.h,
          // color: Colors.white,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 20.h,
                color: kColorMainTheme.withOpacity(0.25),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.h),
            child: SvgPicture.asset(
              'assets/images/trolley_credit_frame.svg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20.h, left: 25.w),
          margin: EdgeInsets.only(left: 25.w, right: 25.w),
          height: 119.h,
          width: screenSize.width,
          // color: Colors.red.withOpacity(0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Balance'.tr,
                style: kTextStyleSemiBold.copyWith(
                  color: const Color(0xFFF8F5EF),
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              RichText(
                text: TextSpan(
                  text: 'EGP ',
                  style: kTextStyleSemiBold.copyWith(
                    color: kColorWhite,
                    fontSize: 20.sp,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: balance,
                      style: kTextStyleBold.copyWith(
                        color: kColorWhite,
                        fontSize: 40.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 8.h,
          right: 33.w,
          child: Text(
            date,
            style: kTextStyleSemiBold.copyWith(
              color: kColorWhite,
              fontSize: 14.sp,
            ),
          ),
        )
      ],
    );
  }
}
