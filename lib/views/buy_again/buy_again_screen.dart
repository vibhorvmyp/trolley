// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/decorations.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/controllers/buy_again/buy_again_controller.dart';
// import 'package:trolley/controllers/categories/categories_controller.dart';
import 'package:trolley/models/categories_model.dart';
// import 'package:trolley/routes/routes.dart';

// import '../../models/product/product_model.dart';
// import '../../models/super_categories.dart';
import '../../widgets/common/product_card_widget_with_dropdown.dart';
import '../../widgets/custom_search_bar.dart';
import '../../widgets/home_headings_see_all_widget.dart';
// import '../../widgets/home_super_category_widget.dart';

class BuyAgainScreen extends StatefulWidget {
  const BuyAgainScreen({
    super.key,
  });

  @override
  State<BuyAgainScreen> createState() => _BuyAgainScreenState();
}

class _BuyAgainScreenState extends State<BuyAgainScreen> {
  final buyAgainController = Get.put(BuyAgainController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6E5),
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
                  color: kColorWhite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Buy Again'.tr,
                        style: kTextStyleSemiBold.copyWith(
                          color: kColorBlack,
                          fontSize: 24.sp,
                        ),
                      ),
                      Text(
                        ' (50)',
                        style: kTextStyleMedium.copyWith(
                          color: kColorBlack,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
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
                  hintText: 'What are you looking for? Search here...'.tr),
            ),

            //Buy Again Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: screenSize.width,
                          child: Image.asset(
                            'assets/images/buy_again/banner.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          width: screenSize.width,
                          margin: const EdgeInsets.only(top: 120),
                          decoration: BoxDecoration(
                            color: kColorWhite,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.h),
                              topRight: Radius.circular(16.h),
                            ),
                          ),
                          // height: 1000,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25.h,
                              ),
                              //New Products, See all
                              const HomeHeadingSeeAllWidget(
                                headingTitle: 'Finely Curated',
                                iconUrl:
                                    'assets/images/home/new_products_icon.png',
                                seeAllFlag: false,
                              ),

                              SizedBox(
                                height: 24.h,
                              ),

                              SizedBox(
                                // margin: EdgeInsets.only(top: 25.h),
                                height: 106.h,

                                // color: Colors.pink,
                                child: ListView.separated(
                                  padding: const EdgeInsets.only(left: 25),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        print(CategoriesModel
                                            .buyAgainCategoriesList[index]
                                            .title);

                                        buyAgainController
                                                .selectedCategoryTitle.value =
                                            CategoriesModel
                                                .buyAgainCategoriesList[index]
                                                .title;

                                        buyAgainController.selectedCategoryIndex
                                            .value = index;

                                        setState(() {});
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 8.h),

                                            decoration: buyAgainController
                                                        .selectedCategoryTitle
                                                        .value !=
                                                    CategoriesModel
                                                        .buyAgainCategoriesList[
                                                            index]
                                                        .title
                                                ? const BoxDecoration(
                                                    color: kColorWhite,
                                                  )
                                                : BoxDecoration(
                                                    color: kColorMainTheme,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8.h),
                                                      topRight:
                                                          Radius.circular(8.h),
                                                    ),
                                                  ),
                                            // width: screenWidth * 0.2233,
                                            height: 10.h,
                                            width: 73.w,
                                          ),
                                          Positioned(
                                            top: 2.h,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(top: 8.h),
                                              decoration: buyAgainController
                                                          .selectedCategoryTitle
                                                          .value !=
                                                      CategoriesModel
                                                          .buyAgainCategoriesList[
                                                              index]
                                                          .title
                                                  ? const BoxDecoration(
                                                      color: kColorWhite,
                                                    )
                                                  : BoxDecoration(
                                                      color: const Color(
                                                          0xFFFDF6E5),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                8.h),
                                                        topRight:
                                                            Radius.circular(
                                                                8.h),
                                                      ),
                                                    ),
                                              // width: screenWidth * 0.2233,
                                              height: 106.h,
                                              width: 73.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 48.h,
                                                    width: 48.h,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kColorMainTheme
                                                          .withOpacity(0.25),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.h),
                                                      child: Image.asset(
                                                        CategoriesModel
                                                            .buyAgainCategoriesList[
                                                                index]
                                                            .imgUrl,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    CategoriesModel
                                                        .buyAgainCategoriesList[
                                                            index]
                                                        .title,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style: buyAgainController
                                                                .selectedCategoryTitle
                                                                .value !=
                                                            CategoriesModel
                                                                .buyAgainCategoriesList[
                                                                    index]
                                                                .title
                                                        ? kTextStyleMedium
                                                            .copyWith(
                                                            fontSize: 12.sp,
                                                            color: Colors.black,
                                                          )
                                                        : kTextStyleSemiBold
                                                            .copyWith(
                                                            fontSize: 14.sp,
                                                            color:
                                                                kColorMainTheme,
                                                          ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: CategoriesModel
                                      .buyAgainCategoriesList.length,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 8.w,
                                    );
                                  },
                                ),
                              ),

                              //Product Listing
                              Container(
                                width: screenSize.width,
                                // height: 700,
                                color: const Color(0xFFFDF6E5),
                                child: Container(
                                  // color: Colors.red,
                                  margin: EdgeInsets.only(
                                      left: 25.w, right: 25.w, top: 25.h),
                                  child: GridView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: CategoriesModel
                                        .buyAgainCategoriesList[
                                            buyAgainController
                                                .selectedCategoryIndex.value]
                                        .subCategoryModel
                                        .subCategoryTab
                                        .first
                                        .productList
                                        .length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 2 / 2.9,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15.w,
                                      mainAxisSpacing: 15.h,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ProductCardWidgetWithDropdown(
                                        product: CategoriesModel
                                            .buyAgainCategoriesList[
                                                buyAgainController
                                                    .selectedCategoryIndex
                                                    .value]
                                            .subCategoryModel
                                            .subCategoryTab
                                            .first
                                            .productList[index],
                                      );
                                    },
                                  ),
                                ),
                              ),

                              Container(
                                height: 50.h,
                                color: const Color(0xFFFDF6E5),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
