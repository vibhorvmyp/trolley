import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';
import 'package:trolley/widgets/common/custom_bottom_button_with_icon_solid_color.dart';

import '../../controllers/contact_us/contact_us_controller.dart';
import '../../widgets/common/custom_text_field_with_icon_widget.dart';
import '../../widgets/common/custom_textfield_with_icon_prefix_widget.dart';
import '../../widgets/contact_us/contact_us_bottom_icon_widget.dart';
import '../../widgets/dialogs/custom_dialog_simple.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final contactUsController = Get.find<ContactUsController>();
  final contactUsFormKey = GlobalKey<FormState>();

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
              title: 'Contact us'.tr,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: screenSize.width,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Stack(
                        children: [
                          Container(
                              alignment: Alignment.topCenter,
                              height: 900.h,
                              color: kColorBg,
                              child: Image.asset(
                                  'assets/images/contact_us/contact_us_bg.png')),
                          Positioned(
                            top: 90.h,
                            child: Container(
                              color: Colors.transparent,
                              height: 800.h,
                              width: screenSize.width,
                              child: Form(
                                key: contactUsFormKey,
                                child: Column(
                                  children: [
                                    //Contact Form Card
                                    Container(
                                      width: screenSize.width,
                                      margin: EdgeInsets.only(
                                          left: 25.w, right: 25.w),
                                      padding: EdgeInsets.only(
                                          left: 25.w, right: 25.w),
                                      decoration: BoxDecoration(
                                        color: kColorWhite,
                                        borderRadius:
                                            BorderRadius.circular(16.h),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 35.h,
                                          ),
                                          Text(
                                            'Contact form'.tr,
                                            style: kTextStyleMedium.copyWith(
                                                fontSize: 20.sp,
                                                color: kColorBlack2),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            'We will try to get back to you as soon as we can!'
                                                .tr,
                                            style: kTextStyleRegular.copyWith(
                                              fontSize: 13.sp,
                                              color: kColorBlack2withOpacity50,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30.h,
                                          ),

                                          //Full Name
                                          CustomTextFieldWithIconWidget(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter valid name';
                                              }
                                              return null;
                                            },
                                            controller: contactUsController
                                                .fullNameController,
                                            iconImgUrl:
                                                'assets/images/auth/first_name.png',
                                            hintText: 'Enter your Full Name'.tr,
                                          ),

                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          //Email
                                          CustomTextFieldWithIconWidget(
                                            validator: (value) {
                                              if (!GetUtils.isEmail(value!)) {
                                                return "Please enter valid email";
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: contactUsController
                                                .emailController,
                                            iconImgUrl:
                                                'assets/images/auth/email.png',
                                            hintText: 'Enter your Email'.tr,
                                          ),

                                          SizedBox(
                                            height: 20.h,
                                          ),

                                          //Mobile Number TextField
                                          CustomTextFieldWithIconAndPrefixTextWidget(
                                            isPhoneNumberFieldFlag: true,
                                            validator: (value) {
                                              if (value!.length < 10) {
                                                return 'Please enter valid mobile number';
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: contactUsController
                                                .phoneNumberController,
                                            hintText:
                                                'Enter your Mobile number'.tr,
                                            iconImgUrl:
                                                'assets/images/phone.png',
                                            prefixText: "+246 | ",
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),

                                          //Brief Your reason
                                          CustomTextFieldWithIconWidget(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please brief your reason';
                                              }
                                              return null;
                                            },
                                            controller: contactUsController
                                                .briefYourReasonController,
                                            iconImgUrl:
                                                'assets/images/contact_us/brief.png',
                                            hintText: 'Brief your reason...'.tr,
                                          ),

                                          SizedBox(
                                            height: 40.h,
                                          ),

                                          //Submit Button
                                          GestureDetector(
                                            onTap: () {
                                              if (contactUsFormKey.currentState!
                                                  .validate()) {
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext
                                                          context) =>
                                                      CustomDialogCongratsSimple(
                                                    dialogTitle:
                                                        'Congratulations'.tr,
                                                    dialogDescription:
                                                        'Your Enquiry has been submitted successfully'
                                                            .tr,
                                                    imgUrl:
                                                        'assets/images/dialogs/congrats.png',
                                                  ),
                                                );
                                                print('open congrats dialog');
                                                // Get.toNamed(bottomAppBarScreen);
                                              } else {
                                                log('not valid');
                                              }

                                              // Get.toNamed(bottomAppBarScreen);
                                            },
                                            child:
                                                CustomBottomButtonWithIconSolidColor(
                                              imgUrl:
                                                  'assets/images/contact_us/submit.png',
                                              buttonTitle: 'Submit'.tr,
                                            ),
                                          ),

                                          SizedBox(
                                            height: 35.h,
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height: 25.h,
                                    ),

                                    //Other Contacts Card
                                    Container(
                                      width: screenSize.width,
                                      margin: EdgeInsets.only(
                                          left: 25.w, right: 25.w),
                                      padding: EdgeInsets.only(
                                          left: 20.w, right: 20.w),
                                      decoration: BoxDecoration(
                                          color: kColorWhite,
                                          borderRadius:
                                              BorderRadius.circular(16.h)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Text(
                                            'Other Contacts'.tr,
                                            style: kTextStyleMedium.copyWith(
                                                fontSize: 20.sp,
                                                color: kColorBlack2),
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Container(
                                            width: screenSize.width,
                                            padding: EdgeInsets.only(
                                                left: 20.w, right: 20.w),
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ContactUsBottomIconWidget(
                                                  imgUrl:
                                                      'assets/images/contact_us/letter.png',
                                                ),
                                                ContactUsBottomIconWidget(
                                                  imgUrl:
                                                      'assets/images/contact_us/phone.png',
                                                ),
                                                ContactUsBottomIconWidget(
                                                  imgUrl:
                                                      'assets/images/contact_us/streets.png',
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30.h,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
