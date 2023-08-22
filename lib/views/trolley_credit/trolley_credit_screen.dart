import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/routes/routes.dart';
import 'package:trolley/widgets/common/custom_simple_button.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
import '../../models/trolley_credit/trolley_credit_model.dart';
import '../../widgets/common/custom_app_bar_with_back.dart';
import '../../widgets/common/custom_textfield_full_width_widget.dart';
import '../../widgets/trolley_credit/money_label_widget.dart';
import '../../widgets/trolley_credit/transaction_list_widget.dart';
import '../../widgets/trolley_credit/trolley_credit_banner_widget.dart';

class TrolleyCreditScreen extends StatelessWidget {
  const TrolleyCreditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorBg,
      body: SafeArea(
        child: Column(
          children: [
            //App Bar
            CustomAppBarWithBack(
              title: 'Trolley Credit'.tr,
            ),

            //Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),

                    //Trolley Credit Banner
                    const TrolleyCreditBannerWidget(
                      date: '26th May 2023',
                      balance: '4500',
                    ),

                    SizedBox(
                      height: 25.h,
                    ),

                    //Top Up Section
                    Container(
                      margin: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      padding: EdgeInsets.all(25.h),
                      width: screenSize.width,
                      decoration: BoxDecoration(
                        color: kColorWhite,
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Top Up'.tr,
                            style: kTextStyleSemiBold.copyWith(
                              fontSize: 16.sp,
                              color: kColorBlack2,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            'Add money to your wallet'.tr,
                            style: kTextStyleRegular.copyWith(
                              fontSize: 12.sp,
                              color: kColorBlack2withOpacity75,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //Money Label Widget
                              MoneyLabelWidget(
                                currency: 'EGP ',
                                amount: '1000',
                              ),
                              MoneyLabelWidget(
                                currency: 'EGP ',
                                amount: '1500',
                              ),
                              MoneyLabelWidget(
                                currency: 'EGP ',
                                amount: '2000',
                              ),
                            ],
                          ),
                          CustomTextFieldFullWidthWidget(
                            hintText: '     Enter an amount'.tr,
                            hintTextStyle: kTextStyleRegular.copyWith(
                              fontSize: 12.sp,
                              color: kColorBlack2withOpacity75,
                            ),
                            enabledBorderColor: kColorBlack2withOpacity75,
                            focusedBorderColor: kColorBlack2withOpacity75,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          CustomSimpleButton(
                            buttonTitle: 'Add Money'.tr,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 25.h,
                    ),

                    //Transaction History Section
                    Container(
                      margin: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      padding: EdgeInsets.all(25.h),
                      width: screenSize.width,
                      decoration: BoxDecoration(
                        color: kColorWhite,
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transaction History'.tr,
                                style: kTextStyleSemiBold.copyWith(
                                  fontSize: 16.sp,
                                  color: kColorBlack2,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(trolleyCreditTransactionsScreen);
                                },
                                child: Text(
                                  'See all'.tr,
                                  style: kTextStyleSemiBold.copyWith(
                                    color: kColorMainTheme,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 8.h,
                          ),

                          //Transaction Tab
                          TransactionListWidget(
                            trolleyTransactionsList:
                                TrolleyCreditModel.trolleyCreditList1,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 80.h,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
