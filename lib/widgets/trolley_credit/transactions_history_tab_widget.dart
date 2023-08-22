import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
import '../../controllers/trolly_credit/trolley_credit_controller.dart';

class TransactionHistoryTabWidget extends StatelessWidget {
  TransactionHistoryTabWidget({
    this.title = '',
    super.key,
  });

  final trolleyCreditsController = Get.find<TrolleyCreditController>();

  final String title;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          trolleyCreditsController.selectedTransationTab.value = title;
          trolleyCreditsController.fetchTransactionList(title);
        },
        child: Container(
          alignment: Alignment.center,
          width: 113.w,
          height: 38.h,
          decoration: BoxDecoration(
            color: trolleyCreditsController.selectedTransationTab.value == title
                ? kColorMainTheme
                : const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(24.h),
          ),
          child: Text(
            title,
            style: kTextStyleSemiBold.copyWith(
              fontSize: 16.sp,
              color:
                  trolleyCreditsController.selectedTransationTab.value == title
                      ? kColorWhite
                      : kColorBlack,
            ),
          ),
        ),
      ),
    );
  }
}
