import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';
import 'package:trolley/widgets/common/custom_bottom_button_with_icon_solid_color.dart';

import '../../widgets/dialogs/custom_dialog_simple.dart';

class RaiseEnquiryScreen extends StatelessWidget {
  const RaiseEnquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kColorWhite,
      body: SafeArea(
        child: Column(
          children: [
            //App BAr
            CustomAppBarWithBack(
              title: 'Raise an Enquiry'.tr,
            ),

            //Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Fill the below form to Raise an Enquiry'.tr,
                            style: kTextStyleRegular.copyWith(
                              fontSize: 14.sp,
                              color: kColorBlack2withOpacity75,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      width: screenSize.width,
                      margin: EdgeInsets.only(left: 25.w, right: 25.w),
                      padding: EdgeInsets.all(25.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.h),
                        border: Border.all(
                          color: kColorMainTheme.withOpacity(0.25),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Enquiry Form'.tr,
                            style: kTextStyleSemiBold.copyWith(
                              fontSize: 16.sp,
                              color: kColorBlack2,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Subject'.tr,
                                style: kTextStyleMedium.copyWith(
                                  fontSize: 14.sp,
                                  color: kColorBlack2,
                                ),
                              ),
                            ],
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: ' Enter a subject'.tr,
                              hintStyle: kTextStyleRegular.copyWith(
                                fontSize: 12.sp,
                                color: kColorBlack2withOpacity50,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kColorBlack2withOpacity25,
                                    width: 1.w),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kColorBlack2withOpacity25,
                                    width: 1.w),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Message'.tr,
                                style: kTextStyleMedium.copyWith(
                                  fontSize: 14.sp,
                                  color: kColorBlack2,
                                ),
                              ),
                            ],
                          ),
                          TextField(
                            maxLines: null,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 100.h),
                              hintText: ' Elaborate your subject here...'.tr,
                              hintStyle: kTextStyleRegular.copyWith(
                                fontSize: 12.sp,
                                color: kColorBlack2withOpacity50,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kColorBlack2withOpacity25,
                                    width: 1.w),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kColorBlack2withOpacity25,
                                    width: 1.w),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomDialogCongratsSimple(
                                  dialogTitle: 'Congratulations'.tr,
                                  dialogDescription:
                                      'Your Enquiry has been submitted successfully'
                                          .tr,
                                  imgUrl: 'assets/images/dialogs/congrats.png',
                                ),
                              );
                              print('open congrats dialog');
                            },
                            child: CustomBottomButtonWithIconSolidColor(
                              imgUrl:
                                  'assets/images/enquiries/submit_enquiry.png',
                              buttonTitle: 'Submit'.tr,
                            ),
                          ),
                        ],
                      ),
                    ),
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
