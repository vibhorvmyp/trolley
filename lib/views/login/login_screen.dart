import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
import '../../controllers/login/login_controller.dart';
import '../../routes/routes.dart';
import '../../widgets/common/custom_simple_button.dart';
import '../../widgets/common/custom_text_field_with_icon_widget.dart';
import '../../widgets/common/custom_textfield_with_icon_prefix_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.find<LoginController>();
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Stack(
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
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: Get.locale!.languageCode == 'ar'
                              ? EdgeInsets.only(
                                  top: 25.h,
                                  left: 25.w,
                                )
                              : EdgeInsets.only(
                                  top: 25.h,
                                  right: 25.w,
                                ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 28.h,
                                width: 28.w,
                                child: Image.asset(
                                    'assets/images/home/translation_icon.png'),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "EN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      color: kColorBlack2withOpacity75,
                                      offset: const Offset(0, -5),
                                    )
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: kColorBlack2withOpacity75,
                                  decorationThickness: 2.h,
                                  fontSize: 14.h,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
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
                    key: loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 48.h,
                            ),
                            Text(
                              'Login'.tr,
                              style: kTextStyleSemiBold.copyWith(
                                fontSize: 24.sp,
                                color: kColorBlack,
                              ),
                            ),

                            SizedBox(
                              height: 48.h,
                            ),

                            //Login fields
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
                                controller:
                                    loginController.phoneNumberController,
                                hintText: 'Enter your Mobile number'.tr,
                                iconImgUrl: 'assets/images/phone.png',
                                prefixText: "+246 | ",
                              ),
                            ),
                            SizedBox(
                              height: 36.h,
                            ),

                            //Confirm Password
                            Stack(
                              children: [
                                Container(
                                  // color: Colors.red,
                                  margin:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
                                  child: CustomTextFieldWithIconWidget(
                                    validator: (value) {
                                      String passwordPattern =
                                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
                                      RegExp passwordRegex =
                                          RegExp(passwordPattern);

                                      if (!passwordRegex.hasMatch(value!)) {
                                        return "Please enter valid password";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller:
                                        loginController.passwordController,
                                    iconImgUrl:
                                        'assets/images/auth/confirm_password.png',
                                    hintText: 'Enter Password'.tr,
                                    obscureText: loginController
                                        .loginPasswordObscureTextFlag.value,
                                  ),
                                ),
                                Get.locale!.languageCode == 'ar'
                                    ? Positioned(
                                        left: 32.w,
                                        top: 0,
                                        bottom: 0,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              if (loginController
                                                      .loginPasswordObscureTextFlag
                                                      .value ==
                                                  false) {
                                                loginController
                                                    .loginPasswordObscureTextFlag
                                                    .value = true;
                                              } else {
                                                loginController
                                                    .loginPasswordObscureTextFlag
                                                    .value = false;
                                              }
                                            },
                                            child: Container(
                                              height: 24.h,
                                              width: 24.h,
                                              // margin: EdgeInsets.only(right: 25.w),
                                              child: loginController
                                                          .loginPasswordObscureTextFlag
                                                          .value ==
                                                      false
                                                  ? Image.asset(
                                                      'assets/images/auth/opened_eye.png',
                                                    )
                                                  : Image.asset(
                                                      'assets/images/auth/closed_eye.png',
                                                    ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Positioned(
                                        right: 32.w,
                                        top: 0,
                                        bottom: 0,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              if (loginController
                                                      .loginPasswordObscureTextFlag
                                                      .value ==
                                                  false) {
                                                loginController
                                                    .loginPasswordObscureTextFlag
                                                    .value = true;
                                              } else {
                                                loginController
                                                    .loginPasswordObscureTextFlag
                                                    .value = false;
                                              }
                                            },
                                            child: Container(
                                              height: 24.h,
                                              width: 24.h,
                                              // margin: EdgeInsets.only(right: 25.w),
                                              child: loginController
                                                          .loginPasswordObscureTextFlag
                                                          .value ==
                                                      false
                                                  ? Image.asset(
                                                      'assets/images/auth/opened_eye.png',
                                                    )
                                                  : Image.asset(
                                                      'assets/images/auth/closed_eye.png',
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),

                            SizedBox(
                              height: 24.h,
                            ),

                            //Forgot Password
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(forgotPasswordScreen);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 25.w),
                                alignment: Alignment.centerRight,
                                width: MediaQuery.of(context).size.width,
                                // color: Colors.grey,
                                child: Text(
                                  'Forgot Password?'.tr,
                                  style: kTextStyleSemiBold.copyWith(
                                    fontSize: 16.sp,
                                    color: kColorMainTheme,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 54.h,
                            ),

                            //Login Button
                            GestureDetector(
                              onTap: () {
                                if (loginFormKey.currentState!.validate()) {
                                  Get.toNamed(bottomAppBarScreen);
                                } else {
                                  log('not valid');
                                }
                                // Get.toNamed(bottomAppBarScreen);
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: 25.w, right: 25.w),
                                child: CustomSimpleButton(
                                  buttonTitle: 'Login'.tr,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 24.h,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Do not have an account? '.tr,
                                  style: kTextStyleRegular.copyWith(
                                      fontSize: 16.sp,
                                      color: kColorBlack2withOpacity75),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(registerScreen);
                                  },
                                  child: Text(
                                    'Register'.tr,
                                    style: kTextStyleSemiBold.copyWith(
                                        decoration: TextDecoration.underline,
                                        decorationColor: kColorMainTheme,
                                        color: kColorMainTheme,
                                        fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 83.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(bottomAppBarScreen);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 36.h, right: 25.w),
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Skip'.tr,
                              style: kTextStyleRegular.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: kColorBlack,
                                  color: kColorBlack,
                                  fontSize: 16.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
