import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:trolley/constants/colors.dart';

import 'package:trolley/models/coupons/coupons_model.dart';

import '../../widgets/common/custom_app_bar_with_back.dart';
import '../../widgets/coupons/coupons_list_widget.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorBg,
      body: SafeArea(
        child: Column(
          children: [
            //App bar
            CustomAppBarWithBack(
              title: 'Coupons'.tr,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 35.h,
                    ),
                    //Coupon
                    CouponsListWidget(
                      couponsList: CouponsModel.couponsList,
                    ),

                    SizedBox(
                      height: 60.h,
                    ),
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
