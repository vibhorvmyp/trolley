// import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
// import 'package:trolley/constants/decorations.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/views/product_details/gallery_example_item.dart';
// import 'package:trolley/views/product_details/gallery_photo_view_wrapper.dart';
import 'package:trolley/views/product_details/image_gallery.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';
import 'package:trolley/widgets/common/custom_bottom_button.dart';

import '../../models/home/deals.dart';
import '../../painter/offer_painted_widget.dart';
import '../../widgets/home_headings_see_all_widget.dart';
import '../../widgets/home_products_card_widget.dart';
// import '../../widgets/order/cancel_order_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorBg,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //App Bar
                const CustomAppBarWithBack(
                  title: 'Grocery',
                ),

                SizedBox(
                  height: 15.h,
                ),

                //Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: const ProductCaroselSlider()),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 25.w, right: 25.w, bottom: 15.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Special Tag
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.w),
                                        color: const Color(0xFF79A400)
                                            .withOpacity(0.15),
                                      ),
                                      child: Text(
                                        'Carbide Free',
                                        style: kTextStyleSemiBold.copyWith(
                                          fontSize: 12.sp,
                                          color: const Color(0xFF79A400),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5.h,
                                    ),

                                    Text(
                                      'Mango Alphonso',
                                      style: kTextStyleSemiBold.copyWith(
                                        color: kColorBlack2,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),

                                    Text(
                                      '6 pcs (Approx 1.2kg)',
                                      style: kTextStyleRegular.copyWith(
                                        color: kColorBlack2withOpacity75,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'EGP 199.45',
                                              style: kTextStyleRegular.copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor:
                                                    const Color(0xFF646464),
                                                color: const Color(0xFF646464),
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    text: 'EGP ',
                                                    style: kTextStyleMedium
                                                        .copyWith(
                                                      color: kColorBlack2,
                                                      fontSize: 16.sp,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: '99.45',
                                                        style:
                                                            kTextStyleSemiBold
                                                                .copyWith(
                                                          color: kColorBlack2,
                                                          fontSize: 16.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Stack(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: [
                                                    SizedBox(
                                                      width: 55.w,
                                                      height: 22.h,
                                                      child: CustomPaint(
                                                        painter:
                                                            VCutRectanglePainter(
                                                                color: const Color(
                                                                    0xFF79A400)),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 5.w),
                                                      // margin: EdgeInsets.only(left: screenWidth * 0.013),
                                                      child: Text(
                                                        '15% Off',
                                                        // 'off %',
                                                        style: kTextStyleSemiBold
                                                            .copyWith(
                                                                color:
                                                                    kColorWhite,
                                                                fontSize:
                                                                    10.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 24.w,
                                            vertical: 12.h,
                                          ),
                                          alignment: Alignment.center,
                                          height: 49.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.h),
                                            color: kColorMainTheme,
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(0, 4),
                                                color: Colors.black
                                                    .withOpacity(0.15),
                                                blurRadius: 10,
                                              )
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 24.h,
                                                width: 24.h,
                                                child: Image.asset(
                                                  'assets/images/product_details/add_to_cart.png',
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                'Add to Cart'.tr,
                                                style:
                                                    kTextStyleSemiBold.copyWith(
                                                  fontSize: 18.sp,
                                                  color: kColorWhite,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15.h,
                        ),

                        //About the product card
                        Container(
                          width: screenSize.width,
                          margin: EdgeInsets.only(left: 25.w, right: 25.w),
                          padding: EdgeInsets.all(15.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.h),
                            color: kColorWhite,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About Product'.tr,
                                style: kTextStyleSemiBold.copyWith(
                                  color: kColorBlack2,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),

                              //Dotted Text Widget
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\u2022',
                                    style: kTextStyleRegular.copyWith(
                                      fontSize: 12.sp,
                                      color: kColorBlack2withOpacity75,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Description - Carbide - Free Certified. Alphonsos are loved for their sunshine yellow appearance & delightful taste and are one of the most consumed varieties in India. Alphonso mango got its name from a Portuguese general whose name was ‘Afonso de Albuquerque’. Portuguese were responsible for introducing grafting on mango trees to produce incredible varieties such as Alphonso.',
                                      style: kTextStyleRegular.copyWith(
                                        fontSize: 12.sp,
                                        color: kColorBlack2withOpacity75,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\u2022',
                                    style: kTextStyleRegular.copyWith(
                                      fontSize: 12.sp,
                                      color: kColorBlack2withOpacity75,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Shelf Life - 7 days',
                                      style: kTextStyleRegular.copyWith(
                                        fontSize: 12.sp,
                                        color: kColorBlack2withOpacity75,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //Similar Products
                        SizedBox(
                          height: 25.h,
                        ),

                        //New Products, See all
                        const HomeHeadingSeeAllWidget(
                          headingTitle: 'Similar Products',
                          iconUrl: 'assets/images/home/new_products_icon.png',
                        ),

                        SizedBox(
                          height: 25.h,
                        ),

                        //New Products
                        HomeProductCardWidget(
                          productList: Deals.newProductsList,
                        ),

                        //Similar Products
                        SizedBox(
                          height: 25.h,
                        ),

                        //New Products, See all
                        const HomeHeadingSeeAllWidget(
                          headingTitle: 'You may also like',
                          iconUrl: 'assets/images/home/must_try_icon.png',
                        ),

                        SizedBox(
                          height: 25.h,
                        ),

                        //New Products
                        HomeProductCardWidget(
                          productList: Deals.newProductsList,
                        ),

                        SizedBox(
                          height: 80.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //Custom Button View Cart
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: CustomBottomButton(
                imgUrl: 'assets/images/product_details/view_cart.png',
                title: 'View Cart'.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCaroselSlider extends StatefulWidget {
  const ProductCaroselSlider({super.key});

  @override
  ProductCaroselSliderState createState() => ProductCaroselSliderState();
}

class ProductCaroselSliderState extends State<ProductCaroselSlider> {
  // final List<String> imageList = [
  //   'assets/images/product_details/mango.png',
  //   'assets/images/product_details/mango.png',
  //   'assets/images/product_details/mango.png',
  //   'assets/images/product_details/mango.png',
  // ];

  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // open(context, _currentIndex);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ImageGallery();
            }));
          },
          child: Container(
            height: 250.h,
            width: screenWidth,
            color: Colors.white,
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: false,
                // aspectRatio: 16 / 12,
                // enlargeCenterPage: true,

                // viewportFraction: 0.7,

                // enlargeFactor: 0.2,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: galleryItems
                  .map((item) => Center(
                        child: Container(
                          // margin: const EdgeInsets.symmetric(horizontal: 3),
                          child: Image.asset(
                            imagesList[_currentIndex],
                            fit: BoxFit.cover,
                            // width: 1000,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        SizedBox(height: 25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imagesList.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              width: 10.h,
              height: 10.h,
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: _currentIndex == index
                  ? BoxDecoration(
                      color: kColorMainTheme,
                      borderRadius: BorderRadius.circular(2.w))
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFFAB208).withOpacity(0.25),
                    ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // void open(BuildContext context, final int index) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => GalleryPhotoViewWrapper(
  //         // galleryItems: imagesList,
  //         imagesList: imagesList,
  //         // backgroundDecoration: const BoxDecoration(
  //         //   color: kColorWhite,
  //         // ),
  //         initialIndex: index,
  //         // scrollDirection: verticalGallery ? Axis.vertical : Axis.horizontal,
  //         scrollDirection: Axis.horizontal,
  //       ),
  //     ),
  //   );
  // }
}
