import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/textstyles.dart';
import '../models/super_categories.dart';

class HomeSuperCategoryWidget extends StatelessWidget {
  const HomeSuperCategoryWidget({
    this.superCategoryList = const [],
    super.key,
  });

  final List<SuperCategories> superCategoryList;

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      // margin: EdgeInsets.only(top: 25.h),
      height: 132.h,
      // color: Colors.pink,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 25.w),
              // width: screenWidth * 0.2233,
              height: 132.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 86.h,
                    width: 86.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: superCategoryList[index].bgColor),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.h),
                      child: Image.asset(
                        superCategoryList[index].imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 38.h,
                    width: 86.w,
                    padding: EdgeInsets.only(
                      left: 22.w,
                      right: 22.w,
                      // top: 10.h,
                      // bottom: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: superCategoryList[index].textBgColor,
                      borderRadius: BorderRadius.circular(50.w),
                    ),
                    child: Text(
                      SuperCategories.superCategoryList[index].title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: kTextStyleSemiBold.copyWith(
                          fontSize: 10.sp,
                          color: superCategoryList[index].textColor),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: superCategoryList.length),
    );
  }
}
