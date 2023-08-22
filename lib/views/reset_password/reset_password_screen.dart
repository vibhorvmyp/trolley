import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/controllers/reset_password/reset_password_controller.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
import '../../widgets/common/custom_simple_button.dart';
import '../../widgets/common/custom_text_field_with_icon_widget.dart';
import '../../widgets/dialogs/custom_dialog_simple.dart';
// import '../../routes/routes.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final resetPasswordController = Get.find<ResetPasswordController>();
  final resetPasswordFormKey = GlobalKey<FormState>();

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
                  key: resetPasswordFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 48.h,
                          ),
                          Text(
                            'Reset Password'.tr,
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
                                'Enter at least 6 characters with uppercase,\n lowercase letter'
                                    .tr,
                                textAlign: TextAlign.center,
                                style: kTextStyleRegular.copyWith(
                                  fontSize: 16.sp,
                                  color: kColorBlack2withOpacity75,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 48.h,
                          ),

                          //Text Fields
                          //Password
                          Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: CustomTextFieldWithIconWidget(
                              validator: (value) {
                                String passwordPattern =
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
                                RegExp passwordRegex = RegExp(passwordPattern);

                                if (!passwordRegex.hasMatch(value!)) {
                                  return "Please enter valid password";
                                } else {
                                  return null;
                                }
                              },
                              controller:
                                  resetPasswordController.newPasswordController,
                              iconImgUrl: 'assets/images/auth/password.png',
                              hintText: 'Enter a New Password'.tr,
                            ),
                          ),

                          SizedBox(
                            height: 36.h,
                          ),

                          //Confirm Password
                          Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: CustomTextFieldWithIconWidget(
                              validator: (value) {
                                if (value !=
                                        resetPasswordController
                                            .newPasswordController.text ||
                                    resetPasswordController
                                            .newConfirmPasswordController
                                            .text ==
                                        '') {
                                  return "Password and confirmation password do not match";
                                }
                                {
                                  return null;
                                }
                              },
                              controller: resetPasswordController
                                  .newConfirmPasswordController,
                              iconImgUrl:
                                  'assets/images/auth/confirm_password.png',
                              hintText: 'Confirm Password'.tr,
                            ),
                          ),

                          SizedBox(
                            height: 64.h,
                          ),

                          //Reset Button
                          GestureDetector(
                            onTap: () {
                              if (resetPasswordFormKey.currentState!
                                  .validate()) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CustomDialogCongratsSimple(
                                    dialogTitle: 'Congratulations'.tr,
                                    dialogDescription:
                                        'Your Password has been updated successfully'
                                            .tr,
                                    imgUrl:
                                        'assets/images/dialogs/congrats.png',
                                  ),
                                );
                                print('open congrats dialog');
                              } else {
                                log('not valid');
                              }
                              // Get.toNamed(bottomAppBarScreen);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 25.w, right: 25.w),
                              child: CustomSimpleButton(
                                buttonTitle: 'Reset'.tr,
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
