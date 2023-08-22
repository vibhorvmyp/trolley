import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class MoneyLabelWidget extends StatelessWidget {
  const MoneyLabelWidget({
    this.amount = '0',
    this.currency = 'EGP ',
    super.key,
  });

  final String amount;
  final String currency;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          200.h,
        ),
        color: const Color(0xFF1C274C).withOpacity(0.05),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: RichText(
        text: TextSpan(
          text: currency,
          style: kTextStyleMedium.copyWith(
            color: kColorBlack2,
            fontSize: 12.sp,
          ),
          children: <TextSpan>[
            TextSpan(
              text: amount,
              style: kTextStyleSemiBold.copyWith(
                color: const Color(0xFF1C274C),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
