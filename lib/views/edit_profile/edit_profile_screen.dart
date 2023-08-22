import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/controllers/edit_Profile/edit_profile_controller.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';
import 'package:trolley/widgets/dialogs/custom_dialog_simple.dart';

import '../../widgets/common/custom_bottom_button_with_icon_solid_color.dart';
import '../../widgets/common/custom_simple_button.dart';
import '../register/register_screen.dart';
// import '../../widgets/custom_simple_textfield_widget.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final editProfileController = Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorBg,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //App Bar
                CustomAppBarWithBack(
                  title: 'Edit Profile'.tr,
                ),

                //Edit Photo
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 100.h,
                                width: 100.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: Colors.amber.withOpacity(0.9),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/profile/sample_profile_pic.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.only(top: 85.h),
                                height: 36.h,
                                width: 36.h,
                                child: Image.asset(
                                  'assets/images/profile/upload_pic.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),

                        //Personal Information Section
                        Container(
                          margin: EdgeInsets.only(left: 25.w, right: 25.w),
                          padding: EdgeInsets.all(15.h),
                          width: screenSize.width,
                          decoration: BoxDecoration(
                            color: kColorWhite,
                            borderRadius: BorderRadius.circular(16.h),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Primary Information'.tr,
                                style: kTextStyleMedium.copyWith(
                                  color: kColorBlack2withOpacity75,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Row(
                                children: [
                                  EditProfileTextFields(
                                    iconUrl:
                                        'assets/images/edit_profile/user.png',
                                    controller: editProfileController
                                        .firstNameController,

                                    // hintText: 'Re-Enter New Password',
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  EditProfileTextFields(
                                    // iconUrl: 'assets/images/edit_profile/user.png',
                                    controller: editProfileController
                                        .lastNameController,

                                    // hintText: 'Re-Enter New Password',
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  EditProfileTextFields(
                                    iconUrl:
                                        'assets/images/edit_profile/email.png',
                                    controller:
                                        editProfileController.emailController,
                                    // hintText: 'Re-Enter New Password',
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  EditProfilePhoneNumberTextField(
                                    iconUrl:
                                        'assets/images/edit_profile/phone.png',
                                    controller:
                                        editProfileController.phoneController,
                                    // hintText: 'Re-Enter New Password',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),

                        //Secondary Information Section
                        Container(
                          margin: EdgeInsets.only(left: 25.w, right: 25.w),
                          padding: EdgeInsets.all(15.h),
                          width: screenSize.width,
                          decoration: BoxDecoration(
                            color: kColorWhite,
                            borderRadius: BorderRadius.circular(16.h),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Secondary Information'.tr,
                                style: kTextStyleMedium.copyWith(
                                  color: kColorBlack2withOpacity75,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),

                              //Job Type Field
                              GestureDetector(
                                onTap: () {
                                  print('job type field pressed');
                                  _openJobTypeSelectBottomSheet(context);
                                },
                                child: Stack(
                                  alignment: Get.locale!.languageCode == 'ar'
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  children: [
                                    Row(
                                      children: [
                                        EditProfileTextFields(
                                          enabledFlag: false,
                                          iconUrl:
                                              'assets/images/edit_profile/job.png',
                                          // controller: editProfileController
                                          //     .firstNameController,
                                          hintText: 'Job Type'.tr,

                                          // hintText: 'Re-Enter New Password',
                                        ),
                                      ],
                                    ),

                                    //Dropdown Arrow
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 5.w, top: 5.h),
                                      child: SizedBox(
                                        height: 16.h,
                                        width: 16.h,
                                        child: Image.asset(
                                          'assets/images/auth/dropdown_arrow.png',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //Gender and Status
                              Row(
                                children: [
                                  //Gender Drop down
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _openGenderSelectBottomSheet(context);
                                      },
                                      child: Stack(
                                        alignment:
                                            Get.locale!.languageCode == 'ar'
                                                ? Alignment.centerLeft
                                                : Alignment.centerRight,
                                        children: [
                                          EditProfileDropDownField(
                                            enabledFlag: false,
                                            hintText: 'Female'.tr,
                                            iconUrl:
                                                'assets/images/edit_profile/bi_icon.png',
                                          ),

                                          //Dropdown Arrow
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 5.w, top: 5.h),
                                            child: SizedBox(
                                              height: 16.h,
                                              width: 16.h,
                                              child: Image.asset(
                                                'assets/images/auth/dropdown_arrow.png',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25.w,
                                  ),

                                  //Social Status Dropdown
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _openSocialStatusBottomSheet(context);
                                      },
                                      child: Stack(
                                        alignment:
                                            Get.locale!.languageCode == 'ar'
                                                ? Alignment.centerLeft
                                                : Alignment.centerRight,
                                        children: [
                                          EditProfileDropDownField(
                                            enabledFlag: false,
                                            hintText: 'Single'.tr,
                                            iconUrl:
                                                'assets/images/edit_profile/status.png',
                                          ),

                                          //Dropdown Arrow
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 5.w, top: 5.h),
                                            child: SizedBox(
                                              height: 16.h,
                                              width: 16.h,
                                              child: Image.asset(
                                                'assets/images/auth/dropdown_arrow.png',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //Update Button
            Positioned(
              bottom: 20.h,
              left: 0.h,
              right: 0.w,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          CustomDialogCongratsSimple(
                        dialogDescription:
                            'Your Profile has been updated successfully'.tr,
                        dialogTitle: 'Congratulations'.tr,
                        imgUrl: 'assets/images/dialogs/profile_updated.png',
                      ),
                    );
                    print('open congratulations dialog');
                  },
                  child: CustomSimpleButton(
                    buttonTitle: 'Update Profile'.tr,
                  ),
                ),
              ),
            ),
          ],
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
        return StatefulBuilder(builder: (context, setState) {
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
                                  margin:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
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
                                  margin:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
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
                                  margin:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
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
                                  margin:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
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
                                  margin:
                                      EdgeInsets.only(left: 25.w, right: 25.w),
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
}

class EditProfileTextFields extends StatelessWidget {
  EditProfileTextFields({
    this.iconUrl = '',
    this.hintText = '',
    this.enabledFlag = true,
    this.controller,
    super.key,
  });

  final String iconUrl;
  final String hintText;
  final bool enabledFlag;
  final TextEditingController? controller;
  final profileEditingController = Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // SizedBox(
          //   width: 20.w,
          // ),
          Container(
            margin: EdgeInsets.only(top: 7.h),
            // color: Colors.blue,
            // height: 40,
            width: iconUrl != '' ? 24.w : 0.w,
            child: iconUrl != '' ? Image.asset(iconUrl) : const SizedBox(),
          ),
          iconUrl != ''
              ? SizedBox(
                  width: 20.w,
                )
              : const SizedBox(),
          Expanded(
            child: TextField(
              style: kTextStyleRegular.copyWith(
                fontSize: 16.sp,
                color: kColorBlack2withOpacity75,
              ),
              controller: controller,
              decoration: InputDecoration(
                enabled: enabledFlag,
                hintText: hintText != '' ? hintText : '',
                hintStyle: kTextStyleRegular.copyWith(
                    fontSize: 16.sp, color: kColorBlack2withOpacity75),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kColorBlack2withOpacity25),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kColorBlack2withOpacity25),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   width: 20.w,
          // ),
        ],
      ),
    );
  }
}

class EditProfilePhoneNumberTextField extends StatelessWidget {
  EditProfilePhoneNumberTextField({
    this.iconUrl = '',
    this.hintText = '',
    this.enabledFlag = true,
    this.controller,
    super.key,
  });

  final String iconUrl;
  final String hintText;
  final bool enabledFlag;
  final TextEditingController? controller;
  final profileEditingController = Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // SizedBox(
          //   width: 20.w,
          // ),
          Container(
            margin: EdgeInsets.only(top: 7.h),
            // color: Colors.blue,
            // height: 40,
            width: iconUrl != '' ? 24.w : 0.w,
            child: iconUrl != '' ? Image.asset(iconUrl) : const SizedBox(),
          ),
          iconUrl != ''
              ? SizedBox(
                  width: 20.w,
                )
              : const SizedBox(),
          Expanded(
            child: TextField(
              style: kTextStyleRegular.copyWith(
                fontSize: 16.sp,
                color: kColorBlack2withOpacity75,
              ),
              controller: controller,
              decoration: InputDecoration(
                prefixIconConstraints: BoxConstraints(
                  minWidth: 40.w,
                  // minHeight: 25,
                ),
                prefixIcon: SizedBox(
                  width: 2.w,
                  child: Container(
                    // color: Colors.red,
                    // padding: const EdgeInsets.all(0),
                    margin: EdgeInsets.only(top: 1.h),
                    child: Text(
                      '+246 ',
                      style: kTextStyleRegular.copyWith(
                        fontSize: 16.sp,
                        color: kColorBlack2withOpacity75,
                      ),
                    ),
                  ),
                ),
                enabled: enabledFlag,
                hintText: hintText != '' ? hintText : '',
                hintStyle: kTextStyleRegular.copyWith(
                    fontSize: 16.sp, color: kColorBlack2withOpacity75),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kColorBlack2withOpacity25),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kColorBlack2withOpacity25),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   width: 20.w,
          // ),
        ],
      ),
    );
  }
}

class EditProfileDropDownField extends StatelessWidget {
  EditProfileDropDownField({
    this.iconUrl = '',
    this.hintText = '',
    this.enabledFlag = true,
    this.controller,
    super.key,
  });

  final String iconUrl;
  final String hintText;
  final bool enabledFlag;
  final TextEditingController? controller;
  final profileEditingController = Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // SizedBox(
        //   width: 20.w,
        // ),
        Container(
          margin: EdgeInsets.only(top: 7.h),
          // color: Colors.blue,
          // height: 40,
          width: iconUrl != '' ? 24.w : 0.w,
          child: iconUrl != '' ? Image.asset(iconUrl) : const SizedBox(),
        ),
        iconUrl != ''
            ? SizedBox(
                width: 20.w,
              )
            : const SizedBox(),
        Expanded(
          child: TextField(
            style: kTextStyleRegular.copyWith(
              fontSize: 16.sp,
              color: kColorBlack2withOpacity75,
            ),
            controller: controller,
            decoration: InputDecoration(
              enabled: enabledFlag,
              hintText: hintText != '' ? hintText : '',
              hintStyle: kTextStyleRegular.copyWith(
                  fontSize: 16.sp, color: kColorBlack2withOpacity75),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorBlack2withOpacity25),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorBlack2withOpacity25),
              ),
            ),
          ),
        ),
        // SizedBox(
        //   width: 20.w,
        // ),
      ],
    );
  }
}
