import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
import '../../models/coupons/coupons_model.dart';

class CouponsListWidget extends StatelessWidget {
  const CouponsListWidget({
    this.couponsList = const [],
    super.key,
  });

  final List<CouponsModel> couponsList;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 25.w, right: 25.w),
              height: 185.h,
              // color: Colors.amber,
              child: SvgPicture.asset(
                couponsList[index].svgFrameUrl,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: 45.w,
              bottom: 50.h,
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  couponsList[index].percentOff,
                  style: kTextStyleSemiBold.copyWith(
                      fontSize: 20.sp, color: kColorWhite),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 90.w, right: 25.w),

              padding: EdgeInsets.all(15.h),
              height: 185.h,
              width: screenSize.width,
              // color: Colors.red.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        couponsList[index].title,
                        style: kTextStyleSemiBold.copyWith(
                            fontSize: 16.sp, color: kColorBlack2),
                      ),
                      Text(
                        couponsList[index].savingUpto,
                        style: kTextStyleSemiBold.copyWith(
                          fontSize: 12.sp,
                          color: const Color(
                            0xFF79A400,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 8.h,
                  ),

                  //Details
                  SizedBox(
                    width: 159.w,
                    child: Text(
                      couponsList[index].couponDetail,
                      style: kTextStyleRegular.copyWith(
                          fontSize: 12.sp, color: kColorBlack2),
                    ),
                  ),

                  SizedBox(
                    height: 8.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'T&C Applies',
                        style: kTextStyleRegular.copyWith(
                            fontSize: 10.sp, color: kColorBlack2withOpacity75),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 27.h,
                        width: 105.w,
                        decoration: BoxDecoration(
                          color: kColorMainTheme,
                          borderRadius: BorderRadius.circular(8.h),
                        ),
                        child: Text(
                          'APPLY'.tr,
                          style: kTextStyleSemiBold.copyWith(
                            fontSize: 14.sp,
                            color: kColorWhite,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    color: kColorBlack2withOpacity25,
                    thickness: 0.5.h,
                  ),

                  Text(
                    couponsList[index].vaildityDetail,
                    style: kTextStyleRegular.copyWith(
                        fontSize: 12.sp, color: kColorBlack2withOpacity50),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 15.h,
        );
      },
      itemCount: CouponsModel.couponsList.length,
    );
  }
}
