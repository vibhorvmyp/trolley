import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/decorations.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/controllers/checkout/checkout_controller.dart';
// import 'package:trolley/models/cart/cart_data_model.dart';
import 'package:trolley/routes/routes.dart';

// import 'package:trolley/widgets/cart/cart_product_list_widget.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';
import 'package:trolley/widgets/common/custom_simple_button.dart';

import '../../constants/colors.dart';
// import '../../widgets/home_headings_see_all_widget.dart';

enum PaymentMethod { cashOnDelivery, card }

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentMethod _paymentMethod = PaymentMethod.cashOnDelivery;

  final checkoutController = Get.find<CheckoutController>();

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: kColorBg,
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  //App bar
                  CustomAppBarWithBack(
                    title: 'Checkout'.tr,
                  ),

                  Container(
                    // alignment: Alignment.center,
                    padding: Get.locale!.languageCode == 'ar'
                        ? EdgeInsets.only(right: 25.w)
                        : EdgeInsets.only(left: 25.w),
                    height: 60.h,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: kColorWhite,
                      boxShadow: [
                        kBoxShadowStyle1,
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 36.h,
                          width: 36.h,
                          child: Image.asset(
                              'assets/images/order_details/ticket.png'),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Free Delivery if order is more than '.tr,
                                  style: kTextStyleSemiBold.copyWith(
                                    color: kColorBlack2,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  'EGP 50',
                                  style: kTextStyleSemiBold.copyWith(
                                    color: kColorBlack2,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Minimum amount to place an order is '.tr,
                                  style: kTextStyleRegular.copyWith(
                                    color: kColorBlack2,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  'EGP 20',
                                  style: kTextStyleRegular.copyWith(
                                    color: kColorBlack2,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //Checkout Main Card
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: EdgeInsets.all(15.h),
                            margin: EdgeInsets.only(
                              left: 25.w,
                              right: 25.w,
                            ),
                            decoration: BoxDecoration(
                              color: kColorWhite,
                              borderRadius: BorderRadius.circular(24.h),
                            ),
                            width: screenWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Checkout'.tr,
                                      style: kTextStyleSemiBold.copyWith(
                                        color: kColorBlack2,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Total Items'.tr,
                                          style: kTextStyleRegular.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        Text(
                                          ' - 2',
                                          style: kTextStyleRegular.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 15.h,
                                ),

                                //Item Bar Card
                                const OrderDetailsItemCardWidget(),

                                //Divider
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 15.h,
                                    bottom: 15.h,
                                  ),
                                  child: Divider(
                                    height: 1.h,
                                    color: kColorBlack2withOpacity25,
                                  ),
                                ),

                                //Item Bar Card
                                const OrderDetailsItemCardWidget(),

                                // SizedBox(
                                //   height: 15,
                                // ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15.h,
                          ),

                          //Billing Details Card
                          Container(
                            padding: EdgeInsets.all(15.h),
                            margin: EdgeInsets.only(
                              left: 25.w,
                              right: 25.w,
                            ),
                            decoration: BoxDecoration(
                              color: kColorWhite,
                              borderRadius: BorderRadius.circular(24.h),
                            ),
                            width: screenWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Billing Details'.tr,
                                      style: kTextStyleSemiBold.copyWith(
                                        color: kColorBlack2,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 15.h,
                                ),

                                //Biiling Details
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Total Items'.tr,
                                              style: kTextStyleRegular.copyWith(
                                                color: kColorBlack2,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                            Text(
                                              ' - 2',
                                              style: kTextStyleRegular.copyWith(
                                                color: kColorBlack2,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'EGP 398.90',
                                              style: kTextStyleRegular.copyWith(
                                                color: kColorBlack2,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor: kColorBlack2,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              'EGP 198.90',
                                              style: kTextStyleMedium.copyWith(
                                                color: kColorBlack2,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 8.h,
                                    ),

                                    //Delivery Charge
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Delivery Charge'.tr,
                                          style: kTextStyleRegular.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'EGP 398.90',
                                              style: kTextStyleRegular.copyWith(
                                                color: kColorBlack2,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor: kColorBlack2,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),

                                            Text(
                                              'Free'.tr,
                                              style: kTextStyleMedium.copyWith(
                                                fontSize: 16.sp,
                                                color: const Color(
                                                  0xFF79A400,
                                                ),
                                              ),
                                            ),
                                            // Text(
                                            //   'EGP 198.90',
                                            //   style: kTextStyleMedium.copyWith(
                                            //     color: kColorBlack2,
                                            //     fontSize: 15,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                //Divider
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 15.h,
                                    bottom: 15.h,
                                  ),
                                  child: Divider(
                                    height: 1.h,
                                    color: kColorBlack2withOpacity25,
                                  ),
                                ),

                                //Biiling Details
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Grand Total'.tr,
                                          style: kTextStyleMedium.copyWith(
                                            color: kColorBlack2,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'EGP 198.90',
                                              style:
                                                  kTextStyleSemiBold.copyWith(
                                                color: kColorBlack2,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 8.h,
                                    ),

                                    //Delivery Charge
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total Savings'.tr,
                                          style: kTextStyleRegular.copyWith(
                                            color: const Color(0xFF79A400),
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'EGP 249.50',
                                              style: kTextStyleMedium.copyWith(
                                                color: const Color(0xFF79A400),
                                                fontSize: 13.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15.h,
                          ),

                          //Address
                          Container(
                            padding: EdgeInsets.all(15.h),
                            margin: EdgeInsets.only(
                              left: 25.w,
                              right: 25.w,
                            ),
                            decoration: BoxDecoration(
                              color: kColorWhite,
                              borderRadius: BorderRadius.circular(24.h),
                            ),
                            width: screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Address'.tr,
                                  style: kTextStyleSemiBold.copyWith(
                                    fontSize: 20.sp,
                                    color: kColorBlack2,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),

                                //Add Address
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(addAddressScreen);
                                  },
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(4.h),
                                    dashPattern: [6.w, 6.w],
                                    color: kColorMainTheme,
                                    strokeWidth: 1.h,
                                    child: Container(
                                      height: 44.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.h),
                                        color: const Color(
                                          0xFFFFFBF1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 24.h,
                                            width: 24.h,
                                            child: Image.asset(
                                              'assets/images/cart/address.png',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.h,
                                          ),
                                          Text(
                                            'Add Address'.tr,
                                            style: kTextStyleSemiBold.copyWith(
                                              color: kColorMainTheme,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15.h,
                          ),

                          //Time Slot
                          Container(
                            padding: EdgeInsets.all(15.h),
                            margin: EdgeInsets.only(
                              left: 25.w,
                              right: 25.w,
                            ),
                            decoration: BoxDecoration(
                              color: kColorWhite,
                              borderRadius: BorderRadius.circular(24.h),
                            ),
                            width: screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Time Slot'.tr,
                                  style: kTextStyleSemiBold.copyWith(
                                    fontSize: 20.sp,
                                    color: kColorBlack2,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),

                                //Time Slots Tabs
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        //Unselected time slot
                                        TimeSlotTabWidget(
                                          timeSlotTitle: '6:00 am to 7:00 am',
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        //Selected time slot
                                        TimeSlotTabWidget(
                                          timeSlotTitle: '8:00 am to 9:00 am',
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        //Unselected time slot
                                        TimeSlotTabWidget(
                                          timeSlotTitle: '5:00 pm to 6:00 pm',
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        //Unselected time slot
                                        TimeSlotTabWidget(
                                          timeSlotTitle: '7:00 pm to 8:00 pm',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15.h,
                          ),

                          //Payment Method
                          Container(
                            padding: EdgeInsets.all(15.h),
                            margin: EdgeInsets.only(
                              left: 25.w,
                              right: 25.w,
                            ),
                            decoration: BoxDecoration(
                              color: kColorWhite,
                              borderRadius: BorderRadius.circular(24.h),
                            ),
                            width: screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment Method'.tr,
                                  style: kTextStyleSemiBold.copyWith(
                                    fontSize: 20.sp,
                                    color: kColorBlack2,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),

                                //Payment Methods
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // height: 100,
                                        // width: 300,
                                        child: ListTileTheme(
                                          horizontalTitleGap: 5.w,
                                          child: RadioListTile(
                                            activeColor: kColorMainTheme,
                                            contentPadding: EdgeInsets.all(2.w),
                                            visualDensity: const VisualDensity(
                                                horizontal: -4.0),
                                            dense: true,
                                            title: Text(
                                              'Cash on Delivery',
                                              style: kTextStyleRegular.copyWith(
                                                fontSize: 16.h,
                                                color: kColorBlack2,
                                              ),
                                            ),
                                            value: PaymentMethod.cashOnDelivery,
                                            groupValue: _paymentMethod,
                                            onChanged: (PaymentMethod? value) {
                                              setState(() {
                                                _paymentMethod = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        // height: 100,
                                        // width: 300,
                                        child: ListTileTheme(
                                          horizontalTitleGap: 5.w,
                                          child: RadioListTile(
                                            activeColor: kColorMainTheme,
                                            contentPadding: EdgeInsets.all(2.w),
                                            visualDensity: const VisualDensity(
                                                horizontal: -4.0),
                                            dense: true,
                                            title: Text(
                                              'Card',
                                              style: kTextStyleRegular.copyWith(
                                                fontSize: 16.h,
                                                color: kColorBlack2,
                                              ),
                                            ),
                                            value: PaymentMethod.card,
                                            groupValue: _paymentMethod,
                                            onChanged: (PaymentMethod? value) {
                                              setState(() {
                                                _paymentMethod = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 80.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Text('Here'),
                ],
              ),
            ),

            // Raise an Enquiry Button
            Positioned(
              bottom: 10.h,
              left: 0.w,
              right: 0.w,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomSimpleButton(
                  buttonTitle: 'Place Order'.tr,
                ),
              ),
            ),
          ],
        ));
  }
}

class TimeSlotTabWidget extends StatelessWidget {
  TimeSlotTabWidget({
    this.timeSlotTitle = '',
    super.key,
  });

  final checkoutController = Get.find<CheckoutController>();

  final String timeSlotTitle;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          checkoutController.timeSlotSelected.value = timeSlotTitle;
        },
        child: Container(
          padding: EdgeInsets.all(10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.h),
            color: checkoutController.timeSlotCheck(timeSlotTitle) == true
                ? kColorMainTheme
                : kColorMainTheme.withOpacity(0.05),
          ),
          child: Text(
            timeSlotTitle,
            style: kTextStyleSemiBold.copyWith(
              color: checkoutController.timeSlotCheck(timeSlotTitle) == true
                  ? kColorWhite
                  : kColorBlack,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class OrderDetailsItemCardWidget extends StatelessWidget {
  const OrderDetailsItemCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      // color: Colors.amberAccent,
      width: screenWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 70.h,
            width: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight * 0.01),
              // border: Border.all(
              //   width: 1,
              //   color: const Color(0xFFFFEBBB),
              // ),
              color: const Color(0xFFFFFAEE),
            ),
            child: Image.asset(
              'assets/images/orders/mango.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Container(
            // color: Colors.pink,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mango Alphonso',
                  style: kTextStyleSemiBold.copyWith(
                    color: kColorBlack2,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  '6 pcs (Approx 1.2kg)',
                  style: kTextStyleRegular.copyWith(
                    color: kColorBlack2withOpacity75,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Container(
                      // color: Colors.amber,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'EGP 199.45',
                            style: kTextStyleRegular.copyWith(
                              color: const Color(0xFF646464),
                              decoration: TextDecoration.lineThrough,
                              decorationColor: const Color(
                                0xFF646464,
                              ),
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'EGP ',
                              style: kTextStyleMedium.copyWith(
                                color: kColorBlack2,
                                fontSize: 12.sp,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '99.45',
                                  style: kTextStyleSemiBold.copyWith(
                                    color: kColorBlack2,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
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
          // Spacer(),
          // Container(
          //   padding: EdgeInsets.all(2),
          //   width: 80.w,
          //   height: 30.h,
          //   color: Color(0xFFF3F3F3),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         decoration: BoxDecoration(color: kColorWhite),
          //         height: 24.h,
          //         width: 24.w,
          //         child: Image.asset('assets/images/cart/minus.png'),
          //       ),
          //       Text(
          //         '1',
          //         style: kTextStyleBold.copyWith(
          //           fontSize: 14.sp,
          //           color: kColorBlack2,
          //         ),
          //       ),
          //       Container(
          //         decoration: BoxDecoration(color: kColorWhite),
          //         height: 24.h,
          //         width: 24.w,
          //         child: Image.asset('assets/images/cart/plus.png'),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
