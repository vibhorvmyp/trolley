// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../constants/colors.dart';
// import '../../constants/textstyles.dart';

// class CustomTextFieldPhoneNumberWidget extends StatelessWidget {
//   const CustomTextFieldPhoneNumberWidget({
//     // this.iconUrl = '',
//     this.hintText = '',
//     this.prefixText = '',
//     super.key,
//   });

//   // final String iconUrl;
//   final String hintText;
//   final String prefixText;

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
// import 'custom_textfield_phone_number_widget.dart';

class CustomTextFieldPhoneNumberWidget extends StatelessWidget {
  const CustomTextFieldPhoneNumberWidget({
    this.hintText = '',
    this.prefixText = '',
    super.key,
  });

  // final String iconImgUrl;
  final String hintText;
  final String prefixText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            decoration: InputDecoration(
              // isDense: true,
              prefixIcon: Container(
                // color: Colors.red,
                padding: const EdgeInsets.all(0),
                margin: EdgeInsets.only(top: 18.h),
                child: Text(
                  prefixText,
                  style: kTextStyleRegular.copyWith(
                    fontSize: 16.sp,
                    color: kColorBlack2withOpacity75,
                  ),
                ),
              ),
              hintText: hintText,
              hintStyle: kTextStyleRegular.copyWith(
                fontSize: 16.sp,
                color: kColorBlack2withOpacity75,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorBlack2withOpacity25),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorBlack2withOpacity25),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
