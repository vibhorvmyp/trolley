import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class NewsletterWidget extends StatelessWidget {
  const NewsletterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 25.w,
            right: 25.w,
          ),
          // padding: EdgeInsets.only(bottom: 25),
          height: 346.h,
          width: screenSize.width,
          decoration: BoxDecoration(
            color: kColorWhite,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                color: kColorMainTheme.withOpacity(0.15),
                blurRadius: 20,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 15.w,
                  top: 12.h,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 24.h,
                      width: 24.h,
                      child: Image.asset(
                          'assets/images/home/newsletter_mailbox.png'),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Newsletter'.tr,
                      style: kTextStyleMedium.copyWith(
                        fontSize: 20.sp,
                        color: kColorBlack2,
                      ),
                    ),
                  ],
                ),
              ),

              //Height 15
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 93.h,
                width: 110.w,
                child: Image.asset('assets/images/home/newsletter.png'),
              ),
              //Height 15
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Stay Updated!'.tr,
                style: kTextStyleSemiBold.copyWith(
                    fontSize: 20.sp, color: kColorBlack2),
              ),
              Text(
                'Subscribe to our newsletter to receive insights directly in your inbox'
                    .tr,
                textAlign: TextAlign.center,
                style: kTextStyleRegular.copyWith(
                    fontSize: 14.sp, color: kColorBlack2withOpacity75),
              ),

              //Height 35
              SizedBox(
                height: 35.h,
              ),

              //Enter your email
              Container(
                margin: EdgeInsets.only(
                  left: 25.w,
                  right: 25.w,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email'.tr,
                    hintStyle: kTextStyleRegular.copyWith(
                        fontSize: 14.h, color: kColorBlack2withOpacity50),
                    border: InputBorder.none,
                    suffixIcon: Container(
                      padding: EdgeInsets.only(top: 5.h, bottom: 5),
                      height: 32.h,
                      width: 32.h,
                      child: Image.asset(
                          'assets/images/home/newsletter_email.png'),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0.h,
          left: 25.w,
          child: Container(
            height: 10.h,
            width: 10.h,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: kColorMainTheme, width: 1.w),
                left: BorderSide(color: kColorMainTheme, width: 1.w),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0.h,
          right: 25.w,
          child: Container(
            height: 10.h,
            width: 10.h,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: kColorMainTheme, width: 1.w),
                right: BorderSide(color: kColorMainTheme, width: 1.w),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 25.w,
          child: Container(
            height: 10.h,
            width: 10.h,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: kColorMainTheme, width: 1.w),
                left: BorderSide(color: kColorMainTheme, width: 1.w),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 25.w,
          child: Container(
            height: 10.h,
            width: 10.h,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: kColorMainTheme, width: 1.w),
                right: BorderSide(color: kColorMainTheme, width: 1.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
