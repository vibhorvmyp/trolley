import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
import '../../models/trolley_credit/trolley_credit_model.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({
    this.trolleyTransactionsList = const [],
    super.key,
  });

  final List<TrolleyCreditModel> trolleyTransactionsList;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 16.h,
            ),
            // height: 98.h,
            width: screenSize.width,
            color: kColorWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trolleyTransactionsList[index].status,
                  style: kTextStyleMedium.copyWith(
                    fontSize: 12.sp,
                    color: kColorBlack2,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  trolleyTransactionsList[index].id,
                  style: kTextStyleRegular.copyWith(
                    fontSize: 10.sp,
                    color: kColorBlack2withOpacity75,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      trolleyTransactionsList[index].date,
                      style: kTextStyleRegular.copyWith(
                        fontSize: 10.sp,
                        color: kColorBlack2withOpacity75,
                      ),
                    ),
                    Text(
                      '${trolleyTransactionsList[index].currency}${trolleyTransactionsList[index].amount}',
                      style: kTextStyleSemiBold.copyWith(
                        fontSize: 16.sp,
                        color: trolleyTransactionsList[index].amountColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1.h,
            color: kColorBlack2withOpacity25,
          );
        },
        itemCount: trolleyTransactionsList.length);
  }
}
