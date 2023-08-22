// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/decorations.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/controllers/categories/categories_controller.dart';
// import 'package:trolley/models/categories.dart';
// import 'package:trolley/models/home/deals.dart';
import 'package:trolley/models/product/product_model.dart';
// import 'package:trolley/widgets/common/product_card_widget_main.dart';
// import 'package:trolley/routes/routes.dart';

import '../../widgets/common/product_card_widget_with_dropdown.dart';
import '../../widgets/custom_search_bar.dart';
// import '../sub_categories/sub_categories_screen.dart';

class ProductListingScreen extends StatelessWidget {
  ProductListingScreen({
    super.key,
  });

  final categoryController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorWhite,
      body: SafeArea(
        child: Column(
          children: [
            //App Bar
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: screenSize.width,
                  height: 60.h,
                  // color: Colors.red,
                  child: Text(
                    'New Products'.tr,
                    style: kTextStyleSemiBold.copyWith(
                      color: kColorBlack,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      // color: Colors.red,
                      margin: EdgeInsets.only(left: 20.w, top: 17.h),
                      height: 24.h,
                      width: 24.w,
                      child: Image.asset('assets/images/arrow_left.png'),
                    ),
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();

                        // print('back');
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
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(
                        // right: 25,
                        right: 25.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 28.h,
                            width: 28.w,
                            child: Image.asset(
                                'assets/images/home/translation_icon.png'),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "EN",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  color: kColorBlack2withOpacity75,
                                  offset: const Offset(0, -5),
                                )
                              ],
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
                              decorationColor: kColorBlack2withOpacity75,
                              decorationThickness: 2.h,
                              fontSize: 14.h,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

            //Custom Search bar

            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 25),
              width: screenSize.width,
              padding: EdgeInsets.only(bottom: 15.h, right: 25.w, left: 25.w),
              decoration: BoxDecoration(
                  color: kColorWhite, boxShadow: [kBoxShadowStyle1]),
              child: CustomSearchBar(
                hintText: 'What are you looking for? Search here...'.tr,
              ),
            ),

            //Categories
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // color: Colors.red,
                      margin:
                          EdgeInsets.only(left: 25.w, right: 25.w, top: 25.h),
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: ProductModel.productListFreshVeggies.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2 / 2.9,
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 15.h,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCardWidgetWithDropdown(
                            product:
                                ProductModel.productListFreshVeggies[index],
                          );
                        },
                      ),
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
