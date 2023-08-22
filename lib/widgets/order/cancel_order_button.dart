import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class CustomCancelBottomButton extends StatelessWidget {
  const CustomCancelBottomButton({
    super.key,
  });

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
        border: Border.all(
          color: Colors.red,
        ),
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
          Text(
            'Cancel Order'.tr,
            style:
                kTextStyleSemiBold.copyWith(fontSize: 16.sp, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
