import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';
// import 'custom_textfield_phone_number_widget.dart';

class CustomTextFieldWithIconAndPrefixTextWidget extends StatelessWidget {
  const CustomTextFieldWithIconAndPrefixTextWidget({
    this.iconImgUrl = '',
    this.hintText = '',
    this.prefixText = '',
    this.validator,
    this.controller,
    this.isPhoneNumberFieldFlag = false,
    super.key,
  });

  final String iconImgUrl;
  final String hintText;
  final String prefixText;

  final String? Function(String?)? validator;
  final TextEditingController? controller;

  final bool isPhoneNumberFieldFlag;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 7.h),
          // color: Colors.blue,
          // height: 40,
          width: 24.w,
          child: iconImgUrl != '' ? Image.asset(iconImgUrl) : const SizedBox(),
        ),
        SizedBox(
          width: 20.w,
        ),
        Flexible(
          child: TextFormField(
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            validator: validator,
            inputFormatters: [
              isPhoneNumberFieldFlag == true
                  ? LengthLimitingTextInputFormatter(10)
                  : LengthLimitingTextInputFormatter(50)
            ],
            keyboardType: isPhoneNumberFieldFlag == true
                ? TextInputType.number
                : TextInputType.text,
            decoration: InputDecoration(
              errorStyle: kTextStyleRegular.copyWith(fontSize: 12.sp),
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
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorBlack2withOpacity25),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorBlack2withOpacity25),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
