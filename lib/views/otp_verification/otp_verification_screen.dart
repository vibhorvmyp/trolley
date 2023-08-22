import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trolley/routes/routes.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
import '../../controllers/otp/otp_controller.dart';
import '../../widgets/common/custom_simple_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  // // 4 text editing controllers that associate with the 4 input fields
  // final TextEditingController _fieldOne = TextEditingController();
  // final TextEditingController _fieldTwo = TextEditingController();
  // final TextEditingController _fieldThree = TextEditingController();
  // final TextEditingController _fieldFour = TextEditingController();

  // // This is the entered code
  // // It will be displayed in a Text widget
  // String? _otp;

  @override
  Widget build(BuildContext context) {
    OtpController controller = Get.put(OtpController());

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 48.h,
                        ),
                        Text(
                          'OTP Verification'.tr,
                          style: kTextStyleSemiBold.copyWith(
                            fontSize: 24.sp,
                            color: kColorBlack,
                          ),
                        ),

                        SizedBox(
                          height: 36.h,
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 30.w, right: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OtpText(
                                controller: controller.controller1,
                                hintText: "*",
                                inputType: TextInputType.number,
                                currNode: controller.node1,
                                nextNode: controller.node2,
                                prevNode: controller.node1,
                                isFilled: controller.isFilled1,
                              ),
                              OtpText(
                                controller: controller.controller2,
                                hintText: "*",
                                inputType: TextInputType.number,
                                currNode: controller.node2,
                                nextNode: controller.node3,
                                prevNode: controller.node1,
                                isFilled: controller.isFilled2,
                              ),
                              OtpText(
                                controller: controller.controller3,
                                hintText: "*",
                                inputType: TextInputType.number,
                                currNode: controller.node3,
                                nextNode: controller.node4,
                                prevNode: controller.node2,
                                isFilled: controller.isFilled3,
                              ),
                              OtpText(
                                controller: controller.controller4,
                                hintText: "*",
                                inputType: TextInputType.number,
                                currNode: controller.node4,
                                nextNode: controller.node4,
                                prevNode: controller.node3,
                                isFilled: controller.isFilled4,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // Container(
                        //   height: 74,
                        //   width: 74,
                        //   color: Colors.red,
                        // ),

                        Obx(
                          () => Container(
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(right: 40),
                            child: Text(
                              "${Duration(seconds: controller.start.value).toString().split(".")[0].split(":")[1]}:${Duration(seconds: controller.start.value).toString().split(".")[0].split(":")[2]}",
                              style: kTextStyleRegular.copyWith(
                                  fontSize: 16,
                                  color: kColorBlack2withOpacity75),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 104.h,
                        ),

                        //Verify Button
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(resetPasswordScreen);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: CustomSimpleButton(
                              buttonTitle: 'Verify'.tr,
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
                              'Didn’t receive the code? '.tr,
                              style: kTextStyleRegular.copyWith(
                                  fontSize: 16.sp,
                                  color: kColorBlack2withOpacity75),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(loginScreen);
                              },
                              child: Text(
                                'Resend'.tr,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final FocusNode currNode;
  final FocusNode nextNode;
  final FocusNode prevNode;

  final RxBool isFilled;
  const OtpText(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.inputType,
      required this.currNode,
      required this.nextNode,
      required this.prevNode,
      required this.isFilled});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 13.w),
      // width: 60.w,
      // height: 60.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Container(
              decoration: isFilled.value
                  ? const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      color: kColorWhite,
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: kColorMainTheme,
                        ),
                        left: BorderSide(
                          width: 1,
                          color: kColorMainTheme,
                        ),
                        right: BorderSide(
                          width: 1,
                          color: kColorMainTheme,
                        ),
                        bottom: BorderSide(
                          width: 4,
                          color: kColorMainTheme,
                        ),
                      ))
                  : const BoxDecoration(
                      color: Color(0xFFF3F3F3),
                    ),
              height: 85.h,
              width: 85.w,
              child: TextFormField(
                maxLength: 1,
                controller: controller,
                focusNode: currNode,
                onChanged: (value) {
                  if (controller.text.isNotEmpty) {
                    isFilled.value = true;
                    FocusScope.of(context).requestFocus(nextNode);
                    if (currNode == nextNode) {
                      Get.focusScope!.unfocus();
                    }
                  } else {
                    isFilled.value = false;
                    FocusScope.of(context).requestFocus(prevNode);
                  }
                },
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: inputType == TextInputType.visiblePassword,
                style: kTextStyleMedium.copyWith(
                  // height: 1.4,
                  fontSize: 30.sp,
                  color: kColorBlack2,
                ),
                // expands: !(inputType == TextInputType.visiblePassword),
                // maxLines: inputType == TextInputType.visiblePassword ? 1 : null,
                // minLines: inputType == TextInputType.visiblePassword ? 1 : null,
                keyboardType: inputType,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  // isDense: true,
                  // filled: true,
                  counterText: "",
                  hintStyle: kTextStyleMedium.copyWith(
                    // height: 1.4,
                    fontSize: 30.sp,
                    color: kColorBlack2,
                  ),
                  // hintText: hintText,
                  // border: OutlineInputBorder(
                  //   borderSide: const BorderSide(
                  //       color: Colors.transparent, width: double.minPositive),
                  //   borderRadius: BorderRadius.circular(8.w),
                  // ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.transparent, width: double.minPositive),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.transparent, width: double.minPositive),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class OtpInput extends StatelessWidget {
//   const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

//   final TextEditingController controller;
//   final bool autoFocus;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           color: Colors.amber,
//           height: 74,
//           width: 74,
//           child: TextField(
//             // cursorHeight: 30,
//             cursorHeight: 36,
//             cursorColor: Colors.black,
//             cursorWidth: 2,
//             cursorRadius: const Radius.circular(500),
//             style: kTextStyleMedium.copyWith(
//               height: 1.4,
//               fontSize: 36,
//               color: kColorBlack2,
//             ),
//             autofocus: autoFocus,
//             textAlign: TextAlign.center,
//             inputFormatters: [
//               LengthLimitingTextInputFormatter(1),
//               FilteringTextInputFormatter.digitsOnly
//             ],
//             keyboardType: TextInputType.number,
//             controller: controller,
//             maxLength: 1,
//             // cursorColor: Theme.of(context).primaryColor,
//             decoration: const InputDecoration(
//                 // contentPadding:
//                 //     EdgeInsets.only(right: 27, left: 27, top: 12, bottom: 12),
//                 isDense: true,
//                 filled: true,
//                 border: OutlineInputBorder(),
//                 counterText: '',
//                 hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
//             onChanged: (value) {
//               if (value.length == 1) {
//                 FocusScope.of(context).nextFocus();
//               }
//               if (value.isEmpty) {
//                 FocusScope.of(context).previousFocus();
//               }
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// paddingAll(40.h, 12.h, 20.w, 20.w, Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     otpField(context),otpField(context),otpField(context),otpField(context),
//   ],
// ),),

// class OtpField extends StatelessWidget {
//   const OtpField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 55.h,
//       width: 55.w,
//       child: TextFormField(
//         enableInteractiveSelection: false,
//         autofocus: true,
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus();
//           }
//           if (value.isEmpty) {
//             FocusScope.of(context).previousFocus();
//           }
//         },
//         keyboardType: TextInputType.number,
//         textAlign: TextAlign.center,
//         inputFormatters: [
//           LengthLimitingTextInputFormatter(1),
//           FilteringTextInputFormatter.digitsOnly
//         ],
//         decoration: InputDecoration(
//           enabled: true,
//           filled: true,
//           // fillColor: secondaryColor,
//           // hintStyle: GoogleFonts.poppins(
//           //     fontSize: 14.sp,fontWeight: FontWeight.w400,color: hintTextColor
//           // ),
//           isDense: true,
//           contentPadding: EdgeInsets.symmetric(vertical: 40.h),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10.r)),
//               borderSide: const BorderSide(color: kColorBlack2, width: 1)),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.r)),
//             borderSide: const BorderSide(color: kColorBlack2, width: 1),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.r)),
//             borderSide: const BorderSide(color: kColorBlack2, width: 1),
//           ),
//           // errorBorder: OutlineInputBorder(
//           //   borderRadius: BorderRadius.all(Radius.circular(10.r)),
//           //   borderSide:const BorderSide(color: secondaryColor, width: 1),
//           // ),
//           // focusedErrorBorder: OutlineInputBorder(
//           //   borderRadius: BorderRadius.all(Radius.circular(10.r)),
//           //   borderSide: const BorderSide(color: secondaryColor, width: 1),
//           // ),
//         ),
//       ),
//     );
//   }
// }
