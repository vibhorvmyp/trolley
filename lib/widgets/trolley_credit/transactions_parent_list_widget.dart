import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
import '../../controllers/trolly_credit/trolley_credit_controller.dart';

class TranscationsParentListWidget extends StatelessWidget {
  TranscationsParentListWidget({
    super.key,
  });

  final trolleyCreditsController = Get.find<TrolleyCreditController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, outerIndex) {
            return Container(
              margin: EdgeInsets.only(top: 25.h, right: 25.w, left: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trolleyCreditsController
                        .selectedTransactionList[outerIndex].entries.first.key
                        .toString(),
                    style: kTextStyleRegular.copyWith(
                      color: kColorBlack2withOpacity75,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  //Transactions Tabs
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, innerIndex) {
                        final todaysList = trolleyCreditsController
                            .selectedTransactionList[outerIndex]
                            .entries
                            .first
                            .value;

                        return Container(
                          padding: EdgeInsets.all(15.h),
                          decoration: BoxDecoration(
                            color: kColorWhite,
                            borderRadius: BorderRadius.circular(4.h),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    todaysList[innerIndex].status,
                                    style: kTextStyleSemiBold.copyWith(
                                      color: kColorBlack2,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  Text(
                                    todaysList[innerIndex].id,
                                    style: kTextStyleRegular.copyWith(
                                      color: kColorBlack2withOpacity75,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    todaysList[innerIndex].date,
                                    style: kTextStyleRegular.copyWith(
                                      color: kColorBlack2withOpacity75,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  Text(
                                    "${todaysList[innerIndex].currency}${todaysList[innerIndex].amount}",
                                    style: kTextStyleSemiBold.copyWith(
                                      color: todaysList[innerIndex].amountColor,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 15.h,
                        );
                      },
                      itemCount: trolleyCreditsController
                          .selectedTransactionList[outerIndex]
                          .entries
                          .first
                          .value
                          .length)
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 25.h,
            );
          },
          itemCount: trolleyCreditsController.selectedTransactionList.length),
    );
  }
}
