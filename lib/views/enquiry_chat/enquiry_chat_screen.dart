import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
import '../../widgets/common/custom_app_bar_with_back.dart';

class EnquiryChatScreen extends StatelessWidget {
  const EnquiryChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kColorWhite,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //App bar
                Stack(
                  children: [
                    CustomAppBarWithBack(
                      title: 'Expert'.tr,
                    ),
                    Positioned(
                      child: Align(
                        alignment: Get.locale!.languageCode == 'ar'
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Container(
                          margin: Get.locale!.languageCode == 'ar'
                              ? EdgeInsets.only(top: 22.h, left: 25.w)
                              : EdgeInsets.only(top: 22.h, right: 25.w),
                          height: 24.h,
                          width: 24.h,
                          child:
                              Image.asset('assets/images/enquiries/menu.png'),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  width: screenSize.width,
                  // height: 80.h,
                  decoration: BoxDecoration(
                    color: kColorWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        offset: const Offset(0, 3), // Vertical shadow offset
                        blurRadius: 2, // Shadow blur radius
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '#TROLL12345',
                            style: kTextStyleRegular.copyWith(
                                color: kColorBlack2withOpacity75,
                                fontSize: 10.sp),
                          ),
                          Get.locale!.languageCode == 'ar'
                              ? Row(
                                  children: [
                                    Text(
                                      'Opened',
                                      style: kTextStyleSemiBold.copyWith(
                                          color: const Color(0xFF1E91CF),
                                          fontSize: 12.sp),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                      width: 16.h,
                                      child: Image.asset(
                                          'assets/images/enquiries/opened_icon.png'),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    SizedBox(
                                      height: 16.h,
                                      width: 16.h,
                                      child: Image.asset(
                                          'assets/images/enquiries/opened_icon.png'),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      'Opened',
                                      style: kTextStyleSemiBold.copyWith(
                                          color: const Color(0xFF1E91CF),
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Subject'.tr,
                            style: kTextStyleSemiBold.copyWith(
                                color: kColorBlack2, fontSize: 16.sp),
                          ),
                          Text(
                            ' : ',
                            style: kTextStyleSemiBold.copyWith(
                                color: kColorBlack2, fontSize: 16.sp),
                          ),
                          Text(
                            'Wrong items delivered',
                            style: kTextStyleSemiBold.copyWith(
                                color: kColorBlack2, fontSize: 16.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Discuss your issue here with our expert!'.tr,
                        style: kTextStyleRegular.copyWith(
                            color: kColorBlack2withOpacity75, fontSize: 10.sp),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),

                //Chat goes here
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: screenSize.width,
                          // color: Colors.amber,
                          margin: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50.h,
                              ),
                              const ChatDayTagWidget(
                                dayTitle: '28/07/2023',
                              ),
                              SizedBox(
                                height: 36.h,
                              ),

                              //Customer Support Text with Icon
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Customer support logo
                                  const CustomerSupportIconWidget(),
                                  const CustomerSupportTextWidget(),

                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  const CustomerSupportTextWidget(),
                                ],
                              ),

                              SizedBox(
                                height: 16.h,
                              ),

                              //User chat
                              const UserTextWidget(),

                              //Time of Text (Right Aligned)
                              const TimeTagRightAlignedWidget(),

                              SizedBox(
                                height: 36.h,
                              ),
                              const ChatDayTagWidget(
                                dayTitle: '28/07/2023',
                              ),
                              SizedBox(
                                height: 36.h,
                              ),

                              //Customer support logo
                              const CustomerSupportIconWidget(),
                              const CustomerSupportTextWidget(),

                              SizedBox(
                                height: 8.h,
                              ),
                              const CustomerSupportTextWidget(),
                              //Time of Text (left Aligned)
                              const TimeTagLeftAlignedWidget(),

                              SizedBox(
                                height: 16.h,
                              ),

                              const UserTextWidget(),
                              //Time of Text (Right Aligned)
                              const TimeTagRightAlignedWidget(),

                              SizedBox(
                                height: 8.h,
                              ),
                              const UserTextWidget(),
                              //Time of Text (Right Aligned)
                              const TimeTagRightAlignedWidget(),

                              SizedBox(
                                height: 8.h,
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              const ChatDayTagWidget(
                                dayTitle: 'YESTERDAY',
                              ),
                              SizedBox(
                                height: 36.h,
                              ),

                              //Customer Support Text with Icon
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Customer support logo
                                  const CustomerSupportIconWidget(),
                                  const CustomerSupportTextWidget(),

                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  const CustomerSupportTextWidget(),
                                ],
                              ),

                              SizedBox(
                                height: 16.h,
                              ),

                              //User chat
                              const UserTextWidget(),

                              //Time of Text (Right Aligned)
                              const TimeTagRightAlignedWidget(),

                              SizedBox(
                                height: 36.h,
                              ),
                              const ChatDayTagWidget(
                                dayTitle: 'TODAY',
                              ),
                              SizedBox(
                                height: 36.h,
                              ),

                              //Customer support logo
                              const CustomerSupportIconWidget(),
                              const CustomerSupportTextWidget(),

                              SizedBox(
                                height: 8.h,
                              ),
                              const CustomerSupportTextWidget(),
                              //Time of Text (left Aligned)
                              const TimeTagLeftAlignedWidget(),

                              SizedBox(
                                height: 16.h,
                              ),

                              const UserTextWidget(),
                              //Time of Text (Right Aligned)
                              const TimeTagRightAlignedWidget(),

                              SizedBox(
                                height: 8.h,
                              ),
                              const UserTextWidget(),
                              //Time of Text (Right Aligned)
                              const TimeTagRightAlignedWidget(),

                              //End Chat
                              SizedBox(
                                height: 95.h,
                              ),

                              //
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //Bottom Send Text Bar
            Positioned(
              bottom: 0,
              child: Container(
                width: screenSize.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(
                  left: 25.w,
                  right: 25.w,
                  top: 15.h,
                  bottom: 15.h,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 24.h,
                      width: 24.h,
                      child:
                          Image.asset('assets/images/enquiries/add_image.png'),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Flexible(
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(24.h),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: 8.h, left: 12, right: 12, top: 5.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Type your issue here...'.tr,
                                    hintStyle: kTextStyleRegular.copyWith(
                                      fontSize: 12.sp,
                                      color: kColorBlack2withOpacity50,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 24.h,
                                width: 24.h,
                                child: Image.asset(
                                    'assets/images/enquiries/send_text.png'),
                              ), // Replace 'your_icon' with the desired icon
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatDayTagWidget extends StatelessWidget {
  const ChatDayTagWidget({
    this.dayTitle = '',
    super.key,
  });

  final String dayTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      dayTitle,
      style: kTextStyleMedium.copyWith(
          color: const Color(0xFFAFAFAF), fontSize: 12.sp),
    );
  }
}

class TimeTagRightAlignedWidget extends StatelessWidget {
  const TimeTagRightAlignedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        child: Text(
          '5:30 PM',
          style: kTextStyleRegular.copyWith(
            fontSize: 10.sp,
            color: kColorBlack2withOpacity50,
          ),
        ),
      ),
    );
  }
}

class TimeTagLeftAlignedWidget extends StatelessWidget {
  const TimeTagLeftAlignedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 30.w),
        child: Text(
          '5:30 PM',
          style: kTextStyleRegular.copyWith(
            fontSize: 10.sp,
            color: kColorBlack2withOpacity50,
          ),
        ),
      ),
    );
  }
}

class CustomerSupportIconWidget extends StatelessWidget {
  const CustomerSupportIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        // color: Colors.red,
        height: 28.h,
        width: 28.h,
        child: Image.asset(
          'assets/images/enquiries/customer_support.png',
        ),
      ),
    );
  }
}

class UserTextWidget extends StatelessWidget {
  const UserTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(left: 30.w),
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: kColorMainTheme.withOpacity(0.25),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.h),
            bottomRight: Radius.circular(16.h),
            bottomLeft: Radius.circular(16.h),
          ),
        ),
        child: Text(
          'Lorem ipsum dolor sit amet consectetur.',
          style: kTextStyleRegular.copyWith(
            fontSize: 12.sp,
            color: kColorBlack2,
          ),
        ),
      ),
    );
  }
}

class CustomerSupportTextWidget extends StatelessWidget {
  const CustomerSupportTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 30.w),
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: const Color(0xFFECECEC),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.h),
            bottomRight: Radius.circular(16.h),
            bottomLeft: Radius.circular(16.h),
          ),
        ),
        child: Text(
          'Lorem ipsum dolor sit amet consectetur.',
          style: kTextStyleRegular.copyWith(
            fontSize: 12.sp,
            color: kColorBlack2,
          ),
        ),
      ),
    );
  }
}
