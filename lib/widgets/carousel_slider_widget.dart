import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({super.key});

  @override
  MyCarouselSliderState createState() => MyCarouselSliderState();
}

class MyCarouselSliderState extends State<MyCarouselSlider> {
  final List<String> imageList = [
    'assets/images/home/banner1.png',
    'assets/images/home/banner1.png',
    'assets/images/home/banner1.png',
    'assets/images/home/banner1.png',
  ];

  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 16 / 12,
            enlargeCenterPage: true,
            viewportFraction: 0.7,
            enlargeFactor: 0.2,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: imageList
              .map((item) => Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        // width: 1000,
                      ),
                    ),
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              width: screenHeight * 0.0125,
              height: screenHeight * 0.0125,
              margin: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.0125, horizontal: 2.0),
              decoration: _currentIndex == index
                  ? BoxDecoration(
                      color: kColorMainTheme,
                      borderRadius: BorderRadius.circular(2))
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
}
