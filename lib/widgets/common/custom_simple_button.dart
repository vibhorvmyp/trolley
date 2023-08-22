import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class CustomSimpleButton extends StatelessWidget {
  const CustomSimpleButton({
    this.buttonTitle = '',
    super.key,
  });

  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 25.w),
      width: MediaQuery.of(context).size.width,
      height: 48.h,
      decoration: BoxDecoration(
        color: kColorMainTheme,
        borderRadius: BorderRadius.circular(5.h),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonTitle,
            style: kTextStyleSemiBold.copyWith(
                fontSize: 16.sp, color: kColorWhite),
          ),
        ],
      ),
    );
  }
}
