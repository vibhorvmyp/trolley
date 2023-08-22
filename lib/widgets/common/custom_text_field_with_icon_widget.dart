import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
// import '../../views/edit_address/edit_address_screen.dart';

class CustomTextFieldWithIconWidget extends StatelessWidget {
  const CustomTextFieldWithIconWidget({
    this.iconImgUrl = '',
    this.hintText = '',
    this.obscureText = false,
    this.validator,
    this.controller,
    super.key,
  });

  final String iconImgUrl;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 7.h),
          // color: Colors.blue,
          // height: 40,
          width: 24.w,
          child: iconImgUrl != '' ? Image.asset(iconImgUrl) : const SizedBox(),
        ),
        SizedBox(
          width: 20.w,
        ),
        Flexible(
          child: TextFormField(
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: hintText.contains('Email')
                ? TextInputType.emailAddress
                : TextInputType.text,
            controller: controller,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
              errorStyle: kTextStyleRegular.copyWith(fontSize: 12.sp),
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
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorBlack2withOpacity25),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorBlack2withOpacity25),
              ),
            ),
          ),
        )
      ],
    );
  }
}
