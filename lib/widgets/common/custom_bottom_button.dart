import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({
    this.imgUrl = '',
    this.title = '',
    super.key,
  });

  final String title;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      width: screenSize.width,
      height: 48.h,
      decoration: BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.circular(5.w),
        border: Border.all(color: kColorMainTheme, width: 2.w),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imgUrl != ''
              ? SizedBox(height: 24.h, width: 24.h, child: Image.asset(imgUrl))
              : const SizedBox(),
          SizedBox(
            width: 8.w,
          ),
          Text(
            title,
            style: kTextStyleSemiBold.copyWith(
                fontSize: 16.sp, color: kColorMainTheme),
          ),
        ],
      ),
    );
  }
}
