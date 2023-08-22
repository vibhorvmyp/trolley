import 'package:flutter/material.dart';

class SuperCategories {
  final String title;
  final String imgUrl;
  final Color textColor;
  final Color textBgColor;
  final Color bgColor;

  SuperCategories(
      {this.title = '',
      this.imgUrl = '',
      this.textColor = Colors.black,
      this.textBgColor = Colors.grey,
      this.bgColor = Colors.green});

  static List<SuperCategories> superCategoryList = [
    SuperCategories(
      title: 'Grocery',
      imgUrl: 'assets/images/categories/grocery.png',
      textColor: Color(0xFF60AB00),
      textBgColor: Color(0xFF60AB00).withOpacity(0.05),
      bgColor: Color(0xFFEAFFE1),
    ),
    SuperCategories(
      title: 'Meats & Chickens',
      imgUrl: 'assets/images/categories/chicken.png',
      textColor: Color(0xFFC79B00),
      textBgColor: Color(0xFFC79B00).withOpacity(0.05),
      bgColor: Color(0xFFFFF6E0),
    ),
    SuperCategories(
      title: 'Dairy Products',
      imgUrl: 'assets/images/categories/dairy.png',
      textColor: Color(0xFF0077E7),
      textBgColor: Color(0xFF0077E7).withOpacity(0.05),
      bgColor: Color(0xFFE0F0FF),
    ),
    SuperCategories(
      title: 'Biscuits & Cookies',
      imgUrl: 'assets/images/categories/cookies.png',
      textColor: Color(0xFF009E64),
      textBgColor: Color(0xFF009E64).withOpacity(0.05),
      bgColor: Color(0xFFE0FFF4),
    ),
    SuperCategories(
      title: 'Cleaning Essentials',
      imgUrl: 'assets/images/categories/cleaning.png',
      textColor: Color(0xFF60AB00),
      textBgColor: Color(0xFF60AB00).withOpacity(0.05),
      bgColor: Color(0xFFEAFFE1),
    ),
    SuperCategories(
      title: 'Snacks',
      imgUrl: 'assets/images/categories/snacks.png',
      textColor: Color(0xFFC79B00),
      textBgColor: Color(0xFFC79B00).withOpacity(0.05),
      bgColor: Color(0xFFFFF6E0),
    ),
    SuperCategories(
      title: 'Makeup & Beauty',
      imgUrl: 'assets/images/categories/makeup_beauty.png',
      textColor: Color(0xFF0077E7),
      textBgColor: Color(0xFF0077E7).withOpacity(0.05),
      bgColor: Color(0xFFE0F0FF),
    ),
    SuperCategories(
      title: 'Bathing Essentials',
      imgUrl: 'assets/images/categories/bathing.png',
      textColor: Color(0xFF009E64),
      textBgColor: Color(0xFF009E64).withOpacity(0.05),
      bgColor: Color(0xFFE0FFF4),
    ),
  ];
}
