import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class CustomTextFieldFullWidthWidget extends StatelessWidget {
  const CustomTextFieldFullWidthWidget({
    // this.iconUrl = '',
    this.hintText = '',
    this.hintTextStyle,
    this.enabledBorderColor = Colors.black,
    this.focusedBorderColor = Colors.black,
    this.isFilled = false,
    this.fillColor = Colors.white,
    this.validator,
    this.controller,
    super.key,
  });

  // final String iconUrl;
  final String hintText;
  final TextStyle? hintTextStyle;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color fillColor;
  final bool isFilled;

  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        errorStyle: kTextStyleRegular.copyWith(fontSize: 12.sp),
        fillColor: fillColor,
        filled: isFilled,
        hintText: hintText,
        hintStyle: hintTextStyle,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kColorBlack2withOpacity25),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kColorBlack2withOpacity25),
        ),
      ),
    );
  }
}
