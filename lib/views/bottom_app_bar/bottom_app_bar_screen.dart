import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/routes/routes.dart';
import 'package:trolley/views/cart/cart_screen.dart';
import 'package:trolley/views/categories/categories_screen.dart';

import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class BottomAppBarScreen extends StatefulWidget {
  const BottomAppBarScreen({Key? key}) : super(key: key);

  @override
  BottomAppBarScreenState createState() => BottomAppBarScreenState();
}

class BottomAppBarScreenState extends State<BottomAppBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    CategoriesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index != 2 && index != 3) {
      setState(() {
        _selectedIndex = index;
      });

      print("Current bottom nav bar index = $_selectedIndex");
    } else if (index == 2) {
      Get.toNamed(cartScreen);
    } else {
      Get.toNamed(profileScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/bottom_app_bar/home_active.png',
              width: 24.w,
            ),
            icon: // Active icon
                Image.asset(
              'assets/images/bottom_app_bar/home_inactive.png',
              width: 24.w,
            ), // Inactive icon

            label: 'Home'.tr,
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/bottom_app_bar/categories_active.png',
              width: 24.w,
            ),
            icon: // Active icon
                Image.asset(
              'assets/images/bottom_app_bar/categories_inactive.png',
              width: 24.w,
            ), // Inactive icon

            label: 'Categories'.tr,
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/bottom_app_bar/cart_inactive.png',
              width: 24.w,
            ),
            icon: // Active icon
                Image.asset(
              'assets/images/bottom_app_bar/cart_inactive.png',
              width: 24.w,
            ), //
            label: 'Cart'.tr,
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/bottom_app_bar/profile_inactive.png',
              width: 24.w,
            ),
            icon: // Active icon
                Image.asset(
              'assets/images/bottom_app_bar/profile_inactive.png',
              width: 24.w,
            ), //
            label: 'Profile'.tr,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kColorMainTheme,
        unselectedItemColor: kColorBlack2,
        selectedIconTheme: IconThemeData(size: 24.w),
        selectedLabelStyle: kTextStyleSemiBold.copyWith(
            fontSize: 12.sp, color: kColorMainTheme),
        unselectedLabelStyle:
            kTextStyleRegular.copyWith(fontSize: 12.sp, color: kColorBlack2),
        onTap: _onItemTapped,
      ),
    );
  }
}
