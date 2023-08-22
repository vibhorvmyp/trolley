import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/decorations.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/models/home/brands.dart';
import 'package:trolley/models/home/deals.dart';
import 'package:trolley/models/super_categories.dart';
// import 'package:trolley/widgets/common/custom_bottom_button.dart';
import 'package:trolley/widgets/common/custom_bottom_button_with_icon_solid_color.dart';

import '../../widgets/carousel_slider_widget.dart';
import '../../widgets/custom_search_bar.dart';
import '../../widgets/home/newsletter_widget.dart';
import '../../widgets/home_brands_card_widget.dart';
import '../../widgets/home_headings_see_all_widget.dart';
import '../../widgets/home_products_card_widget.dart';
import '../../widgets/home_super_category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
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
                    'Trolley',
                    style: kTextStyleCurlyBold.copyWith(
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
                          ? EdgeInsets.only(
                              left: 25.w,
                            )
                          : EdgeInsets.only(
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
                          ),
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
                hintText: 'What are you looking for? Search here...'.tr,
              ),
            ),

            //Super categories
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    HomeSuperCategoryWidget(
                      superCategoryList: SuperCategories.superCategoryList,
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
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

                    const MyCarouselSlider(),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),

                    //New Products, See all
                    const HomeHeadingSeeAllWidget(
                      headingTitle: 'New Products',
                      iconUrl: 'assets/images/home/new_products_icon.png',
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),

                    //New Products
                    HomeProductCardWidget(
                      productList: Deals.newProductsList,
                    ),

                    //Height 50
                    SizedBox(
                      height: 50.h,
                    ),

                    //Brands we all love, See all
                    const HomeHeadingSeeAllWidget(
                      headingTitle: 'Brands we all love!',
                    ),

                    //Brands Card
                    HomeBrandsCardWidget(
                      productList: Brands.brandsList,
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),

                    //Banner
                    Container(
                      // color: Colors.amber,
                      width: screenSize.width,
                      height: 200.h,
                      margin: EdgeInsets.symmetric(
                        horizontal: 25.h,
                      ),
                      child: Image.asset(
                        'assets/images/home/grocery_sale_banner.png',
                        fit: BoxFit.cover,
                      ),
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),

                    //Order Again, See all
                    const HomeHeadingSeeAllWidget(
                      headingTitle: 'Order Again',
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),

                    //Order Again list
                    HomeProductCardWidget(
                      productList: Deals.orderAgainList,
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),

                    //Must Try, See all
                    const HomeHeadingSeeAllWidget(
                      headingTitle: 'Must Try',
                      iconUrl: 'assets/images/home/must_try_icon.png',
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),
                    //Must Try list
                    HomeProductCardWidget(
                      productList: Deals.mustTryList,
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),
                    //Offers like no other, See all
                    const HomeHeadingSeeAllWidget(
                      headingTitle: 'Offers like no other',
                      iconUrl: 'assets/images/home/order_like.png',
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),

                    //Offers like no other list
                    HomeProductCardWidget(
                      productList: Deals.offersListNoOtherList,
                    ),

                    //25 Height
                    SizedBox(
                      height: 25.h,
                    ),
                    //
                    // const Text('news letter'),

                    //Newsletter
                    const NewsletterWidget(),
                    // const Text('product missing'),

                    SizedBox(
                      height: 25.h,
                    ),

                    //Product Missing
                    Container(
                      margin: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 165.h,
                      width: screenSize.width,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Text(
                                  'Product Missing?'.tr,
                                  style: kTextStyleBold.copyWith(
                                    fontSize: 24.sp,
                                    color: kColorBlack2withOpacity25,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                width: 190.w,
                                child: Text(
                                  "Don’t Worry! We’ll get it for you soon".tr,
                                  style: kTextStyleBold.copyWith(
                                    fontSize: 16.sp,
                                    color: kColorBlack2withOpacity25,
                                  ),
                                ),
                              ),

                              //25 Height
                              SizedBox(
                                height: 25.h,
                              ),

                              //Suggest Product Button
                              GestureDetector(
                                onTap: () {
                                  _openBottomSheet(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 33.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.h),
                                    border: Border.all(
                                      color: kColorMainTheme,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    'Suggest Product'.tr,
                                    style: kTextStyleSemiBold.copyWith(
                                      fontSize: 12.sp,
                                      color: kColorMainTheme,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Image.asset(
                              "assets/images/home/home_specs_gif.gif",
                              height: 164.h,
                              width: 164.h,
                            ),
                          ),
                          // Image.asset('assets/images/home/gold.png')
                        ],
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

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kColorTransparent, // Make the background transparent
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: _buildBottomSheetContent(context));
      },
    );
  }

  Widget _buildBottomSheetContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 580.h,
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
                  height: 560.h,
                  decoration: const BoxDecoration(
                    color: kColorWhite,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 48.h,
                      ),
                      Text(
                        'Suggest Product'.tr,
                        style: kTextStyleSemiBold.copyWith(
                          fontSize: 24.sp,
                          color: kColorBlack2,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Text(
                          'Product missing? Suggest us some products and we will get it soon for you!'
                              .tr,
                          style: kTextStyleRegular.copyWith(
                            fontSize: 16.sp,
                            color: kColorBlack2withOpacity75,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25.w, right: 25.w),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.h),
                          color: const Color(0xFFFFFAED),
                        ),
                        height: 289.h,
                        child: TextField(
                          style: kTextStyleRegular.copyWith(
                              color: kColorBlack2, fontSize: 14.sp),
                          maxLines: null,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFFFFAED),
                            hintText:
                                'Enter the name of the product you would like to see on\nTrolley'
                                    .tr,
                            hintStyle: kTextStyleRegular.copyWith(
                              fontSize: 14.sp,
                              color: kColorBlack2withOpacity50,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: CustomBottomButtonWithIconSolidColor(
                          buttonTitle: 'Send'.tr,
                        ),
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
            ],
          ),
        ),
      ],
    );
  }
}
