import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:get/get_navigation/get_navigation.dart';
import 'package:trolley/views/bottom_app_bar/bottom_app_bar_screen.dart';
import 'package:trolley/views/buy_again/buy_again_screen.dart';
import 'package:trolley/views/cart/cart_screen.dart';
import 'package:trolley/views/categories/categories_screen.dart';
import 'package:trolley/views/home/home_screen.dart';
import 'package:trolley/views/order_details/order_details_screen.dart';
import 'package:trolley/views/order_successfully_placed/order_successfully_placed_screen.dart';
import 'package:trolley/views/orders/orders_screen.dart';
import 'package:trolley/views/profile/profile_screen.dart';
// import 'package:trolley/views/profile/profile_screen.dart';
import 'package:trolley/views/register/register_screen.dart';

import 'localization/languages.dart';
import 'routes/routes.dart';
// import 'views/login/login_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            translations: Languages(),
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en', 'EN'),
            getPages: AppRoute.routes,
            debugShowCheckedModeBanner: false,
            title: 'Trolley',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
              useMaterial3: true,
            ),
            home: BottomAppBarScreen(),
          );
        });
  }
}
