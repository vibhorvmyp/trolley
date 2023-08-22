import 'package:flutter/material.dart';
import 'package:trolley/models/cart/cart_data_model.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
// import '../../painter/offer_painted_widget.dart';

class CartProductListWidget extends StatelessWidget {
  const CartProductListWidget({
    this.productList = const [],
    super.key,
  });

  final List<CartDataModel> productList;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: screenWidth * 0.065),
      height: screenHeight * 0.375,

      // color: Colors.pink,
      child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.pink.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(
                      screenHeight * 0.01,
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(screenHeight * 0.01875),
                  width: screenWidth * 0.46,
                  height: screenHeight * 0.375,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            height: screenHeight * 0.2,
                            child: Image.asset(productList[index].imgUrl),
                          ),
                          Text(
                            productList[index].title,
                            style: kTextStyleSemiBold.copyWith(
                                fontSize: screenHeight * 0.02,
                                color: kColorBlack2),
                          ),
                          Text(
                            '${productList[index].weight}g',
                            style: kTextStyleMedium.copyWith(
                                fontSize: screenHeight * 0.0175,
                                color: kColorBlack2withOpacity75),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "EGP ${productList[index].originalPrice}",
                                style: kTextStyleRegular.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: const Color(0xFF646464),
                                  fontSize: screenHeight * 0.015,
                                  color: const Color(0xFF646464),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'EGP ',
                                  style: kTextStyleMedium.copyWith(
                                      color: kColorBlack2,
                                      fontSize: screenHeight * 0.0175),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: productList[index].discountedPrice,
                                      style: kTextStyleSemiBold.copyWith(
                                          color: kColorBlack2,
                                          fontSize: screenHeight * 0.02),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: screenHeight * 0.05,
                            height: screenHeight * 0.05,
                            child: Image.asset(
                                'assets/images/home/add_to_cart_icon.png'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // Positioned(
                //   top: 0,
                //   left: 0,
                //   child: Stack(
                //     alignment: Alignment.centerLeft,
                //     children: [
                //       SizedBox(
                //         width: screenWidth * 0.13,
                //         height: screenHeight * 0.025,
                //         child: CustomPaint(
                //           painter: VCutRectanglePainter(
                //               color: const Color(0xFF79A400)),
                //         ),
                //       ),
                //       Container(
                //         margin: EdgeInsets.only(left: screenWidth * 0.013),
                //         child: Text(
                //           '${productList[index].offPercentage}%Off',
                //           style: kTextStyleMedium.copyWith(
                //               color: kColorWhite,
                //               fontSize: screenHeight * 0.01125),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              // color: Colors.red,
              width: screenWidth * 0.039,
            );
          },
          itemCount: productList.length),
    );
  }
}
