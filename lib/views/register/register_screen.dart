import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trolley/routes/routes.dart';
import 'package:trolley/widgets/common/custom_simple_button.dart';
import 'package:trolley/widgets/common/custom_text_field_with_icon_widget.dart';
import 'package:trolley/widgets/common/custom_textfield_full_width_widget.dart';
// import 'package:trolley/views/profile/profile_screen.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
import '../../controllers/register/register_controller.dart';
import '../../widgets/common/custom_bottom_button_with_icon_solid_color.dart';
import '../../widgets/common/custom_textfield_with_icon_prefix_widget.dart';
// import '../sub_categories/sub_categories_screen.dart';

enum GenderOption {
  male,
  female,
  others,
}

enum SocialStatusOption {
  single,
  married,
}

enum JobTypeOption {
  webdeveloper,
  freelancer,
  designer,
  accountant,
  management,
}

// GenderOption _genderOption = GenderOption.male;

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final registerController = Get.find<RegisterController>();
  final registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color: Colors.pink,
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
                  ],
                ),
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
                  key: registerFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 48.h,
                          ),
                          Text(
                            'Register'.tr,
                            style: kTextStyleSemiBold.copyWith(
                              fontSize: 24.sp,
                              color: kColorBlack,
                            ),
                          ),

                          SizedBox(
                            height: 48.h,
                          ),

                          //Register fields

                          //First Name, Last Name
                          Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomTextFieldWithIconWidget(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter valid name';
                                      }
                                      return null;
                                    },
                                    controller:
                                        registerController.firstNameController,
                                    iconImgUrl:
                                        'assets/images/auth/first_name.png',
                                    hintText: 'First Name'.tr,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: CustomTextFieldFullWidthWidget(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter valid name';
                                      }
                                      return null;
                                    },
                                    controller:
                                        registerController.lastNameController,
                                    hintText: 'Last Name'.tr,
                                    hintTextStyle: kTextStyleRegular.copyWith(
                                      fontSize: 16.sp,
                                      color: kColorBlack2withOpacity75,
                                    ),
                                    enabledBorderColor:
                                        kColorBlack2withOpacity25,
                                    focusedBorderColor:
                                        kColorBlack2withOpacity25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 36.h,
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
                              controller:
                                  registerController.phoneNumberController,
                              hintText: 'Enter your Mobile number'.tr,
                              iconImgUrl: 'assets/images/phone.png',
                              prefixText: "+246 | ",
                            ),
                          ),
                          SizedBox(
                            height: 36.h,
                          ),

                          //Email
                          Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: CustomTextFieldWithIconWidget(
                              validator: (value) {
                                if (!GetUtils.isEmail(value!)) {
                                  return "Please enter valid email";
                                } else {
                                  return null;
                                }
                              },
                              controller: registerController.emailController,
                              iconImgUrl: 'assets/images/auth/email.png',
                              hintText: 'Enter your Email'.tr,
                            ),
                          ),

                          SizedBox(
                            height: 36.h,
                          ),

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
                              controller: registerController.passwordController,
                              iconImgUrl: 'assets/images/auth/password.png',
                              hintText: 'Enter a Strong Password'.tr,
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
                                        registerController
                                            .passwordController.text ||
                                    registerController
                                            .confirmPasswordController.text ==
                                        '') {
                                  return "Password and confirmation password do not match";
                                }
                                {
                                  return null;
                                }
                              },
                              controller:
                                  registerController.confirmPasswordController,
                              iconImgUrl:
                                  'assets/images/auth/confirm_password.png',
                              hintText: 'Confirm Password'.tr,
                            ),
                          ),

                          SizedBox(
                            height: 36.h,
                          ),

                          //Gender, SocialStatus
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Gender
                              SizedBox(
                                width: 25.w,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7.h),
                                // color: Colors.blue,
                                // height: 40,
                                width: 24.w,
                                child: Image.asset(
                                    'assets/images/auth/social_status.png'),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),

                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    print('Container tapped');
                                    _openGenderSelectBottomSheet(context);
                                  },
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      Container(
                                        child: TextField(
                                          enabled:
                                              false, // Make the TextField disabled
                                          decoration: InputDecoration(
                                            hintText: 'Select Gender'.tr,
                                            hintStyle:
                                                kTextStyleRegular.copyWith(
                                              fontSize: 16.sp,
                                              color: kColorBlack2withOpacity75,
                                            ),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    kColorBlack2withOpacity25,
                                              ),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    kColorBlack2withOpacity25,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    kColorBlack2withOpacity25,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Dropdown Arrow
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 2.h, top: 2.h),
                                        child: Align(
                                          alignment:
                                              Get.locale!.languageCode == 'ar'
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                          child: SizedBox(
                                            height: 16.h,
                                            width: 16,
                                            child: Image.asset(
                                              'assets/images/auth/dropdown_arrow.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: 38.w,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7.h),
                                // color: Colors.blue,
                                // height: 40,
                                width: 24.w,
                                child: Image.asset(
                                    'assets/images/auth/social_status.png'),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    print('Container tapped');
                                    _openSocialStatusBottomSheet(context);
                                  },
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      Container(
                                        child: TextField(
                                          enabled:
                                              false, // Make the TextField disabled
                                          decoration: InputDecoration(
                                            hintText: 'Social Status'.tr,
                                            hintStyle:
                                                kTextStyleRegular.copyWith(
                                              fontSize: 16.sp,
                                              color: kColorBlack2withOpacity75,
                                            ),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    kColorBlack2withOpacity25,
                                              ),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    kColorBlack2withOpacity25,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    kColorBlack2withOpacity25,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Dropdown Arrow
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 2.h, top: 2.h),
                                        child: Align(
                                          alignment:
                                              Get.locale!.languageCode == 'ar'
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                          child: SizedBox(
                                            height: 16.h,
                                            width: 16.h,
                                            child: Image.asset(
                                              'assets/images/auth/dropdown_arrow.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 36.h,
                          ),

                          //Job Type
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 25.w,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7.h),
                                // color: Colors.blue,
                                // height: 40,
                                width: 24.w,
                                child:
                                    Image.asset('assets/images/auth/job.png'),
                              ),
                              SizedBox(
                                width: 25.w,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    print('Container tapped');
                                    _openJobTypeSelectBottomSheet(context);
                                  },
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      Container(
                                        child: TextField(
                                          enabled:
                                              false, // Make the TextField disabled
                                          decoration: InputDecoration(
                                            hintText: 'Job Type'.tr,
                                            hintStyle:
                                                kTextStyleRegular.copyWith(
                                              fontSize: 16.sp,
                                              color: kColorBlack2withOpacity75,
                                            ),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    kColorBlack2withOpacity25,
                                              ),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    kColorBlack2withOpacity25,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    kColorBlack2withOpacity25,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Dropdown Arrow
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 2.h, top: 2.h),
                                        child: Align(
                                          alignment:
                                              Get.locale!.languageCode == 'ar'
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                          child: SizedBox(
                                            height: 16.h,
                                            width: 16.h,
                                            child: Image.asset(
                                              'assets/images/auth/dropdown_arrow.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 36.h,
                          ),

                          //Area Name, City Name
                          Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // const SizedBox(
                                //   width: 20,
                                // ),
                                Expanded(
                                  child: CustomTextFieldWithIconWidget(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter area name';
                                      }
                                      return null;
                                    },
                                    controller:
                                        registerController.areaController,
                                    iconImgUrl: 'assets/images/auth/area.png',
                                    hintText: 'Enter your Area'.tr,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: CustomTextFieldFullWidthWidget(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter city name';
                                      }
                                      return null;
                                    },
                                    controller:
                                        registerController.cityController,
                                    hintText: 'Enter your City'.tr,
                                    hintTextStyle: kTextStyleRegular.copyWith(
                                      fontSize: 16.sp,
                                      color: kColorBlack2withOpacity75,
                                    ),
                                    enabledBorderColor:
                                        kColorBlack2withOpacity25,
                                    focusedBorderColor:
                                        kColorBlack2withOpacity25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 36,
                          ),

                          //T&C Privacy Policy
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 25.w),
                            alignment: Alignment.centerLeft,
                            width: screenSize,
                            child: RichText(
                              text: TextSpan(
                                text: 'By signing up you agree to our '.tr,
                                style: kTextStyleRegular.copyWith(
                                    fontSize: 12.sp, color: kColorBlack2),
                                // style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Terms & Conditions'.tr,
                                    style: kTextStyleMedium.copyWith(
                                        decoration: TextDecoration.underline,
                                        fontSize: 12.sp,
                                        color: kColorBlack2),
                                  ),
                                  TextSpan(
                                    text: ' and '.tr,
                                    style: kTextStyleRegular.copyWith(
                                        fontSize: 12.sp, color: kColorBlack2),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy'.tr,
                                    style: kTextStyleMedium.copyWith(
                                        decoration: TextDecoration.underline,
                                        decorationColor: kColorBlack2,
                                        fontSize: 12.sp,
                                        color: kColorBlack2),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 80.h,
                          ),

                          //Register Button
                          GestureDetector(
                            onTap: () {
                              if (registerFormKey.currentState!.validate()) {
                                Get.toNamed(bottomAppBarScreen);
                              } else {
                                log('not valid');
                              }

                              // Get.toNamed(bottomAppBarScreen);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 25.w, right: 25.w),
                              child: CustomSimpleButton(
                                buttonTitle: 'Sign Up'.tr,
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
                                'Already have an account? '.tr,
                                style: kTextStyleRegular.copyWith(
                                    fontSize: 16.sp,
                                    color: kColorBlack2withOpacity75),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(loginScreen);
                                },
                                child: Text(
                                  'Login'.tr,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openSocialStatusBottomSheet(BuildContext context) {
    SocialStatusOption _socialStatusOption = SocialStatusOption.single;

    // String selectedFilterType = 'Sort';

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kColorTransparent, // Make the background transparent
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          socialStatusSelect(SocialStatusOption? value) {
            setState(() {
              _socialStatusOption = value!;
            });
          }

          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Stack(
              children: [
                Container(
                  height: 320.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.h),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 300.h,
                          decoration: const BoxDecoration(
                            color: kColorWhite,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 48.h,
                              ),
                              Container(
                                margin: Get.locale!.languageCode == 'ar'
                                    ? EdgeInsets.only(right: 25.w)
                                    : EdgeInsets.only(left: 25.w),
                                child: Text(
                                  'Select Social Status'.tr,
                                  style: kTextStyleSemiBold.copyWith(
                                    fontSize: 20.sp,
                                    color: kColorBlack2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),

                              //Sort Radio Buttons
                              GestureDetector(
                                onTap: () {
                                  socialStatusSelect(SocialStatusOption.single);
                                },
                                child: Container(
                                  height: 38.h,
                                  padding: EdgeInsets.only(left: 8.w),
                                  decoration: BoxDecoration(
                                    color: kColorTransparent,
                                    border: Border(
                                      left: BorderSide(
                                        //                   <--- left side
                                        color: _socialStatusOption ==
                                                SocialStatusOption.single
                                            ? kColorMainTheme
                                            : kColorTransparent,
                                        width: 2.w,
                                      ),
                                    ),
                                  ),
                                  margin:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Single'.tr,
                                        style: kTextStyleMedium.copyWith(
                                          color: kColorBlack2,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        // margin: EdgeInsets.only(right: 25.w),
                                        height: 20,
                                        width: 20,
                                        child: Radio(
                                          activeColor: kColorMainTheme,
                                          value: SocialStatusOption.single,
                                          groupValue: _socialStatusOption,
                                          onChanged: socialStatusSelect,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 15.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  socialStatusSelect(
                                      SocialStatusOption.married);
                                },
                                child: Container(
                                  height: 38.h,
                                  padding: EdgeInsets.only(left: 8.w),
                                  decoration: BoxDecoration(
                                    color: kColorTransparent,
                                    border: Border(
                                      left: BorderSide(
                                        //                   <--- left side
                                        color: _socialStatusOption ==
                                                SocialStatusOption.married
                                            ? kColorMainTheme
                                            : kColorTransparent,
                                        width: 2.w,
                                      ),
                                    ),
                                  ),
                                  margin:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Married'.tr,
                                        style: kTextStyleMedium.copyWith(
                                          color: kColorBlack2,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        // margin: EdgeInsets.only(right: 25.w),
                                        height: 20,
                                        width: 20,
                                        child: Radio(
                                          activeColor: kColorMainTheme,
                                          value: SocialStatusOption.married,
                                          groupValue: _socialStatusOption,
                                          onChanged: socialStatusSelect,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 8.w,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: SizedBox(
                            width: 44.h,
                            height: 44.h,
                            child: SvgPicture.asset(
                              'assets/images/home/close_icon.svg',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          // margin: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 25.w, right: 25.w),
                              child: CustomBottomButtonWithIconSolidColor(
                                buttonTitle: 'Select'.tr,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  void _openGenderSelectBottomSheet(BuildContext context) {
    GenderOption _genderOption = GenderOption.male;

    // String selectedFilterType = 'Sort';

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kColorTransparent, // Make the background transparent
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          genderSelect(GenderOption? value) {
            setState(() {
              _genderOption = value!;
            });
          }

          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Stack(
              children: [
                Container(
                  height: 374.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.h),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 354.h,
                          decoration: const BoxDecoration(
                            color: kColorWhite,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 48.h,
                              ),
                              Container(
                                margin: Get.locale!.languageCode == 'ar'
                                    ? EdgeInsets.only(right: 25.w)
                                    : EdgeInsets.only(left: 25.w),
                                child: Text(
                                  'Select Gender'.tr,
                                  style: kTextStyleSemiBold.copyWith(
                                    fontSize: 20.sp,
                                    color: kColorBlack2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),

                              //Sort Radio Buttons
                              GestureDetector(
                                onTap: () {
                                  genderSelect(GenderOption.male);
                                },
                                child: Container(
                                  height: 38.h,
                                  padding: EdgeInsets.only(left: 8.w),
                                  decoration: BoxDecoration(
                                    color: kColorTransparent,
                                    border: Border(
                                      left: BorderSide(
                                        //                   <--- left side
                                        color:
                                            _genderOption == GenderOption.male
                                                ? kColorMainTheme
                                                : kColorTransparent,
                                        width: 2.w,
                                      ),
                                    ),
                                  ),
                                  margin:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Male'.tr,
                                        style: kTextStyleMedium.copyWith(
                                          color: kColorBlack2,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        // margin: EdgeInsets.only(right: 25.w),
                                        height: 20,
                                        width: 20,
                                        child: Radio(
                                          activeColor: kColorMainTheme,
                                          value: GenderOption.male,
                                          groupValue: _genderOption,
                                          onChanged: genderSelect,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 15.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  genderSelect(GenderOption.female);
                                },
                                child: Container(
                                  height: 38.h,
                                  padding: EdgeInsets.only(left: 8.w),
                                  decoration: BoxDecoration(
                                    color: kColorTransparent,
                                    border: Border(
                                      left: BorderSide(
                                        //                   <--- left side
                                        color:
                                            _genderOption == GenderOption.female
                                                ? kColorMainTheme
                                                : kColorTransparent,
                                        width: 2.w,
                                      ),
                                    ),
                                  ),
                                  margin:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Female'.tr,
                                        style: kTextStyleMedium.copyWith(
                                          color: kColorBlack2,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        // margin: EdgeInsets.only(right: 25.w),
                                        height: 20,
                                        width: 20,
                                        child: Radio(
                                          activeColor: kColorMainTheme,
                                          value: GenderOption.female,
                                          groupValue: _genderOption,
                                          onChanged: genderSelect,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 15.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  genderSelect(GenderOption.others);
                                },
                                child: Container(
                                  height: 38.h,
                                  padding: EdgeInsets.only(left: 8.w),
                                  decoration: BoxDecoration(
                                    color: kColorTransparent,
                                    border: Border(
                                      left: BorderSide(
                                        //                   <--- left side
                                        color:
                                            _genderOption == GenderOption.others
                                                ? kColorMainTheme
                                                : kColorTransparent,
                                        width: 2.w,
                                      ),
                                    ),
                                  ),
                                  margin:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Others'.tr,
                                        style: kTextStyleMedium.copyWith(
                                          color: kColorBlack2,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        // margin: EdgeInsets.only(right: 25.w),
                                        height: 20,
                                        width: 20,
                                        child: Radio(
                                          activeColor: kColorMainTheme,
                                          value: GenderOption.others,
                                          groupValue: _genderOption,
                                          onChanged: genderSelect,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 8.w,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: SizedBox(
                            width: 44.h,
                            height: 44.h,
                            child: SvgPicture.asset(
                              'assets/images/home/close_icon.svg',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          // margin: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 25.w, right: 25.w),
                              child: CustomBottomButtonWithIconSolidColor(
                                buttonTitle: 'Select'.tr,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  void _openJobTypeSelectBottomSheet(BuildContext context) {
    JobTypeOption _jobSlectedOption = JobTypeOption.webdeveloper;

    // String selectedFilterType = 'Sort';

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kColorTransparent, // Make the background transparent
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            jobSelect(JobTypeOption? value) {
              setState(() {
                _jobSlectedOption = value!;
              });
            }

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 482.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.h),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 462.h,
                            decoration: const BoxDecoration(
                              color: kColorWhite,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 48.h,
                                ),
                                Container(
                                  margin: Get.locale!.languageCode == 'ar'
                                      ? EdgeInsets.only(right: 25.w)
                                      : EdgeInsets.only(left: 25.w),
                                  child: Text(
                                    'Select Job Type'.tr,
                                    style: kTextStyleSemiBold.copyWith(
                                      fontSize: 20.sp,
                                      color: kColorBlack2,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),

                                //Sort Radio Buttons
                                GestureDetector(
                                  onTap: () {
                                    jobSelect(JobTypeOption.webdeveloper);
                                  },
                                  child: Container(
                                    height: 38.h,
                                    padding: EdgeInsets.only(left: 8.w),
                                    decoration: BoxDecoration(
                                      color: kColorTransparent,
                                      border: Border(
                                        left: BorderSide(
                                          //                   <--- left side
                                          color: _jobSlectedOption ==
                                                  JobTypeOption.webdeveloper
                                              ? kColorMainTheme
                                              : kColorTransparent,
                                          width: 2.w,
                                        ),
                                      ),
                                    ),
                                    margin: EdgeInsets.only(
                                        left: 25.w, right: 25.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Web Developer'.tr,
                                          style: kTextStyleMedium.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          // margin: EdgeInsets.only(right: 25.w),
                                          height: 20,
                                          width: 20,
                                          child: Radio(
                                            activeColor: kColorMainTheme,
                                            value: JobTypeOption.webdeveloper,
                                            groupValue: _jobSlectedOption,
                                            onChanged: jobSelect,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 15.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    jobSelect(JobTypeOption.freelancer);
                                  },
                                  child: Container(
                                    height: 38.h,
                                    padding: EdgeInsets.only(left: 8.w),
                                    decoration: BoxDecoration(
                                      color: kColorTransparent,
                                      border: Border(
                                        left: BorderSide(
                                          //                   <--- left side
                                          color: _jobSlectedOption ==
                                                  JobTypeOption.freelancer
                                              ? kColorMainTheme
                                              : kColorTransparent,
                                          width: 2.w,
                                        ),
                                      ),
                                    ),
                                    margin: EdgeInsets.only(
                                        left: 25.w, right: 25.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Freelancer'.tr,
                                          style: kTextStyleMedium.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          // margin: EdgeInsets.only(right: 25.w),
                                          height: 20,
                                          width: 20,
                                          child: Radio(
                                            activeColor: kColorMainTheme,
                                            value: JobTypeOption.freelancer,
                                            groupValue: _jobSlectedOption,
                                            onChanged: jobSelect,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 15.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    jobSelect(JobTypeOption.designer);
                                  },
                                  child: Container(
                                    height: 38.h,
                                    padding: EdgeInsets.only(left: 8.w),
                                    decoration: BoxDecoration(
                                      color: kColorTransparent,
                                      border: Border(
                                        left: BorderSide(
                                          //                   <--- left side
                                          color: _jobSlectedOption ==
                                                  JobTypeOption.designer
                                              ? kColorMainTheme
                                              : kColorTransparent,
                                          width: 2.w,
                                        ),
                                      ),
                                    ),
                                    margin: EdgeInsets.only(
                                        left: 25.w, right: 25.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Designer'.tr,
                                          style: kTextStyleMedium.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          // margin: EdgeInsets.only(right: 25.w),
                                          height: 20,
                                          width: 20,
                                          child: Radio(
                                            activeColor: kColorMainTheme,
                                            value: JobTypeOption.designer,
                                            groupValue: _jobSlectedOption,
                                            onChanged: jobSelect,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 15.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    jobSelect(JobTypeOption.accountant);
                                  },
                                  child: Container(
                                    height: 38.h,
                                    padding: EdgeInsets.only(left: 8.w),
                                    decoration: BoxDecoration(
                                      color: kColorTransparent,
                                      border: Border(
                                        left: BorderSide(
                                          //                   <--- left side
                                          color: _jobSlectedOption ==
                                                  JobTypeOption.accountant
                                              ? kColorMainTheme
                                              : kColorTransparent,
                                          width: 2.w,
                                        ),
                                      ),
                                    ),
                                    margin: EdgeInsets.only(
                                        left: 25.w, right: 25.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Accountant'.tr,
                                          style: kTextStyleMedium.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          // margin: EdgeInsets.only(right: 25.w),
                                          height: 20,
                                          width: 20,
                                          child: Radio(
                                            activeColor: kColorMainTheme,
                                            value: JobTypeOption.accountant,
                                            groupValue: _jobSlectedOption,
                                            onChanged: jobSelect,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 15.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    jobSelect(JobTypeOption.management);
                                  },
                                  child: Container(
                                    height: 38.h,
                                    padding: EdgeInsets.only(left: 8.w),
                                    decoration: BoxDecoration(
                                      color: kColorTransparent,
                                      border: Border(
                                        left: BorderSide(
                                          //                   <--- left side
                                          color: _jobSlectedOption ==
                                                  JobTypeOption.management
                                              ? kColorMainTheme
                                              : kColorTransparent,
                                          width: 2.w,
                                        ),
                                      ),
                                    ),
                                    margin: EdgeInsets.only(
                                        left: 25.w, right: 25.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Management'.tr,
                                          style: kTextStyleMedium.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          // margin: EdgeInsets.only(right: 25.w),
                                          height: 20,
                                          width: 20,
                                          child: Radio(
                                            activeColor: kColorMainTheme,
                                            value: JobTypeOption.management,
                                            groupValue: _jobSlectedOption,
                                            onChanged: jobSelect,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 8.w,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: SizedBox(
                              width: 44.h,
                              height: 44.h,
                              child: SvgPicture.asset(
                                'assets/images/home/close_icon.svg',
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10.h,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            // margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: 25.w, right: 25.w),
                                child: CustomBottomButtonWithIconSolidColor(
                                  buttonTitle: 'Select'.tr,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
