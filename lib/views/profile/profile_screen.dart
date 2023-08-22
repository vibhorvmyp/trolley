import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/routes/routes.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';

import '../../widgets/dialogs/custom_dialog_large_size.dart';
import '../../widgets/dialogs/custom_dialog_regular_size.dart';
import '../../widgets/profile/custom_tab_profilescreen_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              title: 'Profile'.tr,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: screenSize.width,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),

                      //Edit Profile Tab
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(editProfileScreen);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 25.w),
                          // height: 800,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.h),
                            color: kColorWhite,
                          ),

                          height: 80.h,
                          width: screenSize.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.h),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        // color: Colors.black,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/profile/sample_profile_pic.jpg')),
                                        shape: BoxShape.circle,
                                      ),
                                      height: 80.h,
                                      width: 80.h,
                                      // child: Icon(Icons.handyman_outlined),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Container(
                                    // color: Colors.red,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Vivi Boney',
                                          style: kTextStyleSemiBold.copyWith(
                                              fontSize: 20.sp,
                                              color: kColorBlack2),
                                        ),
                                        Text(
                                          '+249 123456789',
                                          style: kTextStyleMedium.copyWith(
                                              fontSize: 14.sp,
                                              color: kColorBlack2withOpacity75),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: Get.locale!.languageCode == 'ar'
                                    ? EdgeInsets.only(left: 25.w)
                                    : EdgeInsets.only(right: 25.w),
                                height: 24.h,
                                width: 24.h,
                                child: Image.asset(
                                    'assets/images/profile/edit_pen.png'),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 16.h,
                      ),

                      //Payment Info
                      Container(
                        width: screenSize.width,
                        margin: EdgeInsets.symmetric(
                          horizontal: 25.w,
                        ),
                        decoration: BoxDecoration(
                          color: kColorWhite,
                          borderRadius: BorderRadius.circular(16.h),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Title
                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(top: 17.h, right: 25.h)
                                  : EdgeInsets.only(top: 17.h, left: 25.w),
                              child: Text(
                                'Payment Information'.tr,
                                style: kTextStyleMedium.copyWith(
                                    fontSize: 16.sp,
                                    color: kColorBlack2withOpacity75),
                              ),
                            ),

                            SizedBox(
                              height: 10.h,
                            ),

                            //Custom Tab
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(trolleyCreditScreen);
                              },
                              child: CustomTabProfileScreenWidget(
                                leadingIconUrl:
                                    'assets/images/profile/wallet.png',
                                rightArrowIconUrl: Get.locale!.languageCode ==
                                        'ar'
                                    ? 'assets/images/profile/profile_tabs_arrow_left.png'
                                    : 'assets/images/profile/profile_tabs_arrow_right.png',
                                title: 'My Trolley Credit'.tr,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Personal Info
                      SizedBox(
                        height: 16.h,
                      ),

                      Container(
                        width: screenSize.width,
                        margin: EdgeInsets.symmetric(
                          horizontal: 25.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.h),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Title
                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(top: 17.h, right: 25.h)
                                  : EdgeInsets.only(top: 17.h, left: 25.w),
                              child: Text(
                                'Personal Information'.tr,
                                style: kTextStyleMedium.copyWith(
                                    fontSize: 16.sp,
                                    color: kColorBlack2withOpacity75),
                              ),
                            ),

                            SizedBox(
                              height: 10.h,
                            ),

                            //Custom Tab
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(cartScreen);
                              },
                              child: CustomTabProfileScreenWidget(
                                leadingIconUrl:
                                    'assets/images/profile/my_cart.png',
                                rightArrowIconUrl: Get.locale!.languageCode ==
                                        'ar'
                                    ? 'assets/images/profile/profile_tabs_arrow_left.png'
                                    : 'assets/images/profile/profile_tabs_arrow_right.png',
                                title: 'My Cart'.tr,
                              ),
                            ),
                            //Custom Tab
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(ordersScreen);
                              },
                              child: CustomTabProfileScreenWidget(
                                leadingIconUrl:
                                    'assets/images/profile/my_orders.png',
                                rightArrowIconUrl: Get.locale!.languageCode ==
                                        'ar'
                                    ? 'assets/images/profile/profile_tabs_arrow_left.png'
                                    : 'assets/images/profile/profile_tabs_arrow_right.png',
                                title: 'My Orders'.tr,
                              ),
                            ),
                            //Custom Tab
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(addressScreen);
                              },
                              child: CustomTabProfileScreenWidget(
                                leadingIconUrl:
                                    'assets/images/profile/my_address.png',
                                rightArrowIconUrl: Get.locale!.languageCode ==
                                        'ar'
                                    ? 'assets/images/profile/profile_tabs_arrow_left.png'
                                    : 'assets/images/profile/profile_tabs_arrow_right.png',
                                title: 'My Address'.tr,
                              ),
                            ),
                            //Custom Tab
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(enquiriesScreen);
                              },
                              child: CustomTabProfileScreenWidget(
                                leadingIconUrl:
                                    'assets/images/profile/my_enquiries.png',
                                rightArrowIconUrl: Get.locale!.languageCode ==
                                        'ar'
                                    ? 'assets/images/profile/profile_tabs_arrow_left.png'
                                    : 'assets/images/profile/profile_tabs_arrow_right.png',
                                title: 'My Enquiries'.tr,
                              ),
                            ),
                            //Custom Tab
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(changePasswordScreen);
                              },
                              child: CustomTabProfileScreenWidget(
                                leadingIconUrl:
                                    'assets/images/profile/change_password.png',
                                rightArrowIconUrl: Get.locale!.languageCode ==
                                        'ar'
                                    ? 'assets/images/profile/profile_tabs_arrow_left.png'
                                    : 'assets/images/profile/profile_tabs_arrow_right.png',
                                title: 'Change Password'.tr,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Other Info
                      SizedBox(
                        height: 16.h,
                      ),

                      Container(
                        width: screenSize.width,
                        margin: EdgeInsets.symmetric(
                          horizontal: 25.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.h),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Title
                            Container(
                              margin: Get.locale!.languageCode == 'ar'
                                  ? EdgeInsets.only(top: 17.h, right: 25.h)
                                  : EdgeInsets.only(top: 17.h, left: 25.w),
                              child: Text(
                                'Other Information'.tr,
                                style: kTextStyleMedium.copyWith(
                                    fontSize: 16.sp,
                                    color: kColorBlack2withOpacity75),
                              ),
                            ),

                            //Custom Tab
                            CustomTabProfileScreenWidget(
                              leadingIconUrl:
                                  'assets/images/profile/change_currency.png',
                              rightArrowIconUrl: Get.locale!.languageCode ==
                                      'ar'
                                  ? 'assets/images/profile/profile_tabs_arrow_left.png'
                                  : 'assets/images/profile/profile_tabs_arrow_right.png',
                              title: 'Change Currency'.tr,
                            ),
                            //Custom Tab
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(termsAndConditionsScreen);
                              },
                              child: CustomTabProfileScreenWidget(
                                leadingIconUrl:
                                    'assets/images/profile/terms_conditions.png',
                                rightArrowIconUrl: Get.locale!.languageCode ==
                                        'ar'
                                    ? 'assets/images/profile/profile_tabs_arrow_left.png'
                                    : 'assets/images/profile/profile_tabs_arrow_right.png',
                                title: 'Terms & Conditions'.tr,
                              ),
                            ),
                            //Custom Tab
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(aboutUsScreen);
                              },
                              child: CustomTabProfileScreenWidget(
                                leadingIconUrl:
                                    'assets/images/profile/about_us.png',
                                rightArrowIconUrl: Get.locale!.languageCode ==
                                        'ar'
                                    ? 'assets/images/profile/profile_tabs_arrow_left.png'
                                    : 'assets/images/profile/profile_tabs_arrow_right.png',
                                title: 'About us'.tr,
                              ),
                            ),
                            //Custom Tab
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(contactUsScreen);
                              },
                              child: CustomTabProfileScreenWidget(
                                leadingIconUrl:
                                    'assets/images/profile/contact_us.png',
                                rightArrowIconUrl: Get.locale!.languageCode ==
                                        'ar'
                                    ? 'assets/images/profile/profile_tabs_arrow_left.png'
                                    : 'assets/images/profile/profile_tabs_arrow_right.png',
                                title: 'Contact us'.tr,
                              ),
                            ),
                            //Custom Tab
                            GestureDetector(
                              onTap: () {
                                // Get.toNamed(registerScreen);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CustomDialogRegularSize(
                                    rightButtonTitle: 'Yes'.tr,
                                    leftButtonTitle: 'No'.tr,
                                    rightButtonSelectedFlag: true,
                                    leftButtonSelectedFlag: false,
                                    dialogDescription:
                                        'Are you sure you want to Logout?'.tr,
                                    dialogTitle: 'Logout'.tr,
                                    imgUrl:
                                        'assets/images/dialogs/logout_circle.png',
                                    onTap: () {
                                      Navigator.pop(context);
                                      Get.toNamed(registerScreen);
                                    },
                                  ),
                                );
                                print('open logout dialog');
                              },
                              child: CustomTabProfileScreenWidget(
                                leadingIconUrl:
                                    'assets/images/profile/logout.png',
                                rightArrowIconUrl: Get.locale!.languageCode ==
                                        'ar'
                                    ? 'assets/images/profile/profile_tabs_arrow_left.png'
                                    : 'assets/images/profile/profile_tabs_arrow_right.png',
                                title: 'Logout'.tr,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Delete Account
                      SizedBox(
                        height: 16.h,
                      ),

                      GestureDetector(
                        onTap: () {
                          // Get.toNamed(registerScreen);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CustomDialogLargeSize(
                              dialogTitle: 'Delete Account?'.tr,
                              leftButtonSelectedFlag: true,
                              rightButtonSelectedFlag: false,
                              leftButtonTitle: 'Yes'.tr,
                              rightButtonTitle: 'No'.tr,
                              dialogDescription:
                                  'Are you sure you want to Delete account? All the data of this account will be erased.'
                                      .tr,
                              imgUrl:
                                  'assets/images/dialogs/delete_account.png',
                            ),
                          );
                          print('open delete account dialog');
                        },
                        child: Container(
                          width: screenSize.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 25.w,
                          ),
                          decoration: BoxDecoration(
                            color: kColorWhite,
                            borderRadius: BorderRadius.circular(16.h),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Custom Tab
                              CustomTabProfileScreenWidget(
                                leadingIconUrl:
                                    'assets/images/profile/delete_account.png',
                                rightArrowIconUrl: Get.locale!.languageCode ==
                                        'ar'
                                    ? 'assets/images/profile/profile_tabs_arrow_left.png'
                                    : 'assets/images/profile/profile_tabs_arrow_right.png',
                                title: 'Delete Account'.tr,
                              ),
                            ],
                          ),
                        ),
                      ),

                      //App version
                      SizedBox(
                        height: 100.h,
                      ),

                      Container(
                        alignment: Alignment.center,
                        width: screenSize.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'App Version '.tr,
                              style: kTextStyleMedium.copyWith(
                                  fontSize: 14.sp,
                                  color: kColorBlack2withOpacity25),
                            ),
                            Text(
                              '1.1.9',
                              style: kTextStyleMedium.copyWith(
                                  fontSize: 14.sp,
                                  color: kColorBlack2withOpacity25),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10.h,
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
