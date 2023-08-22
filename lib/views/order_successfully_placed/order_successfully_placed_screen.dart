import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/widgets/common/custom_bottom_button.dart';

// import '../product_details/product_details_screen.dart';

class OrderSuccessfullyPlacedScreen extends StatelessWidget {
  const OrderSuccessfullyPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBg,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150.h,
                      ),

                      //
                      Container(
                          padding: EdgeInsets.only(left: 42.w, right: 42.w),
                          child: Image.asset(
                              'assets/images/order_successfully_placed.png')),

                      SizedBox(
                        height: 100.h,
                      ),

                      Text(
                        'Order Placed Successfully',
                        style: kTextStyleSemiBold.copyWith(
                          fontSize: 24.sp,
                          color: kColorBlack2,
                        ),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),

                      Text(
                        'Thankyou!',
                        style: kTextStyleSemiBold.copyWith(
                          fontSize: 16.sp,
                          color: kColorBlack2withOpacity75,
                        ),
                      ),
                      Text(
                        'Your order has been placed successfully',
                        style: kTextStyleSemiBold.copyWith(
                          fontSize: 16.sp,
                          color: kColorBlack2withOpacity75,
                        ),
                      ),

                      SizedBox(
                        height: 25.h,
                      ),

                      RichText(
                        text: TextSpan(
                          text: 'Your Order Id : ',
                          style: kTextStyleMedium.copyWith(
                            color: kColorBlack2,
                            fontSize: 20.sp,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Trolley2135',
                              style: kTextStyleSemiBold.copyWith(
                                color: kColorBlack2,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            //Custom Button My Orders
            const Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: CustomBottomButton(
                // imgUrl: 'assets/images/product_details/view_cart.png',
                title: 'My Orders',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
