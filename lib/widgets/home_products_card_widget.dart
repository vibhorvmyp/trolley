import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../constants/colors.dart';
// import '../constants/textstyles.dart';
// import '../models/home/deals.dart';
// import '../painter/offer_painted_widget.dart';
import 'common/product_card_widget_main.dart';

class HomeProductCardWidget extends StatelessWidget {
  const HomeProductCardWidget({
    this.productList = const [],
    super.key,
  });

  final List<dynamic> productList;

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 25.w),
      height: 300.h,
      // color: Colors.pink,
      child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ProductCardWidgetMain(product: productList[index]);
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
