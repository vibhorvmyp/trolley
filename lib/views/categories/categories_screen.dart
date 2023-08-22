// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/decorations.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/controllers/categories/categories_controller.dart';
import 'package:trolley/models/categories_model.dart';
// import 'package:trolley/routes/routes.dart';

import '../../widgets/custom_search_bar.dart';
import '../sub_categories/sub_categories_screen.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({
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
                    'Categories'.tr,
                    style: kTextStyleSemiBold.copyWith(
                      color: kColorBlack,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: Get.locale!.languageCode == 'ar'
                          ? EdgeInsets.only(left: 25.w)
                          : EdgeInsets.only(right: 25.w),
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
                        itemCount: CategoriesModel.categoriesList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2 / 2.9,
                          crossAxisCount: 3,
                          crossAxisSpacing: 15.h,
                          mainAxisSpacing: 15.h,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              // Get.toNamed(subCategoriesScreen, );
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SubCategoriesScreen(
                                  categories:
                                      CategoriesModel.categoriesList[index],
                                );
                              }));
                            },
                            child: Container(
                              // color: Colors.red,
                              // decoration: BoxDecoration(
                              //   border: Border.all(color: Colors.black),
                              // ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 15.w, top: 15.h),
                                    child: Text(
                                      CategoriesModel
                                          .categoriesList[index].title,
                                      style: kTextStyleMedium.copyWith(
                                          fontSize: 16.sp, color: kColorBlack2),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 95.h,
                                    width: screenSize.width,
                                    child: Image.asset(CategoriesModel
                                        .categoriesList[index].imgUrl),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
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
