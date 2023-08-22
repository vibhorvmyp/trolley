import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/controllers/categories/categories_controller.dart';
import 'package:trolley/controllers/sub_category/sub_category_controller.dart';
import 'package:trolley/models/categories_model.dart';
// import 'package:trolley/views/product_details/product_details_screen.dart';
// import 'package:trolley/widgets/custom_search_bar.dart';

import '../../constants/decorations.dart';

// import '../../models/product/product_model.dart';
// import '../../painter/offer_painted_widget.dart';
import '../../widgets/common/custom_bottom_button_with_icon_solid_color.dart';
import '../../widgets/common/product_card_widget_with_dropdown.dart';
import '../../widgets/custom_search_bar.dart';
// import '../orders/orders_screen.dart';

enum SortOption {
  relevance,
  priceLowToHigh,
  priceHighToLow,
  discount,
  popularity
}

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen(
      {super.key, this.categories = const CategoriesModel()});

  final CategoriesModel categories;

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  final categoriesController = Get.find<CategoriesController>();
  final subCategoriesController = Get.put(SubCategoryController());

  @override
  void dispose() {
    super.dispose();

    //Reset Selected Tab Index to first tab i.e. 0
    categoriesController.selectedSubCategoryTabIndex.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kColorWhite,
      body: SafeArea(
        child: Stack(
          // alignment: Alignment.bottomRight,
          children: [
            Column(
              children: [
                //App Bar
                Container(
                  // height: 70.h,
                  decoration: BoxDecoration(
                    color: kColorWhite,
                    boxShadow: [
                      kBoxShadowStyle1,
                    ],
                  ),
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                // color: Colors.red,
                                margin: Get.locale!.languageCode == 'ar'
                                    ? EdgeInsets.only(right: 20.w)
                                    : EdgeInsets.only(left: 20.w),
                                height: 24.h,
                                width: 24.w,
                                child: Get.locale!.languageCode == 'ar'
                                    ? Image.asset(
                                        'assets/images/arrow_right.png')
                                    : Image.asset(
                                        'assets/images/arrow_left.png'),
                              ),
                            ],
                          ),
                          Positioned(
                            child: Align(
                              alignment: Get.locale!.languageCode == 'ar'
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
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
                              alignment: Alignment.center,
                              child: Text(
                                widget.categories.title,
                                style: TextStyle(
                                    fontFamily: 'HindMadurai-SemiBold',
                                    fontSize: 24.sp,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      //Custom Search bar

                      Container(
                        // margin: const EdgeInsets.symmetric(horizontal: 25),
                        width: screenSize.width,
                        padding: EdgeInsets.only(
                          bottom: 20.h,
                          right: 25.w,
                          left: 25.w,
                        ),
                        decoration: BoxDecoration(
                          color: kColorWhite,
                          boxShadow: [kBoxShadowStyle1],
                        ),
                        child: CustomSearchBar(
                          readOnlyFlag: true,
                          keyboardType: TextInputType.none,
                          navigateFlag: true,
                          hintText:
                              'What are you looking for? Search here...'.tr,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                Expanded(
                  child: Row(
                    children: [
                      //Left List(Sub Categrories)
                      Container(
                        width: 88.w,
                        height: 700,
                        decoration: BoxDecoration(
                          color: kColorWhite,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(2, 10),
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Container(
                          width: 30,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  color: Colors.white,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: widget.categories
                                        .subCategoryModel.subCategoryTab.length,
                                    itemBuilder: (context, index) {
                                      //Selected One(Make dynamic)
                                      return GestureDetector(
                                        onTap: () {
                                          log('Subcategory tab index = ${index}');

                                          categoriesController
                                              .selectedSubCategoryTabIndex
                                              .value = index;

                                          categoriesController
                                                      .selectedSubCategoryTabIndex
                                                      .value ==
                                                  index
                                              ? log('TRUE')
                                              : log('FALSE');

                                          //For rebuilding the color and color indicator
                                          setState(() {});
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(6.h),
                                              // height: 96.h,
                                              width: 88.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(15.h),
                                                  topRight:
                                                      Radius.circular(15.h),
                                                  bottomLeft:
                                                      Radius.circular(15.h),
                                                ),

                                                //Change this for unselected/selected tab
                                                color: categoriesController
                                                            .selectedSubCategoryTabIndex
                                                            .value ==
                                                        index
                                                    ? kColorMainTheme
                                                        .withOpacity(
                                                        0.15,
                                                      )
                                                    : Colors.white,
                                                // color: Colors.white,
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 46.h,
                                                    width: 46.h,
                                                    child: Image.asset(widget
                                                        .categories
                                                        .subCategoryModel
                                                        .subCategoryTab[index]
                                                        .imgUrl),
                                                    // child: Image.asset(
                                                    //     'assets/images/sub_categories/vegtables.png'),
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Text(
                                                    // 'Fresh Vegetables',
                                                    widget
                                                        .categories
                                                        .subCategoryModel
                                                        .subCategoryTab[index]
                                                        .title,
                                                    textAlign: TextAlign.center,
                                                    style: kTextStyleSemiBold
                                                        .copyWith(
                                                      color: kColorMainTheme,
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            //Selected Indicator
                                            //Change this for unselected/selected tab
                                            Positioned(
                                              bottom: 0.h,
                                              right: 0.w,
                                              child: Container(
                                                height: 38.h,
                                                width: 2.w,
                                                decoration: categoriesController
                                                            .selectedSubCategoryTabIndex
                                                            .value ==
                                                        index
                                                    ? const BoxDecoration(
                                                        color: kColorMainTheme,
                                                      )
                                                    : const BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 15.h,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 5.w,
                      ),

                      //Right List(Product Listing)
                      Obx(
                        () => Expanded(
                          // width: screenSize.width,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  // color: Colors.white,
                                  child: GridView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    // physics: const BouncingScrollPhysics(),
                                    // itemCount: 10,
                                    itemCount: widget
                                        .categories
                                        .subCategoryModel
                                        .subCategoryTab[categoriesController
                                            .selectedSubCategoryTabIndex.value]
                                        .productList
                                        .length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 3.w / 4.5.h,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8.w,
                                      mainAxisSpacing: 8.w,
                                    ),

                                    itemBuilder: (context, index) {
                                      return ProductCardWidgetWithDropdown(
                                        product: widget
                                            .categories
                                            .subCategoryModel
                                            .subCategoryTab[categoriesController
                                                .selectedSubCategoryTabIndex
                                                .value]
                                            .productList[index],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

            //Filter Button
            Positioned(
              bottom: 20.h,
              right: 36.w,
              child: GestureDetector(
                onTap: () {
                  _openBottomSheet(context);
                },
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: kColorMainTheme,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: const Offset(0, 4),
                        color: kColorBlack.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: Image.asset(
                      'assets/images/sub_categories/filter.png',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context) {
    SortOption _sortOption = SortOption.relevance;

    String selectedFilterType = 'Sort'.tr;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kColorTransparent, // Make the background transparent
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Stack(
              children: [
                Container(
                  height: 634.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.h),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 614.h,
                          decoration: const BoxDecoration(
                            color: kColorWhite,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 48.h,
                              ),
                              Container(
                                margin: Get.locale!.languageCode == 'ar'
                                    ? EdgeInsets.only(right: 25.w)
                                    : EdgeInsets.only(left: 25.w),
                                child: Text(
                                  'Filter'.tr,
                                  style: kTextStyleSemiBold.copyWith(
                                    fontSize: 20.sp,
                                    color: kColorBlack2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 48.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Sort Button and Brand Button
                                  Container(
                                    width: 123.w,
                                    child: Column(
                                      children: [
                                        //Sort Button
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedFilterType = 'Sort'.tr;
                                            });
                                          },
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      selectedFilterType.tr ==
                                                              'Sort'.tr
                                                          ? kColorMainTheme
                                                          : kColorWhite,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                  ),
                                                ),
                                                height: 35.h,
                                                width: 123.w,
                                              ),
                                              Container(
                                                height: 38.h,
                                                width: 120.w,
                                                decoration: const BoxDecoration(
                                                  color: kColorWhite,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(3),
                                                    bottomRight:
                                                        Radius.circular(3),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 25,
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'Sort'.tr,
                                                    style: selectedFilterType
                                                                .tr ==
                                                            'Sort'.tr
                                                        ? kTextStyleSemiBold
                                                            .copyWith(
                                                            fontSize: 14.sp,
                                                            color:
                                                                kColorMainTheme,
                                                          )
                                                        : kTextStyleMedium
                                                            .copyWith(
                                                            fontSize: 14.sp,
                                                            color: kColorBlack2,
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        //Brand Button
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedFilterType = 'Brand'.tr;
                                            });
                                          },
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      selectedFilterType.tr ==
                                                              'Brand'.tr
                                                          ? kColorMainTheme
                                                          : kColorWhite,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                  ),
                                                ),
                                                height: 35.h,
                                                width: 123.w,
                                              ),
                                              Container(
                                                height: 38.h,
                                                width: 120.w,
                                                decoration: const BoxDecoration(
                                                  color: kColorWhite,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(3),
                                                    bottomRight:
                                                        Radius.circular(3),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 25,
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'Brand'.tr,
                                                    style: selectedFilterType
                                                                .tr ==
                                                            'Brand'.tr
                                                        ? kTextStyleSemiBold
                                                            .copyWith(
                                                            fontSize: 14.sp,
                                                            color:
                                                                kColorMainTheme,
                                                          )
                                                        : kTextStyleMedium
                                                            .copyWith(
                                                            fontSize: 14.sp,
                                                            color: kColorBlack2,
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //Show Content Based on the Button Selected

                                  selectedFilterType.tr == 'Sort'.tr
                                      ?
                                      //Radio Buttons Section
                                      Container(
                                          // width: MediaQuery.of(context).size.width,
                                          color: Colors.white,
                                          height: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //Sort Radio Buttons
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25.w),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: Radio(
                                                        activeColor:
                                                            kColorMainTheme,
                                                        value: SortOption
                                                            .relevance,
                                                        groupValue: _sortOption,
                                                        onChanged: (SortOption?
                                                            value) {
                                                          setState(() {
                                                            _sortOption =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 16.w,
                                                    ),
                                                    Text(
                                                      'Relevance'.tr,
                                                      style: _sortOption ==
                                                              SortOption
                                                                  .relevance
                                                          ? kTextStyleMedium
                                                              .copyWith(
                                                              color:
                                                                  kColorMainTheme,
                                                              fontSize: 16.sp,
                                                            )
                                                          : kTextStyleRegular
                                                              .copyWith(
                                                              color:
                                                                  kColorBlack2,
                                                              fontSize: 16.sp,
                                                            ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              SizedBox(
                                                height: 25.h,
                                              ),

                                              //Soft price low to high
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25.w),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: Radio(
                                                        activeColor:
                                                            kColorMainTheme,
                                                        value: SortOption
                                                            .priceLowToHigh,
                                                        groupValue: _sortOption,
                                                        onChanged: (SortOption?
                                                            value) {
                                                          setState(() {
                                                            _sortOption =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 16.w,
                                                    ),
                                                    Text(
                                                      'Price ( low to high )'
                                                          .tr,
                                                      style: _sortOption ==
                                                              SortOption
                                                                  .priceLowToHigh
                                                          ? kTextStyleMedium
                                                              .copyWith(
                                                              color:
                                                                  kColorMainTheme,
                                                              fontSize: 16.sp,
                                                            )
                                                          : kTextStyleRegular
                                                              .copyWith(
                                                              color:
                                                                  kColorBlack2,
                                                              fontSize: 16.sp,
                                                            ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              SizedBox(
                                                height: 25.h,
                                              ),

                                              //sort price high to low
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25.w),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: Radio(
                                                        activeColor:
                                                            kColorMainTheme,
                                                        value: SortOption
                                                            .priceHighToLow,
                                                        groupValue: _sortOption,
                                                        onChanged: (SortOption?
                                                            value) {
                                                          setState(() {
                                                            _sortOption =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 16.w,
                                                    ),
                                                    Text(
                                                      'Price ( high to low )'
                                                          .tr,
                                                      style: _sortOption ==
                                                              SortOption
                                                                  .priceHighToLow
                                                          ? kTextStyleMedium
                                                              .copyWith(
                                                              color:
                                                                  kColorMainTheme,
                                                              fontSize: 16.sp,
                                                            )
                                                          : kTextStyleRegular
                                                              .copyWith(
                                                              color:
                                                                  kColorBlack2,
                                                              fontSize: 16.sp,
                                                            ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              SizedBox(
                                                height: 25.h,
                                              ),

                                              //Discount
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25.w),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: Radio(
                                                        activeColor:
                                                            kColorMainTheme,
                                                        value:
                                                            SortOption.discount,
                                                        groupValue: _sortOption,
                                                        onChanged: (SortOption?
                                                            value) {
                                                          setState(() {
                                                            _sortOption =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 16.w,
                                                    ),
                                                    Text(
                                                      'Discount'.tr,
                                                      style: _sortOption ==
                                                              SortOption
                                                                  .discount
                                                          ? kTextStyleMedium
                                                              .copyWith(
                                                              color:
                                                                  kColorMainTheme,
                                                              fontSize: 16.sp,
                                                            )
                                                          : kTextStyleRegular
                                                              .copyWith(
                                                              color:
                                                                  kColorBlack2,
                                                              fontSize: 16.sp,
                                                            ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              SizedBox(
                                                height: 25.h,
                                              ),

                                              //Popularity
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25.w),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: Radio(
                                                        activeColor:
                                                            kColorMainTheme,
                                                        value: SortOption
                                                            .popularity,
                                                        groupValue: _sortOption,
                                                        onChanged: (SortOption?
                                                            value) {
                                                          setState(() {
                                                            _sortOption =
                                                                value!;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 16.w,
                                                    ),
                                                    Text(
                                                      'Popularity'.tr,
                                                      style: _sortOption ==
                                                              SortOption
                                                                  .popularity
                                                          ? kTextStyleMedium
                                                              .copyWith(
                                                              color:
                                                                  kColorMainTheme,
                                                              fontSize: 16.sp,
                                                            )
                                                          : kTextStyleRegular
                                                              .copyWith(
                                                              color:
                                                                  kColorBlack2,
                                                              fontSize: 16.sp,
                                                            ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 15.w,
                                                          right: 15.w),
                                                      height: 40.h,
                                                      child: CustomBrandSearchBar(
                                                          hintText:
                                                              'Search here...'
                                                                  .tr),
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(height: 25.h),
                                              // Text('Hey'),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 25.w),
                                                height: 300,
                                                color: kColorWhite,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      //Checkbox, Brand Title
                                                      ListView.separated(
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          shrinkWrap: true,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return BrandCheckboxTitleWidget(
                                                              brandName:
                                                                  subCategoriesController
                                                                          .brandsList[
                                                                      index],
                                                            );
                                                          },
                                                          separatorBuilder:
                                                              (context, index) {
                                                            return SizedBox(
                                                              height: 16.h,
                                                            );
                                                          },
                                                          itemCount:
                                                              subCategoriesController
                                                                  .brandsList
                                                                  .length)
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 8.w,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: SizedBox(
                            width: 44.h,
                            height: 44.h,
                            child: SvgPicture.asset(
                              'assets/images/home/close_icon.svg',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          // margin: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: CustomBottomButtonWithIconSolidColor(
                              buttonTitle: 'Apply'.tr,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}

class BrandCheckboxTitleWidget extends StatefulWidget {
  const BrandCheckboxTitleWidget({
    this.brandName = '',
    this.isSelected = false,
    super.key,
  });

  final String brandName;
  final bool isSelected;

  @override
  State<BrandCheckboxTitleWidget> createState() =>
      _BrandCheckboxTitleWidgetState();
}

class _BrandCheckboxTitleWidgetState extends State<BrandCheckboxTitleWidget> {
  final subCategoriesController = Get.find<SubCategoryController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Stack(
              children: [
                //Checkbox

                subCategoriesController.selectedBrandsList
                        .contains(widget.brandName)
                    ? Container(
                        height: 18.h,
                        width: 18.h,
                        decoration: BoxDecoration(
                          color: kColorMainTheme,
                          borderRadius: BorderRadius.circular(3.h),
                        ),
                        child: Icon(
                          Icons.check,
                          size: 12.h,
                          color: Colors.white,
                        ),
                      )
                    : Container(
                        height: 18.h,
                        width: 18.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.h,
                            color: kColorMainTheme,
                          ),
                          color: kColorWhite,
                          borderRadius: BorderRadius.circular(3.h),
                        ),
                        child: Icon(
                          Icons.check,
                          size: 12.h,
                          color: Colors.white,
                        ),
                      ),

                Container(
                  height: 18.h,
                  width: 18.h,
                  color: Colors.transparent,
                ),
              ],
            ),

            SizedBox(
              width: 16.w,
            ),

            //Brand Title
            Text(
              widget.brandName,
              style: subCategoriesController.selectedBrandsList
                      .contains(widget.brandName)
                  ? kTextStyleMedium.copyWith(
                      fontSize: 16.sp,
                      color: kColorMainTheme,
                    )
                  : kTextStyleRegular.copyWith(
                      fontSize: 16.sp,
                      color: kColorBlack2,
                    ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            if (subCategoriesController.selectedBrandsList
                .contains(widget.brandName)) {
              subCategoriesController.selectedBrandsList
                  .remove(widget.brandName);
            } else {
              subCategoriesController.selectedBrandsList.add(widget.brandName);
            }

            setState(() {});
          },
          child: Container(
            width: 100,
            height: 18,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}

class CustomBrandSearchBar extends StatelessWidget {
  const CustomBrandSearchBar({
    required this.hintText,
    this.navigateFlag = false,
    this.keyboardType,
    this.readOnlyFlag = false,
    this.controller,
    this.onEditingComplete,
    this.onFieldSubmitted,
    super.key,
  });

  final String hintText;
  final bool navigateFlag;
  final TextInputType? keyboardType;
  final bool readOnlyFlag;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;

  // final searchScreenController =

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context).size;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnlyFlag,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onTap: () {
        // if (navigateFlag != false) {
        //   Get.toNamed(searchScreen);
        //   FocusScope.of(context).unfocus();
        // }
      },
      // onChanged: (value) {},

      style: kTextStyleRegular.copyWith(color: kColorBlack, fontSize: 12.sp),
      decoration: InputDecoration(
        // labelText: 'Densed TextField',
        isDense: false,
        contentPadding: EdgeInsets.all(5.h),
        fillColor: kColorMainTheme.withOpacity(0.04),
        // fillColor: Colors.blue,
        filled: true,
        prefixIcon: Container(
          height: 5.h,
          width: 5.h,
          margin: EdgeInsets.only(
            left: 5.w,
            // right: mediaQuery.width * 0.026,
            top: 10.h,
            bottom: 10.h,
          ),
          child: Image.asset('assets/images/home/search_icon.png'),
        ),
        hintText: hintText,
        hintStyle: kTextStyleRegular.copyWith(
          fontSize: 12.sp,
          color: kColorBlack.withOpacity(0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: const BorderSide(
            color: kColorMainTheme,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            color: kColorMainTheme.withOpacity(0.5),
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
