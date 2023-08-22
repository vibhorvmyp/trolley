import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/controllers/search/search_screen_controller.dart';

// import '../../constants/decorations.dart';
import '../../models/home/deals.dart';
import '../../models/super_categories.dart';
import '../../widgets/custom_search_bar.dart';
import '../../widgets/home_headings_see_all_widget.dart';
import '../../widgets/home_products_card_widget.dart';
import '../../widgets/home_super_category_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchScreenController = Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorWhite,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25.h),
            SizedBox(
              width: 25.w,
            ),
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 25),
              width: screenSize.width,
              padding: EdgeInsets.only(
                bottom: 20.h,
                // right: 25.w,
                // left: 25.w,
              ),
              decoration: const BoxDecoration(
                color: kColorWhite,
                // boxShadow: [kBoxShadowStyle1],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            FocusScope.of(context).unfocus();
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 50,
                            child: Row(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: 25.w,
                                ),
                                Container(
                                  // color: Colors.red,
                                  height: 24.h,
                                  width: 24.h,
                                  child: Image.asset(
                                    'assets/images/arrow_left.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Flexible(
                          child: CustomSearchBar(
                            keyboardType: TextInputType.text,
                            navigateFlag: false,
                            readOnlyFlag: false,
                            controller: searchScreenController
                                .recentSearchTextEditingController,
                            onEditingComplete: () {
                              searchScreenController.addToTextList();
                              log('HEllo');
                              // searchScreenController.recentSearchList.add(
                              //     searchScreenController
                              //         .recentSearchTextEditingController
                              //         .text);

                              log(searchScreenController.recentSearchList
                                  .toString());

                              setState(() {});
                            },
                            // onFieldSubmitted: (value) {
                            //   log('HEllo');
                            //   // searchScreenController.recentSearchList.add(
                            //   //     searchScreenController
                            //   //         .recentSearchTextEditingController
                            //   //         .text);

                            //   log(searchScreenController.recentSearchList
                            //       .toString());
                            // },
                            hintText:
                                'What are you looking for? Search here...'.tr,
                          ),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Text(
                      'Recently searched'.tr,
                      style: kTextStyleMedium.copyWith(
                        fontSize: 14.sp,
                        color: kColorBlack2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    color: kColorWhite,
                    // width: screenSize.width,
                    height: 28.h,
                    child: ListView.separated(
                        padding: EdgeInsets.only(left: 25.w),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(left: 10.w, right: 4.w),
                            height: 28.h,
                            decoration: BoxDecoration(
                              color: kColorMainTheme.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(100.h),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  searchScreenController
                                      .recentSearchList[index],
                                  style: kTextStyleRegular.copyWith(
                                    color: kColorBlack2,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    searchScreenController
                                        .removeRecentSearchText(
                                            searchScreenController
                                                .recentSearchList[index]);

                                    setState(() {});

                                    log(searchScreenController.recentSearchList
                                        .toString());
                                  },
                                  child: Container(
                                    height: 20.h,
                                    width: 20.h,
                                    child: Image.asset(
                                      'assets/images/search_screen/remove_icon.png',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 8.w,
                          );
                        },
                        itemCount:
                            searchScreenController.recentSearchList.length),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 25.w),
                        child: Text(
                          'Categories',
                          style: kTextStyleMedium.copyWith(
                            fontSize: 14.sp,
                            color: kColorBlack2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    HomeSuperCategoryWidget(
                      superCategoryList: SuperCategories.superCategoryList,
                    ),

                    //25 Height
                    SizedBox(
                      height: 35.h,
                    ),

                    //Deal of the day, See all
                    const HomeHeadingSeeAllWidget(
                      headingTitle: 'Deal of the Day',
                      iconUrl: 'assets/images/home/fire_deal.png',
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),

                    //Deal of the the Day list
                    HomeProductCardWidget(
                      productList: Deals.dealsList,
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),

                    //Recommended, See all
                    const HomeHeadingSeeAllWidget(
                      headingTitle: 'Recommended',
                      iconUrl: 'assets/images/home/order_like.png',
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),
                    //Must Try list
                    HomeProductCardWidget(
                      productList: Deals.dealsList,
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
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
