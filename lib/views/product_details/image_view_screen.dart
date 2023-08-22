import 'package:flutter/material.dart';

import '../../widgets/common/custom_bottom_button.dart';
// import 'package:influencer_app/constants/colors.dart';
// import 'package:influencer_app/widgets/common/back_button_circle_widget.dart';
// import 'package:get/get.dart';

class ImageViewScreen extends StatefulWidget {
  const ImageViewScreen({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaQuery.height * 0.025,
                ),
                // GestureDetector(
                //     onTap: () {
                //       Get.back();
                //     },
                //     child: const BackButtonCircleWidget()),
                SizedBox(
                  // color: Colors.yellow,
                  height: mediaQuery.height * 0.9,
                  child: InteractiveViewer(
                    panEnabled: true, // Set it to false
                    // boundaryMargin: EdgeInsets.all(100),
                    minScale: 0.5,
                    maxScale: 2,
                    child: Container(
                      color: Colors.red,
                      width: mediaQuery.width,
                      child: Image.asset(
                        widget.imageUrl,
                        // width: 200,
                        // height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Custom Button View Cart
            const Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: CustomBottomButton(
                imgUrl: 'assets/images/product_details/view_cart.png',
                title: 'View Cart',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ImageViewScreen extends StatefulWidget {
//   final String imageUrl;

//   ImageViewScreen({required this.imageUrl});

//   @override
//   _ImageViewScreenState createState() => _ImageViewScreenState();
// }

// class _ImageViewScreenState extends State<ImageViewScreen> {
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _controller.dispose();
//   }

//   final PhotoViewController _controller = PhotoViewController();
//   double _zoomLevel = 1.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       body: Column(
//         children: [
//           Container(
//             height: 20,
//             color: Colors.yellow,
//           ),
//           Expanded(
//             child: Flexible(
//               child: GestureDetector(
//                 child: PhotoView(
//                   controller: _controller,
//                   imageProvider: AssetImage(widget.imageUrl),
//                   minScale: 1.0,
//                   maxScale: 5.0,
//                   initialScale: _zoomLevel,
//                   backgroundDecoration: BoxDecoration(
//                     color: kWhiteColor,
//                   ),
//                 ),
//                 onScaleStart: (details) {
//                   // Reset the zoom level when a new zoom gesture begins
//                   setState(() {
//                     _zoomLevel = 1.0;
//                   });
//                 },
//                 onScaleEnd: (details) {
//                   // Store the final zoom level after the zoom gesture ends
//                   final value = _controller.value;
//                   setState(() {
//                     _zoomLevel = value.scale!;
//                   });
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
