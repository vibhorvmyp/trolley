import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsBottomIconWidget extends StatelessWidget {
  const ContactUsBottomIconWidget({
    this.imgUrl = '',
    super.key,
  });

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      width: 36.h,
      child: imgUrl != '' ? Image.asset(imgUrl) : const SizedBox(),
    );
  }
}
