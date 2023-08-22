import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/routes/routes.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';
// import 'package:trolley/widgets/common/custom_bottom_button.dart';
// import 'package:trolley/widgets/common/custom_simple_button.dart';
import 'package:trolley/widgets/common/custom_bottom_button_with_icon_solid_color.dart';

import '../../widgets/enquiry_card_widget.dart';

class EnquiriesScreen extends StatelessWidget {
  const EnquiriesScreen({super.key});

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
                CustomAppBarWithBack(
                  title: 'Enquiries'.tr,
                ),

                //Got an issue title
                Container(
                  width: screenSize.width,
                  height: 80.h,
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
                  child: Row(
                    children: [
                      // Icon(Icons.media_bluetooth_off),
                      SizedBox(
                          height: 36.w,
                          width: 36.w,
                          child: Image.asset(
                              'assets/images/enquiries/issue_chat.png')),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Got Issues? Raise an enquiry'.tr,
                            style: kTextStyleBold.copyWith(
                                color: kColorBlack2, fontSize: 16.sp),
                          ),
                          Text(
                            'We try to provide the best customer service !'.tr,
                            style: kTextStyleRegular.copyWith(
                              fontSize: 10.sp,
                              color: kColorBlack2withOpacity75,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),

                      //All the Quiries
                      EnquiryCardWidget(
                        enquiryStatusColorBorderColor:
                            kColorOpenedEnquiryBlueOpacity25,
                        showDot: true,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      EnquiryCardWidget(
                        enquiryStatus: 'Resolved',
                        enquiryStatusColor: kColorResolvedEnquiryGreen,
                        enquiryStatusColorBorderColor:
                            kColorResolvedEnquiryGreenOpacity25,
                        enquiryStatusIconUrl:
                            'assets/images/enquiries/resolved_icon.png',
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      EnquiryCardWidget(
                        enquiryStatus: 'Resolved',
                        enquiryStatusColor: kColorResolvedEnquiryGreen,
                        enquiryStatusColorBorderColor:
                            kColorResolvedEnquiryGreenOpacity25,
                        enquiryStatusIconUrl:
                            'assets/images/enquiries/resolved_icon.png',
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      EnquiryCardWidget(
                        enquiryStatusColorBorderColor:
                            kColorOpenedEnquiryBlueOpacity25,
                        showDot: true,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      EnquiryCardWidget(
                        enquiryStatus: 'Resolved',
                        enquiryStatusColor: kColorResolvedEnquiryGreen,
                        enquiryStatusColorBorderColor:
                            kColorResolvedEnquiryGreenOpacity25,
                        enquiryStatusIconUrl:
                            'assets/images/enquiries/resolved_icon.png',
                      ),
                      SizedBox(
                        height: 85.h,
                      ),
                    ],
                  ),
                ))
              ],
            ),

            // Raise an Enquiry Button
            Positioned(
              bottom: 20.h,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(raiseEnquiryScreen);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: CustomBottomButtonWithIconSolidColor(
                    imgUrl: 'assets/images/enquiries/query_icon.png',
                    // imgUrl: 'assets/images/enquiries/query_icon.png',
                    buttonTitle: 'Raise an Enquiry'.tr,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
