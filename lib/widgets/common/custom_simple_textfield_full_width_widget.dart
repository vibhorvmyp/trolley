import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class CustomSimpleTextFieldFullWidthWidget extends StatelessWidget {
  const CustomSimpleTextFieldFullWidthWidget({
    // this.iconUrl = '',
    this.hintText = '',
    super.key,
  });

  // final String iconUrl;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
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
