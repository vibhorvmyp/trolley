import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/textstyles.dart';

class CustomSimpleTextFieldWidget extends StatelessWidget {
  const CustomSimpleTextFieldWidget({
    this.iconUrl = '',
    this.hintText = '',
    this.validator,
    this.controller,
    super.key,
  });

  final String iconUrl;
  final String hintText;

  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20.w,
        ),
        Container(
          margin: EdgeInsets.only(top: 7.h),
          // color: Colors.blue,
          // height: 40,
          width: 24.w,
          child: iconUrl != '' ? Image.asset(iconUrl) : const SizedBox(),
        ),
        SizedBox(
          width: 20.w,
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              errorStyle: kTextStyleRegular.copyWith(fontSize: 12.sp),
              hintText: hintText,
              hintStyle: kTextStyleRegular.copyWith(
                  fontSize: 16.sp, color: kColorBlack2withOpacity75),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorBlack2withOpacity25),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorBlack2withOpacity25),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorBlack2withOpacity25),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorBlack2withOpacity25),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
      ],
    );
  }
}
