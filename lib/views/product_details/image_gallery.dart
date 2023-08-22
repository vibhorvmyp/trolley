import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:trolley/constants/colors.dart';

List<String> imageList = [
  'assets/images/home/cashews.png',
  'assets/images/product_details/mango.png',
  'assets/images/product_details/mango.png',
  'assets/images/home/carrots.png',
];

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  ImageGalleryState createState() => ImageGalleryState();
}

class ImageGalleryState extends State<ImageGallery> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: imageList.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 45.w, right: 45.w),
                        child: PhotoView(
                          backgroundDecoration:
                              const BoxDecoration(color: Colors.white),
                          imageProvider: AssetImage(imageList[index]),
                          minScale: PhotoViewComputedScale.contained,
                          maxScale: PhotoViewComputedScale.covered * 2.0,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 48.h,
                  width: 48.h,
                  margin: EdgeInsets.only(top: 25.h, right: 25.w),
                  child: Image.asset(
                    'assets/images/product_details/close_icon.png',
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(bottom: 25.h),
                child: _buildThumbnailGallery(),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: _currentIndex == 0
                  ? Container(
                      margin: EdgeInsets.only(left: 25.w),
                      height: 24.h,
                      width: 24.h,
                      child: Image.asset(
                          'assets/images/product_details/arrow_left_faded.png'),
                    )
                  : GestureDetector(
                      onTap: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 25.w),
                        height: 24.h,
                        width: 24.h,
                        child: Image.asset(
                            'assets/images/product_details/arrow_left.png'),
                      ),
                    ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: _currentIndex == imageList.length - 1
                  ? Container(
                      margin: EdgeInsets.only(right: 25.w),
                      height: 24.h,
                      width: 24.h,
                      child: Image.asset(
                          'assets/images/product_details/arrow_right_faded.png'),
                    )
                  : GestureDetector(
                      onTap: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 25.w),
                        height: 24.h,
                        width: 24.h,
                        child: Image.asset(
                            'assets/images/product_details/arrow_right.png'),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnailGallery() {
    return Container(
      color: Colors.transparent,
      // padding: EdgeInsets.only(left: 25),
      // margin: EdgeInsets.only(left: 25.w),
      height: 100.h,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 25.w),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map(
              (entry) {
                final int index = entry.key;
                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 15.w,
                    ),
                    width: 100.h,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: index == _currentIndex
                          ? Border(
                              left: BorderSide(
                                color: kColorMainTheme,
                                width: 3.w,
                              ),
                              bottom: BorderSide(
                                color: kColorMainTheme,
                                width: 3.w,
                              ),
                              top: BorderSide(
                                color: kColorMainTheme,
                                width: 1.w,
                              ),
                              right: BorderSide(
                                color: kColorMainTheme,
                                width: 1.w,
                              ),
                            )
                          : Border.all(
                              color: kColorBlack2withOpacity25,
                              width: 1.w,
                            ),
                      borderRadius: BorderRadius.circular(8.w),
                      image: DecorationImage(
                        image: AssetImage(entry.value),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
