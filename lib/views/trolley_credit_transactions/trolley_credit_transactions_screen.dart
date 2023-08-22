import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../widgets/trolley_credit/transactions_history_tab_widget.dart';
import '../../widgets/trolley_credit/transactions_parent_list_widget.dart';

class TrolleyCreditTransactionsScreen extends StatelessWidget {
  const TrolleyCreditTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBg,
      body: SafeArea(
        child: Column(
          children: [
            //App Bar
            Column(
              children: [
                Container(
                  height: 70.h,
                  decoration: const BoxDecoration(
                    color: kColorWhite,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // color: Colors.red,
                            margin: EdgeInsets.only(left: 20.w),
                            height: 24.h,
                            width: 24.w,
                            child: Image.asset('assets/images/arrow_left.png'),
                          ),
                        ],
                      ),
                      Positioned(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: 60.h,
                              width: 60.w,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Trolley Credit'.tr,
                            style: TextStyle(
                                fontFamily: 'HindMadurai-SemiBold',
                                fontSize: 24.sp,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Tabs
                Container(
                  color: kColorWhite,
                  padding: EdgeInsets.only(
                      left: 32.w, right: 32.w, top: 15.h, bottom: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TransactionHistoryTabWidget(
                        title: 'All'.tr,
                      ),
                      TransactionHistoryTabWidget(
                        title: 'Debits'.tr,
                      ),
                      TransactionHistoryTabWidget(
                        title: 'Credits'.tr,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Today Transaction Tab All

                    TranscationsParentListWidget(),

                    SizedBox(height: 50.h),
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
