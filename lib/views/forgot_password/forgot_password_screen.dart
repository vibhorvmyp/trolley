import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/controllers/forgot_password/forgot_password_controller.dart';
import 'package:trolley/routes/routes.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
import '../../widgets/common/custom_simple_button.dart';
import '../../widgets/common/custom_textfield_with_icon_prefix_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final forgotPasswordController = Get.find<ForgotPasswordController>();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              // height: 1000,
              color: Colors.white,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/images/artwork_bg.png',
                ),
              ),
            ),

            //Back button
            Positioned(
              // top: 10,
              // bottom: 20,
              child: Container(
                // color: Colors.red,
                margin: Get.locale!.languageCode == 'ar'
                    ? EdgeInsets.only(right: 25.w, top: 25.h)
                    : EdgeInsets.only(left: 25.w, top: 25.h),
                height: 24.h,
                width: 24.h,
                child: Get.locale!.languageCode == 'ar'
                    ? Image.asset('assets/images/arrow_right.png')
                    : Image.asset('assets/images/arrow_left.png'),
              ),
            ),
            Positioned(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 60.h,
                  width: 60.h,
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  // color: Colors.red,
                  width: 200.w,
                  height: 230.h,
                  margin: EdgeInsets.only(top: 30.h),
                  child: Image.asset(
                    'assets/images/trolley_logo.png',
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3.6,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48.h),
                    topRight: Radius.circular(48.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Form(
                  key: forgotPasswordFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 48.h,
                          ),
                          Text(
                            'Forgot Password'.tr,
                            style: kTextStyleSemiBold.copyWith(
                              fontSize: 24.sp,
                              color: kColorBlack,
                            ),
                          ),

                          SizedBox(
                            height: 8.h,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Enter your mobile number to receive OTP'.tr,
                                style: kTextStyleRegular.copyWith(
                                    fontSize: 16.sp,
                                    color: kColorBlack2withOpacity75),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 48.h,
                          ),

                          //Mobile Number TextField
                          Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: CustomTextFieldWithIconAndPrefixTextWidget(
                              isPhoneNumberFieldFlag: true,
                              validator: (value) {
                                if (value!.length < 10) {
                                  return 'Please enter valid mobile number';
                                } else {
                                  return null;
                                }
                              },
                              controller: forgotPasswordController
                                  .phoneNumberController,
                              hintText: 'Enter your Mobile number'.tr,
                              iconImgUrl: 'assets/images/phone.png',
                              prefixText: "+246 | ",
                            ),
                          ),

                          SizedBox(
                            height: 64.h,
                          ),

                          //Register Button
                          GestureDetector(
                            onTap: () {
                              if (forgotPasswordFormKey.currentState!
                                  .validate()) {
                                Get.toNamed(otpVerificationScreen);
                              } else {
                                log('not valid');
                              }
                              // Get.toNamed(bottomAppBarScreen);
                              // Get.toNamed(otpVerificationScreen);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 25.w, right: 25.w),
                              child: CustomSimpleButton(
                                buttonTitle: 'Send'.tr,
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
