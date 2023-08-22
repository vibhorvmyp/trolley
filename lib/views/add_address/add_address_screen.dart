import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/views/edit_address/edit_address_screen.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';
// import 'package:trolley/widgets/common/custom_textfield_with_icon_prefix_widget.dart';

import '../../constants/textstyles.dart';
import '../../widgets/common/custom_simple_button.dart';
// import '../../widgets/common/custom_textfield_phone_number_widget.dart';
import '../../widgets/dialogs/custom_dialog_simple.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  var status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBg,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //App Bar
                CustomAppBarWithBack(
                  title: 'Add Address'.tr,
                ),

                //Edit Address Content
                Expanded(
                  child: SingleChildScrollView(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: CustomTextFieldPhoneNumberEditAddressWidget(
                              hintText: 'Enter your Mobile Number'.tr,
                              prefixText: '+249 | ',
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: CustomSimpleTextFieldFullWidthWidget(
                              hintText: 'Enter House No. & Floor'.tr,
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: CustomSimpleTextFieldFullWidthWidget(
                              hintText: 'Enter your Building Name'.tr,
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: CustomSimpleTextFieldFullWidthWidget(
                              hintText: 'Enter a Landmark'.tr,
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: CustomSimpleTextFieldFullWidthWidget(
                              hintText: 'Enter your Area'.tr,
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),

                          //Select City , Select State
                          Container(
                            margin: EdgeInsets.only(
                              left: 25.w,
                              right: 25.w,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      print('Container tapped');
                                    },
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Container(
                                          child: TextField(
                                            enabled:
                                                false, // Make the TextField disabled
                                            decoration: InputDecoration(
                                              hintText: 'Select City'.tr,
                                              hintStyle:
                                                  kTextStyleRegular.copyWith(
                                                fontSize: 16.sp,
                                                color:
                                                    kColorBlack2withOpacity75,
                                              ),
                                              disabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        kColorBlack2withOpacity25),
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        kColorBlack2withOpacity25),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        kColorBlack2withOpacity25),
                                              ),
                                            ),
                                          ),
                                        ),

                                        //Dropdown Arrow
                                        Padding(
                                          padding: EdgeInsets.only(right: 1.w),
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
                                  width: 35.w,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      print('Container tapped');
                                    },
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Container(
                                          child: TextField(
                                            enabled:
                                                false, // Make the TextField disabled
                                            decoration: InputDecoration(
                                              hintText: 'Select State'.tr,
                                              hintStyle:
                                                  kTextStyleRegular.copyWith(
                                                fontSize: 16.sp,
                                                color:
                                                    kColorBlack2withOpacity75,
                                              ),
                                              disabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        kColorBlack2withOpacity25),
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        kColorBlack2withOpacity25),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        kColorBlack2withOpacity25),
                                              ),
                                            ),
                                          ),
                                        ),

                                        //Dropdown Arrow
                                        Padding(
                                          padding: EdgeInsets.only(right: 1.w),
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
                          ),

                          SizedBox(
                            height: 35.h,
                          ),

                          //Select Address Label
                          Container(
                            margin: Get.locale!.languageCode == 'ar'
                                ? EdgeInsets.only(right: 25.w)
                                : EdgeInsets.only(left: 25.w),
                            child: Text(
                              'Select Address Label'.tr,
                              style: kTextStyleRegular.copyWith(
                                  fontSize: 16.sp, color: kColorBlack2),
                            ),
                          ),

                          SizedBox(
                            height: 15.h,
                          ),

                          Container(
                            margin: Get.locale!.languageCode == 'ar'
                                ? EdgeInsets.only(right: 25.w)
                                : EdgeInsets.only(left: 25.w),
                            child: Row(
                              children: [
                                //Selected one
                                Container(
                                  alignment: Alignment.center,
                                  height: 35.h,
                                  width: 69.w,
                                  decoration: BoxDecoration(
                                    color: kColorMainTheme,
                                    borderRadius: BorderRadius.circular(16.h),
                                  ),
                                  child: Text(
                                    'Home'.tr,
                                    style: kTextStyleSemiBold.copyWith(
                                      fontSize: 14.sp,
                                      color: kColorWhite,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  width: 25.w,
                                ),

                                //Unselected
                                Container(
                                  alignment: Alignment.center,
                                  height: 35.h,
                                  width: 69.w,
                                  decoration: BoxDecoration(
                                    color: kColorMainTheme.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(16.h),
                                  ),
                                  child: Text(
                                    'Work'.tr,
                                    style: kTextStyleSemiBold.copyWith(
                                      fontSize: 14.sp,
                                      color: kColorMainTheme,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  width: 25.w,
                                ),

                                //Unselected
                                Container(
                                  alignment: Alignment.center,
                                  height: 35.h,
                                  width: 69.w,
                                  decoration: BoxDecoration(
                                    color: kColorMainTheme.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(16.h),
                                  ),
                                  child: Text(
                                    'Other'.tr,
                                    style: kTextStyleSemiBold.copyWith(
                                      fontSize: 14.sp,
                                      color: kColorMainTheme,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 40.h,
                          ),

                          //keep as default button
                          Container(
                            margin: Get.locale!.languageCode == 'ar'
                                ? EdgeInsets.only(right: 25.w)
                                : EdgeInsets.only(left: 25.w),
                            child: Row(
                              children: [
                                Container(
                                  child: FlutterSwitch(
                                    activeColor: const Color(0xFF79A400),
                                    inactiveColor: Colors.grey,
                                    width: 30.w,
                                    height: 18.h,
                                    // valueFontSize: 25.0,
                                    toggleSize: 10.0,
                                    value: status,
                                    // borderRadius: 30.0,
                                    // padding: 8.0,
                                    // showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        status = val;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Text(
                                  'Keep as Default Address'.tr,
                                  style: kTextStyleRegular.copyWith(
                                    fontSize: 16.sp,
                                    color: kColorBlack2withOpacity75,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Update Address Button

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
                        dialogTitle: 'Address Updated'.tr,
                        dialogDescription: 'Your Address has been updated'.tr,
                        imgUrl: 'assets/images/dialogs/address_updated.png',
                      ),
                    );
                    print('open address updated  dialog');
                  },
                  child: CustomSimpleButton(
                    buttonTitle: 'Update Address'.tr,
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

class CustomTextFieldPhoneNumberEditAddressWidget extends StatelessWidget {
  const CustomTextFieldPhoneNumberEditAddressWidget({
    // this.iconUrl = '',
    this.hintText = '',
    this.prefixText = '',
    super.key,
  });

  // final String iconUrl;
  final String hintText;
  final String prefixText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        // isDense: true,
        prefixIcon: Container(
          // color: Colors.red,
          padding: const EdgeInsets.all(0),
          margin: EdgeInsets.only(top: 18.h),
          child: Text(
            prefixText,
            style: kTextStyleRegular.copyWith(
              fontSize: 16.sp,
              color: kColorBlack2withOpacity75,
            ),
          ),
        ),
        hintText: hintText,
        hintStyle: kTextStyleRegular.copyWith(
          fontSize: 16.sp,
          color: kColorBlack2withOpacity75,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kColorBlack2withOpacity25),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kColorBlack2withOpacity25),
        ),
      ),
    );
  }
}
