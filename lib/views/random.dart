// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CategoryScreen extends StatelessWidget {
//   const CategoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // CategoryController categoryController = Get.find<CategoryController>();
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
//             decoration: const BoxDecoration(
//                 color: Color(0xff1c1b1b),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.black, spreadRadius: 0.00001, blurRadius: 5)
//                 ]),
//             height: 130.h,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   "Categories",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.w,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 Container(
//                   height: 50.h,
//                   decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.25),
//                       borderRadius: BorderRadius.all(Radius.circular(8.w))),
//                   child: TextFormField(
//                     expands: true,
//                     minLines: null,
//                     maxLines: null,
//                     decoration: InputDecoration(
//                         isDense: true,
//                         // prefixIcon: SvgPicture.asset(
//                         //   "assets/NavBarAssets/search.svg",
//                         //   fit: BoxFit.scaleDown,
//                         // ),
//                         hintText: "Search Here...",
//                         hintStyle: TextStyle(
//                             color: Colors.white.withOpacity(0.5),
//                             fontSize: 18.w),
//                         border: const OutlineInputBorder(),
//                         focusedBorder: const OutlineInputBorder()),
//                     style: TextStyle(
//                         color: Colors.white.withOpacity(0.5), fontSize: 18.w),
//                   ),
//                 ),
//                 // SingleChildScrollView(),
//               ],
//             ),
//           ),
//           Container(
//             height: 500.h,
//             width: double.infinity,
//             padding: EdgeInsets.only(left: 20.w, right: 20.w),
//             child: GridView.count(
//               physics: BouncingScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               crossAxisCount: 3,
//               semanticChildCount: 14,
//               shrinkWrap: true,
//               childAspectRatio: 5.w / 7.5.w,
//               mainAxisSpacing: 8.h,
//               crossAxisSpacing: 7.w,
//               children: [
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.red,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
