import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../models/home/brands.dart';

class HomeBrandsCardWidget extends StatelessWidget {
  const HomeBrandsCardWidget({
    this.productList = const [],
    super.key,
  });

  final List<Brands> productList;

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 25.w, top: 25.h),
      height: 250.h,
      // color: Colors.pink,
      child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.h),
              child: Container(
                color: kColorMainTheme.withOpacity(0.2),
                width: 200.w,
                child: Image.asset(
                  productList[index].imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              // color: Colors.red,
              width: 15.w,
            );
          },
          itemCount: productList.length),
    );
  }
}
